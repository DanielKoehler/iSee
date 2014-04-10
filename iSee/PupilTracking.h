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

@end
