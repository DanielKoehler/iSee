//
//  MRAcuityChecker.m
//  EyeTracking
//
//  Created by Michael Rhodes on 26/01/2014.
//  Copyright (c) 2014 Small Text. All rights reserved.
//

#import "MRAcuityChecker.h"

#import "MRAcuityModel.h"

@interface MRAcuityChecker ()

@property (nonatomic) BOOL tapSpotted;

@end

@implementation MRAcuityChecker

#pragma mark tap handler

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
//    CGPoint location = [recognizer locationInView:recognizer.view];

//    NSLog(@"Tap registered: %f, %f", location.x, location.y);

    self.tapSpotted = YES;
}

#pragma mark MRAcuityCheckerDelegate methods

-(void)startTrialWithPosition:(MRAcuityCheckerPosition)position
{
    self.tapSpotted = NO;
}

-(BOOL)trialCompleted
{
    return self.tapSpotted;
}

@end
