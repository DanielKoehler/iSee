//
//  PupilTracking.m
//  iSee
//
//  Created by Tharshan on 10/04/2014.
//  Copyright (c) 2014 Evangelos Georgiou. All rights reserved.
//

#import "PupilTracking.h"
#include <queue>

@implementation PupilTracking

-(void) initialiseVars {
  NSLog(@"init");
  NSArray* properties = @[
                          @{@"name": @"Enable Eye Corner",
                            @"reuseIdentifier": @"switchCell",
                            },
                          @{@"name": @"Enable Weight",
                            @"reuseIdentifier": @"switchCell",
                            },
                          @{@"name": @"Gradient Threshold",
                            @"reuseIdentifier": @"sliderCell",
                            @"min":[NSNumber numberWithFloat:0],
                            @"max":[NSNumber numberWithFloat:100]
                            },
                          @{@"name": @"Weight Divisor",
                            @"reuseIdentifier": @"sliderCell",
                            @"min":[NSNumber numberWithFloat:50],
                            @"max":[NSNumber numberWithFloat:200]
                            },
                          @{@"name": @"Weight Blur Size",
                            @"reuseIdentifier": @"sliderCell",
                            @"min":[NSNumber numberWithFloat:1],
                            @"max":[NSNumber numberWithFloat:10]
                            },
                          @{@"name": @"Fast Eye Width",
                            @"reuseIdentifier": @"sliderCell",
                            @"min":[NSNumber numberWithFloat:10],
                            @"max":[NSNumber numberWithFloat:100]
                            },
                          @{@"name": @"Smooth Face Image",
                            @"reuseIdentifier": @"switchCell",
                            },
                          @{@"name": @"Smooth Face Factor",
                            @"reuseIdentifier": @"sliderCell",
                            @"min":[NSNumber numberWithFloat:0.01],
                            @"max":[NSNumber numberWithFloat:0.10]
                            },
                          @{@"name": @"Eye Percent Width",
                            @"reuseIdentifier": @"sliderCell",
                            @"min":[NSNumber numberWithFloat:10],
                            @"max":[NSNumber numberWithFloat:100]
                            },
                          @{@"name": @"Eye Percent Height",
                            @"reuseIdentifier": @"sliderCell",
                            @"min":[NSNumber numberWithFloat:10],
                            @"max":[NSNumber numberWithFloat:100]
                            },
                          @{@"name": @"Eye Percent Side",
                            @"reuseIdentifier": @"sliderCell",
                            @"min":[NSNumber numberWithFloat:10],
                            @"max":[NSNumber numberWithFloat:100]
                            },
                          @{@"name": @"Eye Percent Top",
                            @"reuseIdentifier": @"sliderCell",
                            @"min":[NSNumber numberWithFloat:10],
                            @"max":[NSNumber numberWithFloat:100]
                            },
                          @{@"name": @"Plot Vector Field",
                            @"reuseIdentifier": @"switchCell",
                            @"min":[NSNumber numberWithFloat:10],
                            @"max":[NSNumber numberWithFloat:100]
                            }
                        ];
  for (NSDictionary *property in properties) {
    
    float value = [[NSUserDefaults standardUserDefaults] floatForKey:property[@"name"]];
    if([property[@"reuseIdentifier"]  isEqual: @"sliderCell"]) {
      //float min = [property[@"min"] floatValue];
      //float max = [property[@"max"] floatValue];
      [self setValue:[NSString stringWithFormat:@"%f", value] forKeyPath:[NSString stringWithFormat:@"self.%@",[property[@"name"] stringByReplacingOccurrencesOfString:@" " withString:@""]]];
    }else{
      [self setValue:[NSString stringWithFormat:@"%f", value] forKeyPath:[NSString stringWithFormat:@"self.%@",[property[@"name"] stringByReplacingOccurrencesOfString:@" " withString:@""]]];
    }
    NSLog(@"%@:%@",property[@"name"],[self valueForKeyPath:[NSString stringWithFormat:@"self.%@",[property[@"name"] stringByReplacingOccurrencesOfString:@" " withString:@""]]]);
  
    
  };
  
}

-(float) scaledValueForFloat:(float) value withMin:(float) min withMax:(float) max {
  return value * max;
};

-(cv::Point) findEyeCenter:(cv::Mat) face withEye:(cv::Rect) eye withOutput:(cv::Mat&) output {
  cv::Mat eyeROIUnscaled = face(eye);
  cv::Mat eyeROI;
  //scaleToFastSize(eyeROIUnscaled, eyeROI);
  [self scaleToFastSize:eyeROIUnscaled withDestination:eyeROI];
  // draw eye region
  rectangle(face,eye,1234);
  //-- Find the gradient
  cv::Mat gradientX = [self computeMatXGradient:eyeROI];
  
  cv::Mat gradientY = [self computeMatXGradient:eyeROI.t()].t();
  
  //-- Normalize and threshold the gradient
  // compute all the magnitudes
  cv::Mat mags = [self matrixMagnitude:gradientX withY:gradientY];
  //compute the threshold
  double gradientThresh = [self computeDynamicThreshold:mags withSD:_GradientThreshold];
  //double gradientThresh = kGradientThreshold;
  //double gradientThresh = 0;
  //normalize
  for (int y = 0; y < eyeROI.rows; ++y) {
    double *Xr = gradientX.ptr<double>(y), *Yr = gradientY.ptr<double>(y);
    const double *Mr = mags.ptr<double>(y);
    for (int x = 0; x < eyeROI.cols; ++x) {
      double gX = Xr[x], gY = Yr[x];
      double magnitude = Mr[x];
      if (magnitude > gradientThresh) {
        Xr[x] = gX/magnitude;
        Yr[x] = gY/magnitude;
      } else {
        Xr[x] = 0.0;
        Yr[x] = 0.0;
      }
    }
  }
  //  imshow(debugWindow,gradientX);
  
  //-- Create a blurred and inverted image for weighting
  cv::Mat weight;
  GaussianBlur( eyeROI, weight, cv::Size(_WeightBlurSize, _WeightBlurSize ), 0, 0 );
  for (int y = 0; y < weight.rows; ++y) {
    unsigned char *row = weight.ptr<unsigned char>(y);
    for (int x = 0; x < weight.cols; ++x) {
      row[x] = (255 - row[x]);
    }
  }
  //imshow(debugWindow,weight);
  //-- Run the algorithm!
  cv::Mat outSum = cv::Mat::zeros(eyeROI.rows,eyeROI.cols,CV_64F);
  // for each possible center
  printf("Eye Size: %ix%i\n",outSum.cols,outSum.rows);
  for (int y = 0; y < weight.rows; ++y) {
    const unsigned char *Wr = weight.ptr<unsigned char>(y);
    const double *Xr = gradientX.ptr<double>(y), *Yr = gradientY.ptr<double>(y);
    for (int x = 0; x < weight.cols; ++x) {
      double gX = Xr[x], gY = Yr[x];
      if (gX == 0.0 && gY == 0.0) {
        continue;
      }
      [self testPossibleCentersFormula:x withY:y withWeight:Wr[x] withgx:gX withgy:gY withOutput:outSum];
    }
  }
  // scale all the values down, basically averaging them
  double numGradients = (weight.rows*weight.cols);
  cv::Mat out;
  outSum.convertTo(out, CV_32F,1.0/numGradients);
  //imshow(debugWindow,out);
  //-- Find the maximum point
  cv::Point maxP;
  double maxVal;
  cv::minMaxLoc(out, NULL,&maxVal,NULL,&maxP);
  //-- Flood fill the edges
  if(_EnablePostProcess) {
    cv::Mat floodClone;
    //double floodThresh = computeDynamicThreshold(out, 1.5);
    double floodThresh = maxVal * _PostProcessThreshold;
    cv::threshold(out, floodClone, floodThresh, 0.0f, cv::THRESH_TOZERO);
    if(_PlotVectorField) {
      //plotVecField(gradientX, gradientY, floodClone);
      //imwrite("eyeFrame.png",eyeROIUnscaled);
    }
    cv::Mat mask = [self floodKillEdges:floodClone];
    //imshow(debugWindow + " Mask",mask);
    //imshow(debugWindow,out);
    // redo max
    cv::minMaxLoc(out, NULL,&maxVal,NULL,&maxP,mask);
  }
  return [self unscalePoint:maxP withSize:eye];
}

-(void) scaleToFastSize:(const cv::Mat&) src withDestination:(cv::Mat&) dst {
  cv::resize(src, dst, cv::Size(_FastEyeWidth,(((float)_FastEyeWidth)/src.cols) * src.rows));
}

-(cv::Mat) computeMatXGradient:(const cv::Mat&) mat {
  cv::Mat out(mat.rows,mat.cols,CV_64F);
  
  for (int y = 0; y < mat.rows; ++y) {
    const uchar *Mr = mat.ptr<uchar>(y);
    double *Or = out.ptr<double>(y);
    
    Or[0] = Mr[1] - Mr[0];
    for (int x = 1; x < mat.cols - 1; ++x) {
      Or[x] = (Mr[x+1] - Mr[x-1])/2.0;
    }
    Or[mat.cols-1] = Mr[mat.cols-1] - Mr[mat.cols-2];
  }
  
  return out;
}

-(cv::Mat) matrixMagnitude:(const cv::Mat&) matX withY:(const cv::Mat&) matY {
  cv::Mat mags(matX.rows,matX.cols,CV_64F);
  for (int y = 0; y < matX.rows; ++y) {
    const double *Xr = matX.ptr<double>(y), *Yr = matY.ptr<double>(y);
    double *Mr = mags.ptr<double>(y);
    for (int x = 0; x < matX.cols; ++x) {
      double gX = Xr[x], gY = Yr[x];
      double magnitude = sqrt((gX * gX) + (gY * gY));
      Mr[x] = magnitude;
    }
  }
  return mags;
}

-(double) computeDynamicThreshold:(const cv::Mat&) mat withSD:(double) stdDevFactor {
  cv::Scalar stdMagnGrad, meanMagnGrad;
  cv::meanStdDev(mat, meanMagnGrad, stdMagnGrad);
  double stdDev = stdMagnGrad[0] / sqrt(mat.rows*mat.cols);
  return stdDevFactor * stdDev + meanMagnGrad[0];
}

-(void) testPossibleCentersFormula:(int) x withY:(int) y withWeight:(unsigned char) weight withgx:(double) gx withgy:(double) gy withOutput:(cv::Mat&) out {
  // for all possible centers
  for (int cy = 0; cy < out.rows; ++cy) {
    double *Or = out.ptr<double>(cy);
    for (int cx = 0; cx < out.cols; ++cx) {
      if (x == cx && y == cy) {
        continue;
      }
      // create a vector from the possible center to the gradient origin
      double dx = x - cx;
      double dy = y - cy;
      // normalize d
      double magnitude = sqrt((dx * dx) + (dy * dy));
      dx = dx / magnitude;
      dy = dy / magnitude;
      double dotProduct = dx*gx + dy*gy;
      dotProduct = std::max(0.0,dotProduct);
      // square and multiply by the weight
      if (_EnableWeight) {
        Or[cx] += dotProduct * dotProduct * (weight/_WeightDivisor);
      } else {
        Or[cx] += dotProduct * dotProduct;
      }
    }
  }
}
// returns a mask
-(cv::Mat) floodKillEdges:(cv::Mat&) mat {
  rectangle(mat,cv::Rect(0,0,mat.cols,mat.rows),255);
  
  cv::Mat mask(mat.rows, mat.cols, CV_8U, 255);
  std::queue<cv::Point> toDo;
  toDo.push(cv::Point(0,0));
  while (!toDo.empty()) {
    cv::Point p = toDo.front();
    toDo.pop();
    if (mat.at<float>(p) == 0.0f) {
      continue;
    }
    // add in every direction
    cv::Point np(p.x + 1, p.y); // right
    if ([self floodShouldPushPoint:np withMat:mat]) toDo.push(np);
    np.x = p.x - 1; np.y = p.y; // left
    if ([self floodShouldPushPoint:np withMat:mat]) toDo.push(np);
    np.x = p.x; np.y = p.y + 1; // down
    if ([self floodShouldPushPoint:np withMat:mat]) toDo.push(np);
    np.x = p.x; np.y = p.y - 1; // up
    if ([self floodShouldPushPoint:np withMat:mat]) toDo.push(np);
    // kill it
    mat.at<float>(p) = 0.0f;
    mask.at<uchar>(p) = 0;
  }
  return mask;
}

-(bool) floodShouldPushPoint:(const cv::Point&) np withMat:(const cv::Mat&) mat {
  return [self inMat:np withRows:mat.rows withCols:mat.cols];
}

-(bool) inMat:(cv::Point) p withRows:(int) rows withCols:(int) cols {
  return p.x >= 0 && p.x < cols && p.y >= 0 && p.y < rows;
}

-(cv::Point) unscalePoint:(cv::Point) p withSize:(cv::Rect) origSize {
  float ratio = (((float)_FastEyeWidth)/origSize.width);
  int x = round(p.x / ratio);
  int y = round(p.y / ratio);
  return cv::Point(x,y);
}



cv::Mat *leftCornerKernel;
cv::Mat *rightCornerKernel;

// not constant because stupid opencv type signatures
float kEyeCornerKernel[4][6] = {
  {-1,-1,-1, 1, 1, 1},
  {-1,-1,-1,-1, 1, 1},
  {-1,-1,-1,-1, 0, 3},
  { 1, 1, 1, 1, 1, 1},
};

-(void) createCornerKernels {
  rightCornerKernel = new cv::Mat(4,6,CV_32F,kEyeCornerKernel);
  leftCornerKernel = new cv::Mat(4,6,CV_32F);
  // flip horizontally
  cv::flip(*rightCornerKernel, *leftCornerKernel, 1);
}

-(void) releaseCornerKernels {
  delete leftCornerKernel;
  delete rightCornerKernel;
}

// TODO implement these
-(cv::Mat) eyeCornerMap:(const cv::Mat&) region withLeft:(bool) left withLeft2:(bool) left2 {
  cv::Mat cornerMap;
  
  cv::Size sizeRegion = region.size();
  cv::Range colRange(sizeRegion.width / 4, sizeRegion.width * 3 / 4);
  cv::Range rowRange(sizeRegion.height / 4, sizeRegion.height * 3 / 4);
  
  cv::Mat miRegion(region, rowRange, colRange);
  
  cv::filter2D(miRegion, cornerMap, CV_32F,(left && !left2) || (!left && !left2) ? *leftCornerKernel : *rightCornerKernel);
  
  return cornerMap;
}

-(cv::Point2f) findEyeCorner:(cv::Mat) region withLeft:(bool) left withLeft2:(bool) left2 {
  cv::Mat cornerMap = [self eyeCornerMap:region withLeft:left withLeft2:left2];
  
  cv::Point maxP;
  cv::minMaxLoc(cornerMap,NULL,NULL,NULL,&maxP);
  
  cv::Point2f maxP2;
  maxP2 = [self findSubpixelEyeCorner:cornerMap withP:maxP];
  
  return maxP2;
}
-(cv::Point2f) findSubpixelEyeCorner:(cv::Mat) region withP:(cv::Point) maxP {
  
  cv::Size sizeRegion = region.size();
  

  
  cv::Mat cornerMap(sizeRegion.height * 10, sizeRegion.width * 10, CV_32F);
  if (cornerMap.cols > 0 || cornerMap.rows > 0 ){
    cv::resize(region, cornerMap, cornerMap.size(), 0, 0, cv::INTER_CUBIC);
  }
  
  
  cv::Point maxP2;
  cv::minMaxLoc(cornerMap, NULL,NULL,NULL,&maxP2);
  
  return cv::Point2f(sizeRegion.width / 2 + maxP2.x / 10,
                     sizeRegion.height / 2 + maxP2.y / 10);
}


@end
