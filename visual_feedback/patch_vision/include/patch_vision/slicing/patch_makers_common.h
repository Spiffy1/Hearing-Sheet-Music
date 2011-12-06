#ifndef PATCH_MAKERS_COMMON_H
#define PATCH_MAKERS_COMMON_H
/*
 * =====================================================================================
 *
 *       Filename:  patch_makers_common.h
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  06/09/2011 02:58:33 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Stephen Miller (stephen), sdmiller@eecs.berkeley.edu
 *        Company:  UC Berkeley
 *
 * =====================================================================================
 */

#include <iostream>
#include <string>
#include <patch_vision/slicing/patch_maker.h>
#include <opencv2/features2d/features2d.hpp>
#include <patch_vision/slicing/pt_io.h>

namespace patch_vision{

using cv::FeatureDetector;
using cv::Ptr;
using cv::KeyPoint;

class RectangularPatch : public PatchDefinition{
    public:
        /* Create a rectangular of size (width, height) whose
         * top left point is at (x,y) */
        RectangularPatch( int x, int y, int width, int height );
        ~RectangularPatch( );

        pair<double, double> center() const;
        void shift_by(int dx, int dy);
        void scale_by(float scale);
        PatchShape shape() const;
        int size() const;
        void extract_from_image(const Mat &image, Mat &patch, Mat &mask) const;

    private:
        int _x, _y, _width, _height;
        
};

class CircularPatch : public PatchDefinition{
    public:
        /* Create a circular patch inscribed in a square
           of size (diameter,diameter) whose top left point is at (x,y) */
        CircularPatch( int x, int y, int diameter );
        CircularPatch( const KeyPoint &kp );
        ~CircularPatch( );

        pair<double, double> center() const;
        void shift_by(int dx, int dy);
        void scale_by(float scale);
        PatchShape shape() const;
        int size() const;
        void extract_from_image(const Mat &image, Mat &patch, Mat &mask) const;

    private:
        int _x, _y, _diameter;
        
};

class KeyPointPatch : public PatchDefinition{
    public:
        /* Create a patch based on a CV keypoint */
        KeyPointPatch( KeyPoint &kp );
        ~KeyPointPatch( );

        pair<double, double> center() const;
        void shift_by(int dx, int dy);
        void scale_by(float scale);
        PatchShape shape() const;
        int size() const;
        void extract_from_image(const Mat &image, Mat &patch, Mat &mask) const;
        
        KeyPoint get_keypoint( ) const;

    private:
        KeyPoint _kp;
        
};



class SlidingWindowPatchMaker : public PatchMaker{
    public:
       SlidingWindowPatchMaker( int width, int height, int step_x, int step_y );
       ~SlidingWindowPatchMaker( );

       void get_patch_definitions( const Mat &image, vector<PatchDefinition* > &patch_definitions ) const;

    private:
       int _width, _height, _step_x, _step_y;
};

class SlidingCirclePatchMaker : public PatchMaker{
    public:
       SlidingCirclePatchMaker( int diameter, int step_x, int step_y );
       ~SlidingCirclePatchMaker( );

       void get_patch_definitions( const Mat &image, vector<PatchDefinition* > &patch_definitions ) const;

    private:
       int _diameter, _step_x, _step_y;
};


class PointsSquarePatchMaker : public PatchMaker{
    public:
        PointsSquarePatchMaker( string input_points_file, int patch_size);
        ~PointsSquarePatchMaker( );
       void get_patch_definitions( const Mat &image, vector<PatchDefinition* > &patch_definitions ) const;

    private:
        PointSet _point_set;
        int _patch_size;             
};

class PointsCirclePatchMaker : public PatchMaker{
    public:
        PointsCirclePatchMaker( string input_points_file, int patch_size);
        ~PointsCirclePatchMaker( );
       void get_patch_definitions( const Mat &image, vector<PatchDefinition* > &patch_definitions ) const;

    private:
        PointSet _point_set;
        int _patch_size;             
};

class CVPatchMaker : public PatchMaker{
    public:
        CVPatchMaker( string type );
        ~CVPatchMaker( );
        void get_patch_definitions( const Mat &image, vector<PatchDefinition*> &patch_definitions ) const;
        void set_bounds( int min_patch_size, int max_patch_size );

    private:
        bool is_within_bounds ( const KeyPoint &kp ) const;

        Ptr<FeatureDetector> _detector;
        int _min_patch_size;
        int _max_patch_size;
};

class SIFTPatchMaker : public CVPatchMaker{
    public:
        SIFTPatchMaker( );
        ~SIFTPatchMaker( );
};

class MSERPatchMaker: public CVPatchMaker{
    public:
        MSERPatchMaker( );
        ~MSERPatchMaker( );
};

class STARPatchMaker: public CVPatchMaker{
    public:
        STARPatchMaker( );
        ~STARPatchMaker( );
};
class SURFPatchMaker: public CVPatchMaker{
    public:
        SURFPatchMaker( );
        ~SURFPatchMaker( );
};

/*  The Dense Interest Point Patch Maker */
/*  Assumes only the centers will be altered */
class DIPPatchMaker : public PatchMaker{
    public:
        DIPPatchMaker( PatchMaker* dense_patch_maker );
        ~DIPPatchMaker( );
        void get_patch_definitions( const Mat &image, vector<PatchDefinition*> &patch_definitions ) const;
        void refine_patch_definitions( const Mat &image, 
                vector<PatchDefinition*> &patch_definitions ) const;
    private:
        virtual void rank_patch_centers( const Mat &image, Mat &rank_image ) const = 0;
        PatchMaker* _dense_patch_maker; 
};

class DOGPatchMaker : public DIPPatchMaker{
    public:
        DOGPatchMaker( PatchMaker* dense_patch_maker, int k1, int k2 );
        ~DOGPatchMaker( );

    private:
        void rank_patch_centers( const Mat &image, Mat &rank_image ) const;
        int _k1, _k2;
};
    
};

#endif
