//
//  MRAcuityModel.m
//  EyeTracking
//
//  Created by Michael Rhodes on 25/01/2014.
//  Copyright (c) 2014 Small Text. All rights reserved.
//

#import "MRAcuityModel.h"

#define MAX_TRIALS 3

@interface MRAcuityModel ()

@property (nonatomic) NSInteger trial;

@property (nonatomic,strong) NSArray *images;
@property (nonatomic) NSInteger imageIndex;

@property (nonatomic, strong) NSArray *diagnoses;

@property (nonatomic,strong) NSArray *possibleBounds;
@property (nonatomic) NSInteger boundsIndex;

@end

@implementation MRAcuityModel

-(id)initWithViewBounds:(CGRect)acuityBounds
{
    self = [super init];

    if (self) {
        // We cycle through these images. Each image is shown three times,
        // in a random position.
        self.imageIndex = -1;  // we alway increment in the first time through

        // Restricted image set
        self.images = @[@"Sock1", @"Sock2", @"Sock3", @"Sock4", @"Sock5"];

        // Unrestricted images
//        self.images = @[@"Rabbit", @"Rabbit-50", @"Rabbit-70", @"Rabbit-90", @"Rabbit-95"];

        // Each image has an associated diagnosis
        self.diagnoses = @[@"6/60", @"6/36", @"6/18", @"6/12", @"6/9"];

        // Bounds are top and bottom half of the screen
        // This flips ever frame
        CGRect rect1 = CGRectMake(acuityBounds.origin.x,
                                  acuityBounds.size.height / 2,
                                  acuityBounds.size.width,
                                  acuityBounds.size.height / 2);

        CGRect rect2 = CGRectMake(acuityBounds.origin.x,
                                  acuityBounds.origin.y,
                                  acuityBounds.size.width,
                                  acuityBounds.size.height / 2);

        self.possibleBounds = @[
                                [NSValue valueWithCGRect:rect1],
                                [NSValue valueWithCGRect:rect2]
                                ];

        self.trial = 0;
        self.trialSetSuccessful = NO;
    }

    return self;
}

-(void)incrementRecognisedInCurrentSet {
    _recognisedInCurrentSet++;
    NSLog(@"Recognised in current set: %i", _recognisedInCurrentSet);
}

-(void)increment
{
    if (self.trial == 0) {
        // first trial in set
        NSLog(@"First trial");

        // Move on the image
        self.imageIndex++;
        if (self.imageIndex >= self.images.count) {
            self.imageIndex = 0;
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
}

-(BOOL)trialSetSuccessful {
    return self.recognisedInCurrentSet >= 1;
}

-(CGRect)currentBounds
{
    return [self.possibleBounds[self.boundsIndex] CGRectValue];
}

-(UIImage*)currentImage
{
    return [UIImage imageNamed:self.images[self.imageIndex]];
}

-(NSString*)currentDiagnosis
{
    return self.diagnoses[self.imageIndex];
}

@end
