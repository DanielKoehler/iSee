//
//  helpers.h
//  iSee
//
//  Created by Daniel Koehler on 26/01/2014.
//  Copyright (c) 2014 Daniel Koehler. All rights reserved.
//

#ifndef HELPERS_H
#define HELPERS_H

bool rectInImage(cv::Rect rect, cv::Mat image);
bool inMat(cv::Point p,int rows,int cols);
cv::Mat matrixMagnitude(const cv::Mat &matX, const cv::Mat &matY);
double computeDynamicThreshold(const cv::Mat &mat, double stdDevFactor);

#endif