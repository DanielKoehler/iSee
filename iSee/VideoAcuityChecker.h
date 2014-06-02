//
//  VideoAcuityChecker.h
//  iSee
//
//  Created by Daniel Koehler on 26/01/2014.
//  Copyright (c) 2014 Daniel Koehler. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AcuityCheckerDelegate.h"

#import <opencv2/highgui/cap_ios.h>
#import <opencv2/objdetect/objdetect.hpp>
#import <opencv2/imgproc/imgproc_c.h>

@class CvVideoCamera;

typedef NS_ENUM(NSInteger, EyePosition) {
    EyePositionNone,
    EyePositionTop,
    EyePositionBottom
};

@interface VideoAcuityChecker : NSObject <AcuityCheckerDelegate, CvVideoCameraDelegate>
{
    EyePosition eyePosition;
    CvVideoCamera* videoCamera;
    BOOL eyesAreTop;
    NSInteger * framesAtPosition;
}

@property (nonatomic, retain) CvVideoCamera* vcVideoCamera;


-(void) startBackgroundMode;

-(void) startDebugWithView:(UIView*) imageView;

-(void) stop;

@end
