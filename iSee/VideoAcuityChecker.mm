//
//  VideoAcuityChecker.m
//  iSee
//
//  Created by Daniel Koehler on 26/01/2014.
//  Copyright (c) 2014 Daniel Koehler. All rights reserved.
//

#import "VideoAcuityChecker.h"

#include "findEyeCentre.h"
#include "findEyeCorner.h"
#include "constants.h"

using namespace cv;

@interface VideoAcuityChecker ()

@property (nonatomic) AcuityCheckerPosition trialPosition;

@end

@implementation VideoAcuityChecker

CascadeClassifier faceCascade;

const int HaarOptions = CV_HAAR_FIND_BIGGEST_OBJECT | CV_HAAR_DO_ROUGH_SEARCH;

-(void) start {
    
    self.vcVideoCamera = [[CvVideoCamera alloc] init];
    self.vcVideoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionFront;
    self.vcVideoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset352x288;
    self.vcVideoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
    self.vcVideoCamera.defaultFPS = 30;
    self.vcVideoCamera.grayscaleMode = NO;
    self.vcVideoCamera.delegate = self;
    
    [self.vcVideoCamera start];
    
    NSString* faceCascadePath = [[NSBundle mainBundle] pathForResource:@"haarcascade_frontalface_alt2" ofType:@"xml"];
    faceCascade.load([faceCascadePath UTF8String]);
}



-(void) stop {
    self.vcVideoCamera.delegate = nil;
    self.vcVideoCamera = nil;
    [self.vcVideoCamera stop];
}

#pragma mark MRAcuityCheckerDelegate methods

-(void)startTrialWithPosition:(AcuityCheckerPosition)position
{
    NSLog(@"VideoAcuityChecker startTrialWithPosition");
    self.trialPosition = position;
    eyePosition = EyePositionNone;
    
   
}

-(BOOL)trialCompleted
{
    NSLog(@"VideoAcuityChecker trialCompleted");
    
    if (eyePosition == EyePositionNone) {
        NSLog(@"Eyes were NOT SEEN");
    } else if (eyePosition == EyePositionTop) {
        NSLog(@"Eyes were TOP");
    } else if (eyePosition == EyePositionBottom) {
        NSLog(@"Eyes were BOTTOM");
    }
    
    if (self.trialPosition == AcuityCheckerPositionTop) {
        return eyePosition == EyePositionTop;
<<<<<<< HEAD
    } else if (self.trialPosition == AcuityCheckerPositionBottom){
=======
    } else if (self.trialPosition == AcuityCheckerPositionBottom) {
>>>>>>> origin/eyeCorners
        return eyePosition == EyePositionBottom;
    } else {
        return NO;
    }
}

#pragma mark - Protocol CvVideoCameraDelegate

#ifdef __cplusplus
- (void)processImage:(Mat&)image;
{
    Mat grayscaleFrame;
    cvtColor(image, grayscaleFrame, CV_BGR2GRAY);
    equalizeHist(grayscaleFrame, grayscaleFrame);
    
    std::vector<cv::Rect> faces;
    
    faceCascade.detectMultiScale(grayscaleFrame, faces, 1.1, 2, HaarOptions, cv::Size(60, 60));
    
    for (int i = 0; i < faces.size(); i++)
    {
        //        cv::Point pt1(faces[i].x + faces[i].width, faces[i].y + faces[i].height);
        //        cv::Point pt2(faces[i].x, faces[i].y);
        
        cv::rectangle(image, faces[i], 1234);
    }
    if (faces.size() > 0) {
        [self findEyes:grayscaleFrame withFace:faces[0] output:image];
    }
}

- (void) findEyes:(Mat)frame_gray withFace: (cv::Rect) face output:(Mat&) outputFrame {
    cv::Mat faceROI = frame_gray(face);
    cv::Mat debugFace = outputFrame;
    
    if (kSmoothFaceImage) {
        double sigma = kSmoothFaceFactor * face.width;
        GaussianBlur( faceROI, faceROI, cv::Size( 0, 0 ), sigma);
    }
    
    //-- Find eye regions and draw them
    int eye_region_width = face.width * (kEyePercentWidth/100.0);
    int eye_region_height = face.width * (kEyePercentHeight/100.0);
    int eye_region_top = face.height * (kEyePercentTop/100.0);
    cv::Rect leftEyeRegion(face.width*(kEyePercentSide/100.0),
                           eye_region_top,eye_region_width,eye_region_height);
    cv::Rect rightEyeRegion(face.width - eye_region_width - face.width*(kEyePercentSide/100.0),
                            eye_region_top,eye_region_width,eye_region_height);
    
    //-- Find Eye Centers
    cv::Point leftPupil = findEyeCentre(faceROI,leftEyeRegion,outputFrame);
    cv::Point rightPupil = findEyeCentre(faceROI,rightEyeRegion,outputFrame);
    // get corner regions
    cv::Rect leftRightCornerRegion(leftEyeRegion);
    leftRightCornerRegion.width -= leftPupil.x;
    leftRightCornerRegion.x += leftPupil.x;
    leftRightCornerRegion.height /= 2;
    leftRightCornerRegion.y += leftRightCornerRegion.height / 2;
    cv::Rect leftLeftCornerRegion(leftEyeRegion);
    leftLeftCornerRegion.width = leftPupil.x;
    leftLeftCornerRegion.height /= 2;
    leftLeftCornerRegion.y += leftLeftCornerRegion.height / 2;
    cv::Rect rightLeftCornerRegion(rightEyeRegion);
    rightLeftCornerRegion.width = rightPupil.x;
    rightLeftCornerRegion.height /= 2;
    rightLeftCornerRegion.y += rightLeftCornerRegion.height / 2;
    cv::Rect rightRightCornerRegion(rightEyeRegion);
    rightRightCornerRegion.width -= rightPupil.x;
    rightRightCornerRegion.x += rightPupil.x;
    rightRightCornerRegion.height /= 2;
    rightRightCornerRegion.y += rightRightCornerRegion.height / 2;
    rectangle(debugFace,leftRightCornerRegion,200);
    rectangle(debugFace,leftLeftCornerRegion,200);
    rectangle(debugFace,rightLeftCornerRegion,200);
    rectangle(debugFace,rightRightCornerRegion,200);
    // change eye centers to face coordinates
    rightPupil.x += rightEyeRegion.x;
    rightPupil.y += rightEyeRegion.y;
    leftPupil.x += leftEyeRegion.x;
    leftPupil.y += leftEyeRegion.y;
    // draw eye centers
    circle(debugFace, rightPupil, 3, 1234);
    circle(debugFace, leftPupil, 3, 1234);
    printf("Right (%d, %d), Left (%d, %d)\n", rightPupil.x, rightPupil.y, leftPupil.x, leftPupil.y);
    //-- Find Eye Corners
    if (kEnableEyeCorner) {
        cv::Point2f leftRightCorner = findEyeCorner(faceROI(leftRightCornerRegion), true, false);
        leftRightCorner.x += leftRightCornerRegion.x;
        leftRightCorner.y += leftRightCornerRegion.y;
        cv::Point2f leftLeftCorner = findEyeCorner(faceROI(leftLeftCornerRegion), true, true);
        leftLeftCorner.x += leftLeftCornerRegion.x;
        leftLeftCorner.y += leftLeftCornerRegion.y;
        cv::Point2f rightLeftCorner = findEyeCorner(faceROI(rightLeftCornerRegion), false, true);
        rightLeftCorner.x += rightLeftCornerRegion.x;
        rightLeftCorner.y += rightLeftCornerRegion.y;
        cv::Point2f rightRightCorner = findEyeCorner(faceROI(rightRightCornerRegion), false, false);
        rightRightCorner.x += rightRightCornerRegion.x;
        rightRightCorner.y += rightRightCornerRegion.y;
        circle(faceROI, leftRightCorner, 3, 200);
        circle(faceROI, leftLeftCorner, 3, 200);
        circle(faceROI, rightLeftCorner, 3, 200);
        circle(faceROI, rightRightCorner, 3, 200);
    }
    
    
    framesAtPosition++;
    
    if((int)framesAtPosition > 15) {
        NSLog(@"Here");
        if ((rightPupil.y + leftPupil.y) / 2 > 40){
            eyesAreTop = TRUE;
            eyePosition = EyePositionTop;
            NSLog(@"Greater");
            //stop the camera and move to next slide
        } else if ((rightPupil.y + leftPupil.y) / 2 < 35){
            NSLog(@"Less");
            eyesAreTop = FALSE;
            eyePosition = EyePositionBottom;
        }
        framesAtPosition = 0;
    }
    
    
    faceROI.copyTo(outputFrame);
}

#endif


@end
