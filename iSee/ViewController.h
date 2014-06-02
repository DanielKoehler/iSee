//
//  ViewController.h
//  EyeTracking
//
//  Created by Michael Rhodes on 25/01/2014.
//  Copyright (c) 2014 Small Text. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AcuityView;

@interface ViewController : UIViewController

@property (nonatomic,retain) IBOutlet AcuityView *acuityView;

@property (nonatomic,retain) IBOutlet UILabel *statusLabel;

@end
