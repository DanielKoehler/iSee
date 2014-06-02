//
//  AVTrain.m
//  iSee
//
//  Created by Daniel Koehler on 02/06/2014.
//  Copyright (c) 2014 Evangelos Georgiou. All rights reserved.
//

#import "AVTrain.h"

@implementation AVTrain

-(void) drawRect:(CGRect)rect {
    
    //// Color Declarations
    UIColor* color9 = [self constrastAdjustedColor:[UIColor colorWithRed: 0.103 green: 0.092 blue: 0.095 alpha: 1]];
    UIColor* color10 = [self constrastAdjustedColor:[UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1]];
    
    //// Bezier 3 Drawing
    UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
    [bezier3Path moveToPoint: CGPointMake(76.89, 205.55)];
    [bezier3Path addCurveToPoint: CGPointMake(47.08, 207.57) controlPoint1: CGPointMake(69.54, 210.59) controlPoint2: CGPointMake(53.92, 213.62)];
    [bezier3Path addLineToPoint: CGPointMake(47.08, 133.77)];
    [bezier3Path addLineToPoint: CGPointMake(66.95, 133.77)];
    [bezier3Path addLineToPoint: CGPointMake(66.3, 67.67)];
    [bezier3Path addLineToPoint: CGPointMake(92.8, 67.67)];
    [bezier3Path addLineToPoint: CGPointMake(90.13, 133.98)];
    [bezier3Path addLineToPoint: CGPointMake(151.26, 133.62)];
    [bezier3Path addLineToPoint: CGPointMake(151.26, 119.37)];
    [bezier3Path addLineToPoint: CGPointMake(195.47, 119.37)];
    [bezier3Path addLineToPoint: CGPointMake(195.47, 133.62)];
    [bezier3Path addLineToPoint: CGPointMake(250.77, 133.62)];
    [bezier3Path addLineToPoint: CGPointMake(250.77, 64.65)];
    [bezier3Path addLineToPoint: CGPointMake(351.85, 64.65)];
    [bezier3Path addLineToPoint: CGPointMake(351.85, 88.7)];
    [bezier3Path addLineToPoint: CGPointMake(302.83, 88.7)];
    [bezier3Path addLineToPoint: CGPointMake(302.83, 133.62)];
    [bezier3Path addLineToPoint: CGPointMake(353.38, 133.62)];
    [bezier3Path addLineToPoint: CGPointMake(353.38, 208.07)];
    [bezier3Path moveToPoint: CGPointMake(112.81, 181.79)];
    [bezier3Path addCurveToPoint: CGPointMake(139.31, 208.36) controlPoint1: CGPointMake(127.36, 181.79) controlPoint2: CGPointMake(139.31, 193.74)];
    [bezier3Path addCurveToPoint: CGPointMake(112.81, 234.93) controlPoint1: CGPointMake(139.31, 222.98) controlPoint2: CGPointMake(127.36, 234.93)];
    [bezier3Path addCurveToPoint: CGPointMake(86.32, 208.36) controlPoint1: CGPointMake(98.27, 234.93) controlPoint2: CGPointMake(86.32, 222.98)];
    [bezier3Path addCurveToPoint: CGPointMake(112.81, 181.79) controlPoint1: CGPointMake(86.32, 193.74) controlPoint2: CGPointMake(98.27, 181.79)];
    [bezier3Path closePath];
    [bezier3Path moveToPoint: CGPointMake(177.4, 181.79)];
    [bezier3Path addCurveToPoint: CGPointMake(203.89, 208.36) controlPoint1: CGPointMake(191.94, 181.79) controlPoint2: CGPointMake(203.89, 193.74)];
    [bezier3Path addCurveToPoint: CGPointMake(177.4, 234.93) controlPoint1: CGPointMake(203.89, 222.98) controlPoint2: CGPointMake(191.94, 234.93)];
    [bezier3Path addCurveToPoint: CGPointMake(150.9, 208.36) controlPoint1: CGPointMake(162.85, 234.93) controlPoint2: CGPointMake(150.9, 222.98)];
    [bezier3Path addCurveToPoint: CGPointMake(177.4, 181.79) controlPoint1: CGPointMake(150.9, 193.74) controlPoint2: CGPointMake(162.85, 181.79)];
    [bezier3Path closePath];
    [bezier3Path moveToPoint: CGPointMake(241.98, 181.79)];
    [bezier3Path addCurveToPoint: CGPointMake(268.48, 208.36) controlPoint1: CGPointMake(256.53, 181.79) controlPoint2: CGPointMake(268.48, 193.74)];
    [bezier3Path addCurveToPoint: CGPointMake(241.98, 234.93) controlPoint1: CGPointMake(268.48, 222.98) controlPoint2: CGPointMake(256.53, 234.93)];
    [bezier3Path addCurveToPoint: CGPointMake(215.49, 208.36) controlPoint1: CGPointMake(227.44, 234.93) controlPoint2: CGPointMake(215.49, 222.98)];
    [bezier3Path addCurveToPoint: CGPointMake(241.98, 181.79) controlPoint1: CGPointMake(215.49, 193.74) controlPoint2: CGPointMake(227.44, 181.79)];
    [bezier3Path closePath];
    [bezier3Path moveToPoint: CGPointMake(306.56, 181.79)];
    [bezier3Path addCurveToPoint: CGPointMake(333.06, 208.36) controlPoint1: CGPointMake(321.11, 181.79) controlPoint2: CGPointMake(333.06, 193.74)];
    [bezier3Path addCurveToPoint: CGPointMake(306.56, 234.93) controlPoint1: CGPointMake(333.06, 222.98) controlPoint2: CGPointMake(321.11, 234.93)];
    [bezier3Path addCurveToPoint: CGPointMake(280.07, 208.36) controlPoint1: CGPointMake(292.02, 234.93) controlPoint2: CGPointMake(280.07, 222.98)];
    [bezier3Path addCurveToPoint: CGPointMake(306.56, 181.79) controlPoint1: CGPointMake(280.07, 193.74) controlPoint2: CGPointMake(292.02, 181.79)];
    [bezier3Path closePath];
    bezier3Path.miterLimit = 4;
    
    bezier3Path.lineJoinStyle = kCGLineJoinRound;
    
    [color9 setStroke];
    bezier3Path.lineWidth = self.bezierPathThickness * 8.22;
    [bezier3Path stroke];
    
    
    //// Bezier 4 Drawing
    UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
    [bezier4Path moveToPoint: CGPointMake(76.89, 205.55)];
    [bezier4Path addCurveToPoint: CGPointMake(47.08, 207.57) controlPoint1: CGPointMake(69.54, 210.59) controlPoint2: CGPointMake(53.92, 213.62)];
    [bezier4Path addLineToPoint: CGPointMake(47.08, 133.77)];
    [bezier4Path addLineToPoint: CGPointMake(66.95, 133.77)];
    [bezier4Path addLineToPoint: CGPointMake(66.3, 67.67)];
    [bezier4Path addLineToPoint: CGPointMake(92.8, 67.67)];
    [bezier4Path addLineToPoint: CGPointMake(90.13, 133.98)];
    [bezier4Path addLineToPoint: CGPointMake(151.26, 133.62)];
    [bezier4Path addLineToPoint: CGPointMake(151.26, 119.37)];
    [bezier4Path addLineToPoint: CGPointMake(195.47, 119.37)];
    [bezier4Path addLineToPoint: CGPointMake(195.47, 133.62)];
    [bezier4Path addLineToPoint: CGPointMake(250.77, 133.62)];
    [bezier4Path addLineToPoint: CGPointMake(250.77, 64.65)];
    [bezier4Path addLineToPoint: CGPointMake(351.85, 64.65)];
    [bezier4Path addLineToPoint: CGPointMake(351.85, 88.7)];
    [bezier4Path addLineToPoint: CGPointMake(302.83, 88.7)];
    [bezier4Path addLineToPoint: CGPointMake(302.83, 133.62)];
    [bezier4Path addLineToPoint: CGPointMake(353.38, 133.62)];
    [bezier4Path addLineToPoint: CGPointMake(353.38, 208.07)];
    [bezier4Path moveToPoint: CGPointMake(112.81, 181.79)];
    [bezier4Path addCurveToPoint: CGPointMake(139.31, 208.36) controlPoint1: CGPointMake(127.36, 181.79) controlPoint2: CGPointMake(139.31, 193.74)];
    [bezier4Path addCurveToPoint: CGPointMake(112.81, 234.93) controlPoint1: CGPointMake(139.31, 222.98) controlPoint2: CGPointMake(127.36, 234.93)];
    [bezier4Path addCurveToPoint: CGPointMake(86.32, 208.36) controlPoint1: CGPointMake(98.27, 234.93) controlPoint2: CGPointMake(86.32, 222.98)];
    [bezier4Path addCurveToPoint: CGPointMake(112.81, 181.79) controlPoint1: CGPointMake(86.32, 193.74) controlPoint2: CGPointMake(98.27, 181.79)];
    [bezier4Path closePath];
    [bezier4Path moveToPoint: CGPointMake(177.4, 181.79)];
    [bezier4Path addCurveToPoint: CGPointMake(203.89, 208.36) controlPoint1: CGPointMake(191.94, 181.79) controlPoint2: CGPointMake(203.89, 193.74)];
    [bezier4Path addCurveToPoint: CGPointMake(177.4, 234.93) controlPoint1: CGPointMake(203.89, 222.98) controlPoint2: CGPointMake(191.94, 234.93)];
    [bezier4Path addCurveToPoint: CGPointMake(150.9, 208.36) controlPoint1: CGPointMake(162.85, 234.93) controlPoint2: CGPointMake(150.9, 222.98)];
    [bezier4Path addCurveToPoint: CGPointMake(177.4, 181.79) controlPoint1: CGPointMake(150.9, 193.74) controlPoint2: CGPointMake(162.85, 181.79)];
    [bezier4Path closePath];
    [bezier4Path moveToPoint: CGPointMake(241.98, 181.79)];
    [bezier4Path addCurveToPoint: CGPointMake(268.48, 208.36) controlPoint1: CGPointMake(256.53, 181.79) controlPoint2: CGPointMake(268.48, 193.74)];
    [bezier4Path addCurveToPoint: CGPointMake(241.98, 234.93) controlPoint1: CGPointMake(268.48, 222.98) controlPoint2: CGPointMake(256.53, 234.93)];
    [bezier4Path addCurveToPoint: CGPointMake(215.49, 208.36) controlPoint1: CGPointMake(227.44, 234.93) controlPoint2: CGPointMake(215.49, 222.98)];
    [bezier4Path addCurveToPoint: CGPointMake(241.98, 181.79) controlPoint1: CGPointMake(215.49, 193.74) controlPoint2: CGPointMake(227.44, 181.79)];
    [bezier4Path closePath];
    [bezier4Path moveToPoint: CGPointMake(306.56, 181.79)];
    [bezier4Path addCurveToPoint: CGPointMake(333.06, 208.36) controlPoint1: CGPointMake(321.11, 181.79) controlPoint2: CGPointMake(333.06, 193.74)];
    [bezier4Path addCurveToPoint: CGPointMake(306.56, 234.93) controlPoint1: CGPointMake(333.06, 222.98) controlPoint2: CGPointMake(321.11, 234.93)];
    [bezier4Path addCurveToPoint: CGPointMake(280.07, 208.36) controlPoint1: CGPointMake(292.02, 234.93) controlPoint2: CGPointMake(280.07, 222.98)];
    [bezier4Path addCurveToPoint: CGPointMake(306.56, 181.79) controlPoint1: CGPointMake(280.07, 193.74) controlPoint2: CGPointMake(292.02, 181.79)];
    [bezier4Path closePath];
    bezier4Path.miterLimit = 4;
    
    bezier4Path.lineJoinStyle = kCGLineJoinRound;
    
    [color10 setStroke];
    bezier4Path.lineWidth = self.bezierPathThickness * 4.11;
    [bezier4Path stroke];
    
}

@end
