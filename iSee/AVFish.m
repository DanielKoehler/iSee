//
//  AVFish.m
//  iSee
//
//  Created by Daniel Koehler on 02/06/2014.
//  Copyright (c) 2014 Evangelos Georgiou. All rights reserved.
//

#import "AVFish.h"

@implementation AVFish

- (void)drawRect:(CGRect)rect
{
    //// Color Declarations
    
    UIColor* color6 = [self constrastAdjustedColor:[UIColor colorWithRed: 0.103 green: 0.092 blue: 0.095 alpha: 1]];
    UIColor* color7 = [self constrastAdjustedColor:[UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1]];
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(121.77, 68.06)];
    [bezierPath addCurveToPoint: CGPointMake(228.11, 36.31) controlPoint1: CGPointMake(163.82, 32.93) controlPoint2: CGPointMake(205.14, 26.3)];
    [bezierPath addCurveToPoint: CGPointMake(240.07, 81.53) controlPoint1: CGPointMake(246.69, 44.38) controlPoint2: CGPointMake(254.11, 69.86)];
    [bezierPath moveToPoint: CGPointMake(106.81, 215.78)];
    [bezierPath addCurveToPoint: CGPointMake(225.88, 267.36) controlPoint1: CGPointMake(107.22, 249.58) controlPoint2: CGPointMake(204.64, 266.93)];
    [bezierPath addCurveToPoint: CGPointMake(233.01, 266.93) controlPoint1: CGPointMake(230.63, 267.36) controlPoint2: CGPointMake(231.71, 267.29)];
    [bezierPath addCurveToPoint: CGPointMake(242.3, 263.4) controlPoint1: CGPointMake(236.46, 266.06) controlPoint2: CGPointMake(239.63, 264.62)];
    [bezierPath addCurveToPoint: CGPointMake(231.7, 213.22) controlPoint1: CGPointMake(262.24, 254.33) controlPoint2: CGPointMake(247.65, 224.07)];
    [bezierPath moveToPoint: CGPointMake(49.05, 161.09)];
    [bezierPath addCurveToPoint: CGPointMake(90.16, 148.27) controlPoint1: CGPointMake(61.51, 156.34) controlPoint2: CGPointMake(90.09, 152.66)];
    [bezierPath addCurveToPoint: CGPointMake(50.42, 130.85) controlPoint1: CGPointMake(90.09, 144.17) controlPoint2: CGPointMake(68.63, 134.59)];
    [bezierPath addCurveToPoint: CGPointMake(246.55, 83.83) controlPoint1: CGPointMake(88.58, 26.88) controlPoint2: CGPointMake(224.8, 74.83)];
    [bezierPath addCurveToPoint: CGPointMake(265.62, 92.47) controlPoint1: CGPointMake(265.84, 91.82) controlPoint2: CGPointMake(258.5, 89.59)];
    [bezierPath addCurveToPoint: CGPointMake(280.96, 92.83) controlPoint1: CGPointMake(280.74, 98.59) controlPoint2: CGPointMake(277.14, 94.34)];
    [bezierPath addLineToPoint: CGPointMake(324.45, 46.03)];
    [bezierPath addCurveToPoint: CGPointMake(348.93, 85.13) controlPoint1: CGPointMake(336.19, 33.43) controlPoint2: CGPointMake(357.71, 59.71)];
    [bezierPath addLineToPoint: CGPointMake(319.19, 145.61)];
    [bezierPath addLineToPoint: CGPointMake(348.93, 200.18)];
    [bezierPath addCurveToPoint: CGPointMake(324.45, 245.04) controlPoint1: CGPointMake(362.97, 231.43) controlPoint2: CGPointMake(336.69, 264.55)];
    [bezierPath addCurveToPoint: CGPointMake(273.62, 198.67) controlPoint1: CGPointMake(299.9, 219.34) controlPoint2: CGPointMake(286.36, 190.03)];
    [bezierPath addCurveToPoint: CGPointMake(122.63, 220.2) controlPoint1: CGPointMake(261.59, 208.1) controlPoint2: CGPointMake(169.14, 232.8)];
    [bezierPath addCurveToPoint: CGPointMake(49.05, 161.09) controlPoint1: CGPointMake(76.05, 207.67) controlPoint2: CGPointMake(66.54, 194.28)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(120.47, 96.36)];
    [bezierPath addCurveToPoint: CGPointMake(137.11, 111.98) controlPoint1: CGPointMake(129.62, 96.36) controlPoint2: CGPointMake(137.11, 103.34)];
    [bezierPath addCurveToPoint: CGPointMake(120.47, 127.61) controlPoint1: CGPointMake(137.11, 120.62) controlPoint2: CGPointMake(129.62, 127.61)];
    [bezierPath addCurveToPoint: CGPointMake(103.84, 111.98) controlPoint1: CGPointMake(111.33, 127.61) controlPoint2: CGPointMake(103.84, 120.62)];
    [bezierPath addCurveToPoint: CGPointMake(120.47, 96.36) controlPoint1: CGPointMake(103.84, 103.34) controlPoint2: CGPointMake(111.33, 96.36)];
    [bezierPath closePath];
    bezierPath.miterLimit = 4;
    
    bezierPath.lineJoinStyle = kCGLineJoinRound;
    
    [color6 setStroke];
    bezierPath.lineWidth = self.bezierPathThickness * 4.14;
    [bezierPath stroke];
    
    
    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(121.77, 68.06)];
    [bezier2Path addCurveToPoint: CGPointMake(228.11, 36.31) controlPoint1: CGPointMake(163.82, 32.93) controlPoint2: CGPointMake(205.14, 26.3)];
    [bezier2Path addCurveToPoint: CGPointMake(240.07, 81.53) controlPoint1: CGPointMake(246.69, 44.38) controlPoint2: CGPointMake(254.11, 69.86)];
    [bezier2Path moveToPoint: CGPointMake(106.81, 215.78)];
    [bezier2Path addCurveToPoint: CGPointMake(225.88, 267.36) controlPoint1: CGPointMake(107.22, 249.58) controlPoint2: CGPointMake(204.64, 266.93)];
    [bezier2Path addCurveToPoint: CGPointMake(233.01, 266.93) controlPoint1: CGPointMake(230.63, 267.36) controlPoint2: CGPointMake(231.71, 267.29)];
    [bezier2Path addCurveToPoint: CGPointMake(242.3, 263.4) controlPoint1: CGPointMake(236.46, 266.06) controlPoint2: CGPointMake(239.63, 264.62)];
    [bezier2Path addCurveToPoint: CGPointMake(231.7, 213.22) controlPoint1: CGPointMake(262.24, 254.33) controlPoint2: CGPointMake(247.65, 224.07)];
    [bezier2Path moveToPoint: CGPointMake(49.05, 161.09)];
    [bezier2Path addCurveToPoint: CGPointMake(90.16, 148.27) controlPoint1: CGPointMake(61.51, 156.34) controlPoint2: CGPointMake(90.09, 152.66)];
    [bezier2Path addCurveToPoint: CGPointMake(50.42, 130.85) controlPoint1: CGPointMake(90.09, 144.17) controlPoint2: CGPointMake(68.63, 134.59)];
    [bezier2Path addCurveToPoint: CGPointMake(246.55, 83.83) controlPoint1: CGPointMake(88.58, 26.88) controlPoint2: CGPointMake(224.8, 74.83)];
    [bezier2Path addCurveToPoint: CGPointMake(265.62, 92.47) controlPoint1: CGPointMake(265.84, 91.82) controlPoint2: CGPointMake(258.5, 89.59)];
    [bezier2Path addCurveToPoint: CGPointMake(280.96, 92.83) controlPoint1: CGPointMake(280.74, 98.59) controlPoint2: CGPointMake(277.14, 94.34)];
    [bezier2Path addLineToPoint: CGPointMake(324.45, 46.03)];
    [bezier2Path addCurveToPoint: CGPointMake(348.93, 85.13) controlPoint1: CGPointMake(336.19, 33.43) controlPoint2: CGPointMake(357.71, 59.71)];
    [bezier2Path addLineToPoint: CGPointMake(319.19, 145.61)];
    [bezier2Path addLineToPoint: CGPointMake(348.93, 200.18)];
    [bezier2Path addCurveToPoint: CGPointMake(324.45, 245.04) controlPoint1: CGPointMake(362.97, 231.43) controlPoint2: CGPointMake(336.69, 264.55)];
    [bezier2Path addCurveToPoint: CGPointMake(273.62, 198.67) controlPoint1: CGPointMake(299.9, 219.34) controlPoint2: CGPointMake(286.36, 190.03)];
    [bezier2Path addCurveToPoint: CGPointMake(122.63, 220.2) controlPoint1: CGPointMake(261.59, 208.1) controlPoint2: CGPointMake(169.14, 232.8)];
    [bezier2Path addCurveToPoint: CGPointMake(49.05, 161.09) controlPoint1: CGPointMake(76.05, 207.67) controlPoint2: CGPointMake(66.54, 194.28)];
    [bezier2Path closePath];
    [bezier2Path moveToPoint: CGPointMake(120.47, 96.36)];
    [bezier2Path addCurveToPoint: CGPointMake(137.11, 111.98) controlPoint1: CGPointMake(129.62, 96.36) controlPoint2: CGPointMake(137.11, 103.34)];
    [bezier2Path addCurveToPoint: CGPointMake(120.47, 127.61) controlPoint1: CGPointMake(137.11, 120.62) controlPoint2: CGPointMake(129.62, 127.61)];
    [bezier2Path addCurveToPoint: CGPointMake(103.84, 111.98) controlPoint1: CGPointMake(111.33, 127.61) controlPoint2: CGPointMake(103.84, 120.62)];
    [bezier2Path addCurveToPoint: CGPointMake(120.47, 96.36) controlPoint1: CGPointMake(103.84, 103.34) controlPoint2: CGPointMake(111.33, 96.36)];
    [bezier2Path closePath];
    bezier2Path.miterLimit = 4;
    
    bezier2Path.lineJoinStyle = kCGLineJoinRound;
    
    [color7 setStroke];
    bezier2Path.lineWidth = self.bezierPathThickness *  2.04;
    [bezier2Path stroke];
}

@end
