#!/usr/bin/env python
import roslib
roslib.load_manifest("patch_vision")
import cv
from patch_vision.utils.formulas import get_rect_vertices

SHAPES = ["SQUARE", "CIRCLE"]

def draw_patch( image, ctr, shape, size, color, filled = False, thickness = 1 ):
    if shape == "SQUARE":
        v1,v2 = get_rect_vertices(ctr, size[0], size[1])
        cv.Rectangle( image, v1, v2, color, -1 if filled else thickness )
    elif shape == "CIRCLE":
        cv.Circle( image, (int(ctr[0]),int(ctr[1])), int(size[0])/2, color, -1 if filled else thickness )

class FeatureMap:
    def __init__(self):
        self.patch_size = None
        self.shapes = {}
        self.sizes = {}
        self.features = {}
        self.labels = {}
        
    def set_patch_size(self, size):
        self.patch_size = size

    def add_feature(self, location, shape, size, feature, label=-1):
        self.shapes[location] = shape
        self.sizes[location] = size
        self.features[location] = feature
        self.labels[location] = label

    def get_shape(self, location):
        try:
            return self.shapes[location]
        except:
            raise Exception("That location has no associated feature")
        
    def get_size(self, location):
        try:
            return self.sizes[location]
        except:
            raise Exception("That location has no associated feature")
    
    def get_feature(self, location):
        try:
            return self.features[location]
        except:
            raise Exception("That location has no associated feature")

    def get_label(self, location):
        try:
            return self.labels[location]
        except:
            raise Exception("That location has no associated label")

    def get_feature_points(self):
        return self.features.keys()

    def save_to_file(self, filename):
        f = open(filename,'w')
        f.write("%d\n"%len(self.get_feature_points()))
        for pt in self.get_feature_points():
            f.write("%f %f"%(pt[0],pt[1]))
            f.write("\t")
            shape = self.get_shape(pt)
            f.write("%s "%shape)
            size = self.get_size(pt)
            f.write("%f %f"%(size[0], size[1]) )
            f.write("\t")
            feature = self.get_feature(pt)
            f.write( "%d "%len(feature))
            for val in feature:
                f.write("%f "%val)
            f.write("\t")
            label = self.get_label(pt)
            f.write("%d"%label)
            f.write("\n")
        f.close()

    def read_from_file(self, filename):
        f = open(filename,'r')
        for i,ln in enumerate(f.readlines()):
            if i == 0:
                continue
            str_vals = ln.split()
            pt = (float(str_vals[0]),float(str_vals[1]))
            shape = str_vals[2]
            patch_size = (float(str_vals[3]), float(str_vals[4]))
            num_features = int(float(str_vals[5]));
            feature = [float(val) for val in str_vals[6:6+num_features]]
            #Backwards compatibility -- remove later
            if len(str_vals) > 6+num_features:
                label = int(float(str_vals[6+num_features]))
            else:
                label = -1
            assert len(feature) == num_features
            self.add_feature(pt, shape, patch_size, feature, label)
        f.close()

