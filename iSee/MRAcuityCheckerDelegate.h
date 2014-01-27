//
//  MRAcuityCheckerDelegate.h
//  EyeTracking
//
//  Created by Michael Rhodes on 26/01/2014.
//  Copyright (c) 2014 Small Text. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MRAcuityCheckerPosition) {
    MRAcuityCheckerPositionTop,    // card presented top
    MRAcuityCheckerPositionBottom  // card presented bottom
};

@protocol MRAcuityCheckerDelegate <NSObject>

@required

// Called when a new card is displayed.
// Position specifies whether the image is displayed in the top
// or bottom half of the screen.
-(void)startTrialWithPosition:(MRAcuityCheckerPosition)position;

// Called when card is removed.
// Returns true if trial resulted in success, false otherwise.
-(BOOL)trialCompleted;

@end
