//
//  findEyeCorner.h
//  iSee
//
//  Created by Daniel Koehler on 26/01/2014.
//  Copyright (c) 2014 Daniel Koehler. All rights reserved.
//

#ifndef EYE_CORNER_H
#define EYE_CORNER_H

#include "opencv2/imgproc/imgproc.hpp"

#define kEyeLeft true
#define kEyeRight false

void createCornerKernels();
void releaseCornerKernels();
cv::Point2f findEyeCorner(cv::Mat region,bool left, bool left2);
cv::Point2f findSubpixelEyeCorner(cv::Mat region, cv::Point maxP);

#endif
