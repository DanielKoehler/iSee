//
//  MRAcuityModel.h
//  EyeTracking
//
//  Created by Michael Rhodes on 25/01/2014.
//  Copyright (c) 2014 Small Text. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRAcuityModel : NSObject

@property (nonatomic,readonly) NSInteger recognisedInCurrentSet;

@property (nonatomic) BOOL currentTrialFinalInSet;
@property (nonatomic) BOOL trialSetSuccessful;

-(id)initWithViewBounds:(CGRect)acuityBounds;

-(void)incrementRecognisedInCurrentSet;

-(void)increment;
-(CGRect)currentBounds;
-(UIImage*)currentImage;
-(NSString*)currentDiagnosis;

@end
