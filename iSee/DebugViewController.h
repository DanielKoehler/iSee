//
//  DebugViewController.h
//  iSee
//
//  Created by Daniel Koehler on 01/03/2014.
//  Copyright (c) 2014 Evangelos Georgiou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <opencv2/highgui/cap_ios.h>
#import <opencv2/objdetect/objdetect.hpp>
#import <opencv2/imgproc/imgproc_c.h>

using namespace cv;

@class CvVideoCamera;

@interface DebugViewController : UIViewController <CvVideoCameraDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, retain) CvVideoCamera* videoCamera;

-(void)start;

-(void)stop;

@end
