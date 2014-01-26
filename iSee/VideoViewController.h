//
//  VideoViewController.h
//  OpenCV Tutorial
//
//  Created by BloodAxe on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLESImageView.h"
#import "VideoSource.h"
#import "SampleBase.h"
#import "BaseSampleViewController.h"

@interface VideoViewController : BaseSampleViewController<VideoSourceDelegate,UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (nonatomic, strong) GLESImageView *imageView;
@property (nonatomic, strong) UITableView * optionsView;
@property (nonatomic, strong) UIPopoverController * optionsPopover;
@property (nonatomic, strong) UIViewController * optionsViewController;

@property (nonatomic, strong) UIActionSheet * actionSheet;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *actionSheetButton;

- (IBAction)showActionSheet:(id)sender;

@end

