//
//  findEyeCentre.h
//  iSee
//
//  Created by Daniel Koehler on 26/01/2014.
//  Copyright (c) 2014 Daniel Koehler. All rights reserved.
//

#ifndef EYE_CENTER_H
#define EYE_CENTER_H

#include "opencv2/imgproc/imgproc.hpp"

cv::Point findEyeCentre(cv::Mat face, cv::Rect eye, cv::Mat& output);

#endif