//
//  MRAcuityChecker.h
//  EyeTracking
//
//  Created by Michael Rhodes on 26/01/2014.
//  Copyright (c) 2014 Small Text. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MRAcuityCheckerDelegate.h"

@class MRAcuityModel;

@interface MRAcuityChecker : NSObject <MRAcuityCheckerDelegate>

// Attached to acuity view in main UI to register taps
// and pass back to model
-(void)handleSingleTap:(UITapGestureRecognizer *)recognizer;

@end
