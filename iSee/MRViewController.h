//
//  MRViewController.h
//  EyeTracking
//
//  Created by Michael Rhodes on 25/01/2014.
//  Copyright (c) 2014 Small Text. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MRAcuityView;

@interface MRViewController : UIViewController

@property (nonatomic,strong) IBOutlet MRAcuityView *acuityView;

@property (nonatomic,strong) IBOutlet UILabel *statusLabel;

@end
