//
//  EyeDetection.h
//  OpenCV Tutorial
//
//  Created by BloodAxe on 7/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#ifndef OpenCV_Tutorial_EyeDetection_h
#define OpenCV_Tutorial_EyeDetection_h

#include "SampleBase.h"

class EyeDetection : public SampleBase
{
public:
  EyeDetection();
  
  //! Gets a sample name
  virtual std::string getName() const;
  
  virtual std::string getUserFriendlyName() const;
  
  //! Returns a detailed sample description
  virtual std::string getDescription() const;
    
  //! Processes a frame and returns output image 
  virtual bool processFrame(cv::Mat& inputFrame, cv::Mat& outputFrame);

private:
  void detectAndDisplay(cv::Mat& inputFrame);
  
  void findEyes(const cv::Mat frame_gray, cv::Rect face);

  
private:
  std::string m_currentEffect;

  
  float flipped;
    cv::CascadeClassifier face_cascade;
    cv::RNG rng;
    cv::Mat debugImage;
    cv::Mat skinCrCbHist;
  cv::Mat_<float> m_contrastKernel;
  cv::Mat_<float> m_contrastKernelT;
  
  bool useNeonOptimized;
};

#endif
