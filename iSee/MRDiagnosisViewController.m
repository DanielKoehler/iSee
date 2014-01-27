//
//  MRDiagnosisViewController.m
//  EyeTracking
//
//  Created by Michael Rhodes on 26/01/2014.
//  Copyright (c) 2014 Small Text. All rights reserved.
//

#import "MRDiagnosisViewController.h"

@interface MRDiagnosisViewController ()

@end

@implementation MRDiagnosisViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    self.diagnosisLabel.text = self.diagnosis;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
