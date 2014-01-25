//
//  EyeDetection.cpp
//  OpenCV Tutorial
//
//  Created by BloodAxe on 7/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include <iostream>

#include "opencv2/imgproc/imgproc.hpp"
#include <opencv2/objdetect/objdetect.hpp>
#include <opencv2/highgui/highgui.hpp>

#include <iostream>
#include <queue>
#include <stdio.h>
#include <math.h>

#include "findEyeCenter.h"
#include "findEyeCorner.h"
#include "constants.h"

#include "EyeDetection.hpp"
EyeDetectionSample::EyeDetectionSample()
{
    flipped = false;
    cv::String face_cascade_name = "haarcascade_frontalface_alt.xml";
    cv::CascadeClassifier face_cascade;
    cv::RNG rng(12345);
    cv::Mat debugImage;
    cv::Mat skinCrCbHist = cv::Mat::zeros(cv::Size(256, 256), CV_8UC1);
}

std::string EyeDetectionSample::getName() const
{
  return "Eye Detection";
}

std::string EyeDetectionSample::getUserFriendlyName() const
{
  return getName() + " - " + m_currentEffect + " effect";
}

//! Returns a detailed sample description
std::string EyeDetectionSample::getDescription() const
{
  return "Demonstrate various image filtering techniques";
}

//! Processes a frame and returns output image 
bool EyeDetectionSample::processFrame(cv::Mat& inputFrame, cv::Mat& outputFrame)
{
    if (flipped){
        cv::flip(inputFrame, inputFrame, 1);
    }
    if( !inputFrame.empty() ) {
      detectAndDisplay( inputFrame );
    }
    return true;
}

void EyeDetectionSample::detectAndDisplay(cv::Mat& inputFrame ) {
    std::vector<cv::Rect> faces;
    //cv::Mat frame_gray;
    
    std::vector<cv::Mat> rgbChannels(3);
    cv::split(inputFrame, rgbChannels);
    cv::Mat frame_gray = rgbChannels[2];
    
    //cvtColor( frame, frame_gray, CV_BGR2GRAY );
    //equalizeHist( frame_gray, frame_gray );
    //cv::pow(frame_gray, CV_64F, frame_gray);
    //-- Detect faces
    face_cascade.detectMultiScale( frame_gray, faces, 1.1, 2, 0|CV_HAAR_SCALE_IMAGE|CV_HAAR_FIND_BIGGEST_OBJECT, cv::Size(150, 150) );
    //  findSkin(debugImage);
    
    for( int i = 0; i < faces.size(); i++ )
    {
        rectangle(debugImage, faces[i], 1234);
    }
    //-- Show what you got
    if (faces.size() > 0) {
        findEyes(frame_gray, faces[0]);
    }
}

void EyeDetectionSample::findEyes(const cv::Mat frame_gray, cv::Rect face) {
    cv::Mat faceROI = frame_gray(face);
    cv::Mat debugFace = faceROI;
    
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
    cv::Point leftPupil = findEyeCenter(faceROI,leftEyeRegion,"Left Eye");
    cv::Point rightPupil = findEyeCenter(faceROI,rightEyeRegion,"Right Eye");
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
//
//    imshow(face_window_name, faceROI);
}


