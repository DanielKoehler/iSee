//
//  VideoAcuityChecker.m
//  iSee
//
//  Created by Daniel Koehler on 26/01/2014.
//  Copyright (c) 2014 Daniel Koehler. All rights reserved.
//

#import "VideoAcuityChecker.h"

//#include "findEyeCentre.h"
//#include "findEyeCorner.h"
#import "PupilTracking.h"
using namespace cv;

@interface VideoAcuityChecker ()

@property (nonatomic) AcuityCheckerPosition trialPosition;
@property (nonatomic, retain) PupilTracking* pupilTracking;
@end

@implementation VideoAcuityChecker

CascadeClassifier faceCascade;

const int HaarOptions = CV_HAAR_FIND_BIGGEST_OBJECT | CV_HAAR_DO_ROUGH_SEARCH;

-(void) startBackgroundMode {
    
    self.vcVideoCamera = [[CvVideoCamera alloc] init];
    self.pupilTracking = [PupilTracking alloc];
    [self.pupilTracking initialiseVars];
    [self.pupilTracking createCornerKernels];
    self.vcVideoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionFront;
    self.vcVideoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPresetMedium;
    self.vcVideoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
  
//    self.vcVideoCamera.updateOrientation
  
    self.vcVideoCamera.defaultFPS = 30;
    self.vcVideoCamera.grayscaleMode = NO;
    self.vcVideoCamera.delegate = self;
  
    [self.vcVideoCamera start];
    
    NSString* faceCascadePath = [[NSBundle mainBundle] pathForResource:@"haarcascade_frontalface_alt2" ofType:@"xml"];
    faceCascade.load([faceCascadePath UTF8String]);
}

-(void) startDebugWithView:(UIView*) imageView {
  
  [self stop];
  [self.pupilTracking releaseCornerKernels];
  self.vcVideoCamera = [[CvVideoCamera alloc] initWithParentView:imageView];
  self.pupilTracking = [PupilTracking alloc];
  [self.pupilTracking initialiseVars];
  [self.pupilTracking createCornerKernels];
  self.vcVideoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionFront;
  self.vcVideoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPresetPhoto;
  self.vcVideoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
  self.vcVideoCamera.defaultFPS = 30;
  self.vcVideoCamera.grayscaleMode = NO;
  self.vcVideoCamera.delegate = self;
  
  [self.vcVideoCamera start];
  NSLog(@"debug view");
  NSString* faceCascadePath = [[NSBundle mainBundle] pathForResource:@"haarcascade_frontalface_alt2" ofType:@"xml"];
  faceCascade.load([faceCascadePath UTF8String]);
  NSLog(@"Loaded faceCascade");
}


-(void) stop {
    self.vcVideoCamera.delegate = nil;
    self.vcVideoCamera = nil;
    [self.vcVideoCamera stop];
}

#pragma mark MRAcuityCheckerDelegate methods

-(void)startTrialWithPosition:(AcuityCheckerPosition)position
{
//    NSLog(@"VideoAcuityChecker startTrialWithPosition");
    self.trialPosition = position;
    eyePosition = EyePositionNone;
    
   
}

-(BOOL)trialCompleted
{
//    NSLog(@"VideoAcuityChecker trialCompleted");
    
    if (eyePosition == EyePositionNone) {
//        NSLog(@"Eyes were NOT SEEN");
    } else if (eyePosition == EyePositionTop) {
//        NSLog(@"Eyes were TOP");
    } else if (eyePosition == EyePositionBottom) {
//        NSLog(@"Eyes were BOTTOM");
    }
    
    if (self.trialPosition == AcuityCheckerPositionTop) {
        return eyePosition == EyePositionTop;
    } else if (self.trialPosition == AcuityCheckerPositionBottom){
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
    //cv::Mat debugFace;
  
    if (self.pupilTracking.SmoothFaceImage) {
        double sigma = self.pupilTracking.SmoothFaceFactor * face.width;
        GaussianBlur( faceROI, faceROI, cv::Size( 0, 0 ), sigma);
    }
    
    //-- Find eye regions and draw them
    int eye_region_width = face.width * (self.pupilTracking.EyePercentWidth/100.0);
    int eye_region_height = face.width * (self.pupilTracking.EyePercentHeight/100.0);
    int eye_region_top = face.height * (self.pupilTracking.EyePercentTop/100.0);
    cv::Rect leftEyeRegion(face.width*(self.pupilTracking.EyePercentSide/100.0),
                           eye_region_top,eye_region_width,eye_region_height);
    cv::Rect rightEyeRegion(face.width - eye_region_width - face.width*(self.pupilTracking.EyePercentSide/100.0),
                            eye_region_top,eye_region_width,eye_region_height);
    
    //-- Find Eye Centers
  
    cv::Point leftPupil = [self.pupilTracking findEyeCenter:faceROI withEye:leftEyeRegion withOutput:outputFrame];
    cv::Point rightPupil = [self.pupilTracking findEyeCenter:faceROI withEye:rightEyeRegion withOutput:outputFrame];
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
    rectangle(faceROI,leftRightCornerRegion,200);
    rectangle(faceROI,leftLeftCornerRegion,200);
    rectangle(faceROI,rightLeftCornerRegion,200);
    rectangle(faceROI,rightRightCornerRegion,200);
    // change eye centers to face coordinates
    rightPupil.x += rightEyeRegion.x;
    rightPupil.y += rightEyeRegion.y;
    leftPupil.x += leftEyeRegion.x;
    leftPupil.y += leftEyeRegion.y;
    // draw eye centers
    circle(faceROI, rightPupil, 3, 1234);
    circle(faceROI, leftPupil, 3, 1234);
    printf("Right (%d, %d), Left (%d, %d)\n", rightPupil.x, rightPupil.y, leftPupil.x, leftPupil.y);
    //-- Find Eye Corners
    if (self.pupilTracking.EnableEyeCorner) {
//        cv::Point2f leftRightCorner = findEyeCorner(faceROI(leftRightCornerRegion), true, false);
      cv::Point2f leftRightCorner = [self.pupilTracking findEyeCorner:faceROI(leftRightCornerRegion) withLeft:true withLeft2:false];
        leftRightCorner.x += leftRightCornerRegion.x;
        leftRightCorner.y += leftRightCornerRegion.y;
        cv::Point2f leftLeftCorner = [self.pupilTracking findEyeCorner:faceROI(leftLeftCornerRegion) withLeft:true withLeft2:true];
        leftLeftCorner.x += leftLeftCornerRegion.x;
        leftLeftCorner.y += leftLeftCornerRegion.y;
        cv::Point2f rightLeftCorner = [self.pupilTracking findEyeCorner:faceROI(rightLeftCornerRegion) withLeft:false withLeft2:true];
        rightLeftCorner.x += rightLeftCornerRegion.x;
        rightLeftCorner.y += rightLeftCornerRegion.y;
        cv::Point2f rightRightCorner = [self.pupilTracking findEyeCorner:faceROI(rightRightCornerRegion) withLeft:false withLeft2:false];
        rightRightCorner.x += rightRightCornerRegion.x;
        rightRightCorner.y += rightRightCornerRegion.y;
        circle(faceROI, leftRightCorner, 3, 200);
        circle(faceROI, leftLeftCorner, 3, 200);
        circle(faceROI, rightLeftCorner, 3, 200);
        circle(faceROI, rightRightCorner, 3, 200);
    }
    
    
    framesAtPosition++;
    
    if((int)framesAtPosition > 15) {
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

+ (instancetype) singleton {
  static id singletonInstance = nil;
  if (!singletonInstance) {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      singletonInstance = [[super allocWithZone:NULL] init];
    });
  }
  return singletonInstance;
}

+ (id) allocWithZone:(NSZone *)zone {
  return [self singleton];
}

- (id) copyWithZone:(NSZone *)zone {
  return self;
}


@end
