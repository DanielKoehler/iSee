//
//  DebugViewController.h
//  iSee
//
//  Created by Daniel Koehler on 01/03/2014.
//  Copyright (c) 2014 Evangelos Georgiou. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VideoAcuityChecker;

@interface DebugViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) VideoAcuityChecker *videoac;
@end
