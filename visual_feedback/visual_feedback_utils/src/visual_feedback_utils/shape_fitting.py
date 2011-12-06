#!/usr/bin/env python

##    @package visual_feedback_utils
# 	  Where all model fitting is done (see Miller, ICRA2011)
import roslib
import sys
roslib.load_manifest("visual_feedback_utils")
import rospy
from numpy import *
import pyflann
import math
import cv
import os.path
import pickle
from visual_feedback_utils import Vector2D
from clothing_models import Models

SHOW_CONTOURS = True 			# Draw the contours to the annotated image?
SHOW_INIT_PTS = False 			# Draw the center and top points to the image?
SHOW_UNSCALED_MODEL = False 	# Draw the model (pre-initial scaling) on the annotated image?
SHOW_SCALED_MODEL = False 		# Draw the model (post-initial scaling) on the annotated image?
SHOW_SYMM_MODEL = False 		# Draw the symmetric model (post fitting) on the annotated image?
SHOW_FITTED = False 			# Draw the model whose points are snapped to the contour to the image?

SAVE_ITERS = False 				# Save the iteration annotations to png files? (fairly expensive)?

(BOUNDING, AXIS) = range(2) 	# Determines the method used to compute scale. Can either compute the size of the bounding box, or
SCALE_METHOD = BOUNDING			# The distance from the center of gravity to the nearest contour

#Class responsible for fitting shapes. Initialize with desired parameters, then call fit() to fit to contour
#@arg DIST_FXN distance metric to use (l1 or l2)
#@arg INITIALIZE Whether or not to run the initialization procedure
#@arg ROTATE Whether or not to adjust rotation 
#@arg ORIENT_OPT Whether or not to perform the orientation optimization step 
#@arg SYMM_OPT Whether or not to perform the symmetric optimization step
#@arg ASYMM_OPT Whether or not to perform the symmetric optimization step
#@arg FINE_TUNE Whether or not to perform the fine tuning optimization step
#@arg HIGH_EXPLORATION Makes us jump more drastically after improved iterations
#@arg SHOW Visualize the iterations while they are being performed in a CvNamedWindow
#@arg SILENT Do not print debugging information during the iterations
#@arg num_iters Number of iterations at which the optimization will be forced to end (may end sooner if converged)
#@arg INIT_APPEARANCE Not really used right now; when we are caching images, this forces us to NOT use the cache
class ShapeFitter:
    def __init__(self,
                 DIST_FXN="l2",     INITIALIZE=True,    ROTATE=True,
                 ORIENT_OPT=True,   SYMM_OPT=False,     ASYMM_OPT=True,     FINE_TUNE=False,
                 HIGH_EXPLORATION=False,                SHOW=True,          SILENT=False,
                 num_iters=100):
        if DIST_FXN == "l1":
            self.dist_fxn = l1_norm
        elif DIST_FXN == "l2":
            self.dist_fxn = l2_norm
        else:
            self.dist_fxn = l2_norm
        self.num_iters = num_iters
        self.ORIENT_OPT = ORIENT_OPT
        self.SYMM_OPT = SYMM_OPT
        self.ASYMM_OPT = ASYMM_OPT
        self.FINE_TUNE = FINE_TUNE   
        self.INITIALIZE=INITIALIZE
        self.HIGH_EXPLORATION = HIGH_EXPLORATION
        self.ROTATE=ROTATE
        self.SHOW=SHOW
        self.SILENT = SILENT
        self.flann = pyflann.FLANN()
        
    

    #Returns the nearest points, the model, and the fitted model
    def fit(self,model,contour,img_annotated=None,img=None):
        assert not model.illegal()
        if not img_annotated:
            xs = [x for (x,y) in contour]
            ys = [y for (x,y) in contour]
            width = max(xs) - min(xs)
            height = max(ys) - min(ys)
            cv.Set(img_annotated,cv.CV_RGB(255,255,255))
        model.set_image(cv.CloneImage(img_annotated))
        
        shape_contour = contour
        
        if SHOW_CONTOURS:
            cv.DrawContours(img_annotated,shape_contour,cv.CV_RGB(255,0,0),cv.CV_RGB(255,0,0),0,1,8,(0,0))
        if self.INITIALIZE:
            self.printout("INITIALIZING")
            (real_center,real_top,real_theta,real_scale) = get_principle_info(shape_contour)
            if SHOW_UNSCALED_MODEL:
                model.draw_to_image(img_annotated,cv.CV_RGB(0,0,255))
            model_contour = model.vertices_dense(constant_length=False,density=30)
            (model_center,model_top,model_theta,model_scale) = get_principle_info(model_contour)
            displ = displacement(model_center,real_center)
            
            #Drawing
            if SHOW_INIT_PTS:
                top_img = cv.CloneImage(img_annotated)
                cv.DrawContours(top_img,shape_contour,cv.CV_RGB(255,0,0),cv.CV_RGB(255,0,0),0,1,8,(0,0))
                model.draw_contour(top_img,cv.CV_RGB(0,0,255),2)
                draw_pt(top_img,real_top,cv.CV_RGB(255,0,0))
                draw_pt(top_img,real_center,cv.CV_RGB(255,0,0))
                draw_pt(top_img,model_top,cv.CV_RGB(0,0,255))
                draw_pt(top_img,model_center,cv.CV_RGB(0,0,255))
                cv.NamedWindow("Top")
                cv.ShowImage("Top",top_img)
                cv.WaitKey()
            
            angle = model_theta - real_theta
            if self.ORIENT_OPT:
                angle = 0
            scale = real_scale/float(model_scale)
            if scale < 0.25:
                scale = 1
            model_trans = translate_poly(model.polygon_vertices(),displ)
            model_rot = rotate_poly(model_trans,-1*angle,real_center)
            model_scaled = scale_poly(model_rot,scale,real_center)
               
            #(model_center,model_top,model_theta,model_scale) = get_principle_info(model_scaled)
        
                
                #Do the same to the actual model

            model.translate(displ)
            if self.ROTATE:
                model.rotate(-1*angle,real_center)
            model.scale(scale,real_center)
        
            if SHOW_SCALED_MODEL:
                model.draw_to_image(img_annotated,cv.CV_RGB(0,0,255))
    
        self.printout("Energy is: %f"%model.score(shape_contour))
        self.printout("Shape contour has %d points"%(len(shape_contour)))
        sparse_shape_contour = make_sparse(shape_contour,1000)
            
        #Optimize
        if self.ORIENT_OPT:
            init_model = Models.Orient_Model(model,pi/2)
            orient_model_finished = self.black_box_opt(model=init_model,contour=shape_contour,num_iters = self.num_iters,delta=init_model.preferred_delta(),epsilon = 0.01,mode="orient",image=img) 
            model_oriented = orient_model_finished.transformed_model()
        else:
            model_oriented = model
       
        if self.SYMM_OPT:
           self.printout("SYMMETRIC OPTIMIZATION")
           new_model_symm = self.black_box_opt(model=model_oriented,contour=shape_contour,num_iters = self.num_iters,delta=model.preferred_delta(),epsilon = 0.01,mode="symm",image=img)
        else:
            new_model_symm = model_oriented    
        if SHOW_SYMM_MODEL:
           new_model_symm.draw_to_image(img=img_annotated,color=cv.CV_RGB(0,255,0))
        model=new_model_symm.make_asymm()
        if self.HIGH_EXPLORATION:
            exp_factor = 3.0
        else:
            exp_factor = 1.5
        if self.ASYMM_OPT:
            new_model_asymm = self.black_box_opt(model=model,contour=shape_contour,num_iters=self.num_iters,delta=model.preferred_delta(),exploration_factor=exp_factor,fine_tune=False,mode="asymm",image=img)
        else:
            new_model_asymm = model
        
        if self.FINE_TUNE:
            #tunable_model = model_oriented.make_tunable()
            tunable_model = new_model_asymm.make_tunable()
            final_model = self.black_box_opt(model=tunable_model,contour=shape_contour,num_iters=self.num_iters,delta=5.0,exploration_factor=1.5,fine_tune=False,image=img)
            final_model = final_model.final()
        else:
            final_model = new_model_asymm
        final_model.draw_to_image(img=img_annotated,color=cv.CV_RGB(255,0,255))
        nearest_pts = []
        for vert in final_model.polygon_vertices():
            nearest_pt = min(shape_contour,key=lambda pt: Vector2D.pt_distance(pt,vert))
            cv.Circle(img_annotated,nearest_pt,5,cv.CV_RGB(255,255,255),3)
            nearest_pts.append(nearest_pt)
                
        fitted_model = Models.Point_Model_Contour_Only_Asymm(*nearest_pts)
        #fitted_model = final_model
        if SHOW_FITTED:
            fitted_model.draw_to_image(img=img_annotated,color=cv.CV_RGB(0,255,255))
        return (nearest_pts,final_model,fitted_model)
    

        
        
    def black_box_opt(self,model,contour, delta = 0.1, num_iters = 100, epsilon = 0.001,exploration_factor=1.5,fine_tune=False,num_fine_tunes=0,mode="asymm",image=None):
    
        epsilon = 0.001
        score = -1 * model.score(contour,image)
        self.printout("Initial score was %f"%score)
        params = model.params()
        deltas = [delta for p in params]
        if(self.SHOW):
            cv.NamedWindow("Optimizing")
            img = cv.CloneImage(model.image)
            model.from_params(params).draw_to_image(img,cv.CV_RGB(255,0,0))
            cv.ShowImage("Optimizing",img)
            cv.WaitKey(50)
        for it in range(num_iters):
            self.printout("Starting iteration number %d"%it)
            for i in range(len(params)):
                new_params = list(params)
                new_params[i] += deltas[i]
                new_score = -1 * model.from_params(new_params).score(contour, image)
                if new_score > score:
                    params = new_params
                    score = new_score
                    deltas[i] *= exploration_factor
                else:
                    deltas[i] *= -1
                    new_params = list(params)
                    new_params[i] += deltas[i]
                    new_score = -1 * model.from_params(new_params).score(contour,image)
                    if new_score > score:
                        params = new_params
                        score = new_score
                        deltas[i] *= exploration_factor  
                    else:
                        deltas[i] *= 0.5
            self.printout("Current best score is %f"%score)
            if(self.SHOW):
                img = cv.CloneImage(model.image)
                model.from_params(params).draw_to_image(img,cv.CV_RGB(255,0,0))
                if SAVE_ITERS:
                    cv.SaveImage("%s_iter_%d.png"%(mode,it),img)
                cv.ShowImage("Optimizing",img)
                cv.WaitKey(50)
            if max([abs(d) for d in deltas]) < epsilon:
                self.printout("BREAKING")
                break
        return model.from_params(params)
        
    def printout(self,str):
        if not self.SILENT:
            print str
        
        
def draw_line(img,pt1,pt2):
    line = Vector2D.make_ln_from_pts(pt1,pt2)
    ln_start = Vector2D.intercept(line,Vector2D.horiz_ln(y=0))
    ln_end = Vector2D.intercept(line,Vector2D.horiz_ln(y=img.height))
    cv.Line(img,ln_start,ln_end,cv.CV_RGB(255,0,0),2)
        
def draw_pt(img,pt, color=None):
    if not color:
        color = cv.CV_RGB(255,0,0)
    cv.Circle(img,pt,5,color,-1)

def make_sparse(contour,num_pts = 1000):
        sparsity = int(math.ceil(len(contour) / float(num_pts)))
        sparse_contour = []
        for i,pt in enumerate(contour):
            if i%sparsity == 0:
                sparse_contour.append(pt)
        return sparse_contour

def get_principle_info(shape):

        moments = cv.Moments(shape,0)
        center = get_center(moments)
        
        theta = get_angle(moments)
        (top_pt,scale) = get_top(shape,center,theta)
        return(center,top_pt,theta,scale)

def get_top(shape,center,theta):
        pt = center
        EPSILON = 1.0
        angle = theta
        scale = 0
        (r_x,r_y,r_w,r_h) = cv.BoundingRect(shape)
        if SCALE_METHOD == AXIS:
            top_pt = center
            best_scale = 1
            while(pt[0] > r_x and pt[0] < r_x+r_w and pt[1] > r_y and pt[1] < r_y+r_w):
                print 
                (x,y) = pt
                new_x = x + EPSILON*sin(angle)
                new_y = y - EPSILON*cos(angle)
                pt = (new_x,new_y)
                scale += EPSILON
                if cv.PointPolygonTest(shape,pt,0) > 0:
                    top_pt = pt
                    best_scale = scale
            return (top_pt,best_scale)
        else:
            return ((r_x + r_w/2, r_y),max(r_w,r_h))
    
        
def l2_norm(val):
    return val**2
    
def l1_norm(val):
    return abs(val)
    
    
def drop_off(fxn,limit):
    return lambda val: fxn(min(val,limit))   

def slack(fxn,limit):
    return lambda val: fxn(max(val,limit)-limit)

def avg(lst):
    return float(sum(lst))/len(lst)
    
def displacement(pt1,pt2):
    (x_1,y_1) = pt1
    (x_2,y_2) = pt2
    return (x_2-x_1,y_2-y_1)
    
def translate_pt(pt,trans):
    (x,y) = pt
    (x_displ,y_displ) = trans
    (x_t,y_t) = (x+x_displ,y+y_displ)
    return (x_t,y_t)

def translate_poly(poly,trans):
    return [translate_pt(pt,trans) for pt in poly]

def rotate_pt(pt,angle,origin=(0,0)):
    (x,y) = pt
    (x_o,y_o) = origin
    (x_n,y_n) = (x-x_o,y-y_o)
    off_rot_x = x_n*cos(angle) - y_n*sin(angle)
    off_rot_y = y_n*cos(angle) + x_n*sin(angle)
    rot_x = off_rot_x + x_o
    rot_y = off_rot_y + y_o
    return (rot_x,rot_y)

def rotate_poly(poly,angle,origin=(0,0)):
    return [rotate_pt(pt,angle,origin) for pt in poly]

def scale_pt(pt,amt,origin=(0,0)):
    (x,y) = pt
    (x_o,y_o) = origin
    (x_n,y_n) = (x-x_o,y-y_o)
    (x_ns,y_ns) = (amt*x_n,amt*y_n)
    (x_s,y_s) = (x_ns+x_o,y_ns+y_o)
    return (x_s,y_s)

def scale_poly(poly,amt,origin=(0,0)):
    return [scale_pt(pt,amt,origin) for pt in poly]

    
def get_angle(moments):
    mu11 = cv.GetCentralMoment(moments,1,1)
    mu20 = cv.GetCentralMoment(moments,2,0)
    mu02 = cv.GetCentralMoment(moments,0,2)
    return 1/2.0 * arctan( (2 * mu11 / float(mu20 - mu02)))
    
def get_center(moments):
    m00 = cv.GetSpatialMoment(moments,0,0)
    m10 = cv.GetSpatialMoment(moments,1,0)
    m01 = cv.GetSpatialMoment(moments,0,1)
    x = float(m10) / m00
    y = float(m01) / m00
    return (x,y)
    

