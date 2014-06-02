//
//  AcuityModel.m
//  EyeTracking
//
//  Created by Michael Rhodes on 25/01/2014.
//  Copyright (c) 2014 Small Text. All rights reserved.
//

#import "AcuityModel.h"

#import "AVHouse.h"
#import "AVBoat.h"

#define MAX_TRIALS 3

@interface AcuityModel ()

@property (nonatomic) NSInteger trial;

@property (nonatomic,strong) NSArray *optotypes;
@property (nonatomic) NSInteger optotypeIndex;

@property (nonatomic, strong) NSArray *diagnoses;

@property (nonatomic,strong) NSArray *possibleBounds;
@property (nonatomic) NSInteger boundsIndex;

@end

@implementation AcuityModel

-(id) initWithViewBounds:(CGRect)acuityBounds
{
    self = [super init];

    if (self) {
        // We cycle through these images. Each image is shown three times,
        // in a random position.
        self.optotypeIndex = -1;  // we alway increment in the first time through

        // Restricted image set
        self.optotypes = @[[AVHouse alloc], [AVBoat alloc]];

        // Each image has an associated diagnosis
        self.diagnoses = @[@"6/60", @"6/36", @"6/18", @"6/12", @"6/9"];

        // Bounds are top and bottom half of the screen
        // This flips ever frame

        self.possibleBounds = @[
                                [NSValue valueWithCGRect:CGRectMake(184, 612, 400, 300)],[NSValue valueWithCGRect:CGRectMake(184, 112, 400, 300)],
                                ];

        self.trial = 0;
        self.trialSetSuccessful = NO;
    }

    return self;
}

-(void) incrementRecognisedInCurrentSet {
    _recognisedInCurrentSet++;
    NSLog(@"Recognised in current set: %i", _recognisedInCurrentSet);
}

-(void) increment
{
    
    if (self.trial == 0) {
        // first trial in set
        NSLog(@"First trial");

        // Move on the image
        
        self.optotypeIndex++;
        if (self.optotypeIndex >= self.optotypes.count) {
            self.optotypeIndex = 0;
        }
        
        // Reset whether one was spotted
        _recognisedInCurrentSet = 0;
        self.currentTrialFinalInSet = NO;

        self.trial++;

    } else if (self.trial == MAX_TRIALS-1) {
        NSLog(@"Final trial");

        // final trial in set complete
        self.trial = 0;
        self.currentTrialFinalInSet = YES;
        
    } else {
        NSLog(@"Mid trial");
        self.trial++;
    }

    // Choose one of the bounds at random
    self.boundsIndex = arc4random_uniform(self.possibleBounds.count);
    NSLog(@"Index: %d",_boundsIndex);
}

-(BOOL) trialSetSuccessful {
    return self.recognisedInCurrentSet >= 1;
}

-(CGRect) currentBounds
{
    return [self.possibleBounds[self.boundsIndex] CGRectValue];
}

-(Optotype*) currentOptotype
{
    return self.optotypes[self.optotypeIndex];
}

-(NSString*) currentDiagnosis
{
    return self.diagnoses[self.optotypeIndex];
}

@end
