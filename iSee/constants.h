//
//  constants.h
//  iSee
//
//  Created by Daniel Koehler on 26/01/2014.
//  Copyright (c) 2014 Daniel Koehler. All rights reserved.
//

#ifndef CONSTANTS_H
#define CONSTANTS_H

// Debugging
const bool kPlotVectorField = false;

// Size constants
const int kEyePercentTop = 25;
const int kEyePercentSide = 13;
const int kEyePercentHeight = 30;
const int kEyePercentWidth = 35;

// Preprocessing
const bool kSmoothFaceImage = false;
const float kSmoothFaceFactor = 0.005;

// Algorithm Parameters
const int kFastEyeWidth = 50;
const int kWeightBlurSize = 5;
const bool kEnableWeight = true;
const float kWeightDivisor = 150.0;
const double kGradientThreshold = 50.0;

// Postprocessing
const bool kEnablePostProcess = false;
const float kPostProcessThreshold =0.97;
// [[NSUserDefaults standardUserDefaults] floatForKey:setting[@"name"]]
// Eye Corner
const bool kEnableEyeCorner = false;

#endif
