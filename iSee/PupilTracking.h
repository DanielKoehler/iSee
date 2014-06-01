//
//  PupilTracking.h
//  iSee
//
//  Created by Tharshan on 10/04/2014.
//  Copyright (c) 2014 Evangelos Georgiou. All rights reserved.
//

#include "opencv2/objdetect/objdetect.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"


@interface PupilTracking : NSObject

//cv::Point2f findEyeCorner(cv::Mat region,bool left, bool left2);
//cv::Point findEyeCentre(cv::Mat face, cv::Rect eye, cv::Mat& output);
//-(cv::Point2f) findEyeCorner:(cv::Mat) region withLeft:(BOOL) left  withLeft2:(BOOL) left2;
-(cv::Point) findEyeCenter:(cv::Mat) face withEye:(cv::Rect) eye withOutput:(cv::Mat&) output;
-(cv::Point2f) findEyeCorner:(cv::Mat) region withLeft:(bool) left withLeft2:(bool) left2;
-(void) initialiseVars;
-(float) scaledValueForFloat:(float) value withMin:(float) min withMax:(float) max;
-(void) createCornerKernels;
-(void) releaseCornerKernels;
//// Debugging
@property (nonatomic) bool PlotVectorField;
//
//// Size constants
@property (nonatomic) float EyePercentTop;
@property (nonatomic) float EyePercentSide;
@property (nonatomic) float EyePercentHeight;
@property (nonatomic) float EyePercentWidth;
//
//// Preprocessing
@property (nonatomic) bool SmoothFaceImage;
@property (nonatomic) float SmoothFaceFactor;
//
//// Algorithm Parameters
@property (nonatomic) float FastEyeWidth;
@property (nonatomic) float WeightBlurSize;
@property (nonatomic) bool EnableWeight;
@property (nonatomic) float WeightDivisor;
@property (nonatomic) float GradientThreshold;
//
//// Postprocessing
@property (nonatomic) bool EnablePostProcess;
@property (nonatomic) float PostProcessThreshold;
//// [[NSUserDefaults standardUserDefaults] floatForKey:setting[@"name"]]
//// Eye Corner
@property (nonatomic) bool EnableEyeCorner;
@end
