//
//  ViewController.m
//  EyeTracking
//
//  Created by Michael Rhodes on 25/01/2014.
//  Copyright (c) 2014 Small Text. All rights reserved.
//

#import "ViewController.h"

#import "AcuityView.h"
#import "AcuityModel.h"
#import "AcuityChecker.h"
#import "DiagnosisViewController.h"
#import "VideoAcuityChecker.h"

// Time card is shown, and between trials
#define INTERVAL 2.0

@interface ViewController ()

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) AcuityModel *model;
@property (nonatomic, strong) NSObject<AcuityCheckerDelegate> *checker;

@property (nonatomic, strong) UITapGestureRecognizer *tapRecognizer;

@property (nonatomic) BOOL isActiveTrial;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.checker = [[VideoAcuityChecker alloc] init];
    [(VideoAcuityChecker*)self.checker startBackgroundMode];


    // Match acuityView's background to the Cardiff Cards image background
    self.acuityView.backgroundColor = [UIColor colorWithRed:177.0/255.0
                                                      green:179.0/255.0
                                                       blue:180.0/255.0
                                                      alpha:1];

    [self startTrials];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [self stopNSTimer];
    
    [(VideoAcuityChecker*)self.checker stop];

    [self.view removeGestureRecognizer:self.tapRecognizer];
    
    self.tapRecognizer = nil;
    self.checker = nil;
    self.model = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [self stopNSTimer];
}

// Create a new model, start the timer
-(void)startTrials {
    self.statusLabel.text = @"Starting...";
    self.model = [[AcuityModel alloc] initWithViewBounds:self.acuityView.bounds];
    [self startNSTimer];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowDiagnosis"]) {
        DiagnosisViewController *vc = (DiagnosisViewController*) segue.destinationViewController;
        vc.diagnosis = self.model.currentDiagnosis;
    }
}

#pragma mark UI update NSTimer

-(void)startNSTimer {
    [self stopNSTimer];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:INTERVAL
                                                  target:self
                                                selector:@selector(timerFired:)
                                                userInfo:nil
                                                 repeats:YES];
}

-(void)stopNSTimer {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

-(void)timerFired:(id)sender
{
    [self stepTrialState];
}

#pragma Update image view

-(void)stepTrialState
{
    if (self.isActiveTrial) {  // Completing a trial

        // Did the current trial succeed?
        BOOL trialSucceeded = [self.checker trialCompleted];
        if (trialSucceeded) {
            self.statusLabel.text = @"Success!";
            [self.model incrementRecognisedInCurrentSet];
        } else {
            self.statusLabel.text = @"Failure";
        }

        // If it was the final one trial in the set, check whether set
        // as a whole succeeded or failed. If it failed, show the diagnosis.
        if (self.model.currentTrialFinalInSet) {

            NSLog(@"Trial set successful: %hhd", self.model.trialSetSuccessful);

            if (!self.model.trialSetSuccessful) {  // if set failed, register that's the case
                [self stopNSTimer];
                [self performSegueWithIdentifier:@"ShowDiagnosis" sender:self];
            }
        }

        // Clear the display, update active trial state.
        self.acuityView.image = nil;
        self.isActiveTrial = NO;

    } else {  // Starting a trial
        self.statusLabel.text = @"";

        // Move to next card
        [self.model increment];

        // Draw the image
        self.acuityView.drawBounds = [self.model currentBounds];
        self.acuityView.image = [self.model currentImage];

        // Start the checker
        [self.checker startTrialWithPosition:AcuityCheckerPositionTop];

        // Trial is started
        self.isActiveTrial = YES;
    }

    [self.acuityView setNeedsDisplay];
}

/** Handle "Restart" button in diagnosis alert **/
-(void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {  // Restart button: create a new model, start the timer
        [self startTrials];
    }
}

@end
