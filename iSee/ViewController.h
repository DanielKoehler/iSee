//
//  ViewController.h
//  openCViOSFaceTrackingTutorial
//
//  Created by Evangelos Georgiou on 16/03/2013.
//  Copyright (c) 2013 Evangelos Georgiou. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <opencv2/highgui/cap_ios.h>
#import <opencv2/objdetect/objdetect.hpp>
#import <opencv2/imgproc/imgproc_c.h>

using namespace cv;

@interface ViewController : UIViewController <CvVideoCameraDelegate>
{
    IBOutlet UIImageView* imageView;
    
    CvVideoCamera* videoCamera;
    CascadeClassifier faceCascade;
    BOOL eyesAreTop;
    NSInteger * framesAtPosition;
}

@property (nonatomic, retain) CvVideoCamera* videoCamera;

- (void) findEyes:(Mat)frame_gray withFace:(cv::Rect) face output:(Mat&) outputFrame;

- (void) eyesDidMove;

@end
