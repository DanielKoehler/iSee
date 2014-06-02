//
//  AVBoat.m
//  iSee
//
//  Created by Daniel Koehler on 01/06/2014.
//  Copyright (c) 2014 Evangelos Georgiou. All rights reserved.
//

#import "AVBoat.h"

@implementation AVBoat

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    NSLog(@"Starting to draw boat");
    
    //    colorWithRed:0.694
    //    green:0.701
    //    blue:0.705
    
    // o = (1 - n) * diff(r,o)
    // 0.103 = 0.103 + (1 - n) * (0.694 - 0.103)
    
    //// Color Declarations
    
//    (s + (1 - self.bezierPathThickness) * (l - s))
    
    UIColor* color0 = [self constrastAdjustedColor:[UIColor colorWithRed: 0.103 green: 0.092 blue: 0.095 alpha: 1]];
    
    UIColor* color7 = [self constrastAdjustedColor:[UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1]];
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(352.72, 177.63)];
    [bezierPath addLineToPoint: CGPointMake(315.64, 249.2)];
    [bezierPath addLineToPoint: CGPointMake(87.83, 249.2)];
    [bezierPath addLineToPoint: CGPointMake(47.29, 178.14)];
    [bezierPath addCurveToPoint: CGPointMake(352.72, 177.63) controlPoint1: CGPointMake(149.1, 177.92) controlPoint2: CGPointMake(250.9, 177.77)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(119.64, 177.63)];
    [bezierPath addLineToPoint: CGPointMake(119.64, 106.06)];
    [bezierPath addLineToPoint: CGPointMake(281.21, 106.06)];
    [bezierPath moveToPoint: CGPointMake(281.21, 177.63)];
    [bezierPath addLineToPoint: CGPointMake(281.21, 106.06)];
    [bezierPath addLineToPoint: CGPointMake(119.64, 106.06)];
    [bezierPath moveToPoint: CGPointMake(163.92, 106.06)];
    [bezierPath addLineToPoint: CGPointMake(163.92, 50.41)];
    [bezierPath addLineToPoint: CGPointMake(235.42, 50.41)];
    [bezierPath addLineToPoint: CGPointMake(235.42, 106.06)];
    [bezierPath moveToPoint: CGPointMake(159.33, 122.69)];
    [bezierPath addCurveToPoint: CGPointMake(177.83, 139.98) controlPoint1: CGPointMake(169.47, 122.69) controlPoint2: CGPointMake(177.83, 130.47)];
    [bezierPath addCurveToPoint: CGPointMake(159.33, 157.25) controlPoint1: CGPointMake(177.83, 149.48) controlPoint2: CGPointMake(169.47, 157.25)];
    [bezierPath addCurveToPoint: CGPointMake(140.81, 139.98) controlPoint1: CGPointMake(149.17, 157.25) controlPoint2: CGPointMake(140.81, 149.48)];
    [bezierPath addCurveToPoint: CGPointMake(159.33, 122.69) controlPoint1: CGPointMake(140.81, 130.47) controlPoint2: CGPointMake(149.17, 122.69)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(242.12, 122.69)];
    [bezierPath addCurveToPoint: CGPointMake(260.62, 139.98) controlPoint1: CGPointMake(252.27, 122.69) controlPoint2: CGPointMake(260.62, 130.47)];
    [bezierPath addCurveToPoint: CGPointMake(242.12, 157.25) controlPoint1: CGPointMake(260.62, 149.48) controlPoint2: CGPointMake(252.27, 157.25)];
    [bezierPath addCurveToPoint: CGPointMake(223.61, 139.98) controlPoint1: CGPointMake(231.96, 157.25) controlPoint2: CGPointMake(223.61, 149.48)];
    [bezierPath addCurveToPoint: CGPointMake(242.12, 122.69) controlPoint1: CGPointMake(223.61, 130.47) controlPoint2: CGPointMake(231.96, 122.69)];
    [bezierPath closePath];
    bezierPath.miterLimit = 4;
    
    bezierPath.lineJoinStyle = kCGLineJoinRound;
    
    [color0 setStroke];
    bezierPath.lineWidth = 10.22;
    [bezierPath stroke];
    
    
    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(352.72, 177.63)];
    [bezier2Path addLineToPoint: CGPointMake(315.64, 249.2)];
    [bezier2Path addLineToPoint: CGPointMake(87.83, 249.2)];
    [bezier2Path addLineToPoint: CGPointMake(47.29, 178.14)];
    [bezier2Path addCurveToPoint: CGPointMake(352.72, 177.63) controlPoint1: CGPointMake(149.1, 177.92) controlPoint2: CGPointMake(250.9, 177.77)];
    [bezier2Path closePath];
    [bezier2Path moveToPoint: CGPointMake(119.64, 177.63)];
    [bezier2Path addLineToPoint: CGPointMake(119.64, 106.06)];
    [bezier2Path addLineToPoint: CGPointMake(281.21, 106.06)];
    [bezier2Path moveToPoint: CGPointMake(281.21, 177.63)];
    [bezier2Path addLineToPoint: CGPointMake(281.21, 106.06)];
    [bezier2Path addLineToPoint: CGPointMake(119.64, 106.06)];
    [bezier2Path moveToPoint: CGPointMake(163.92, 106.06)];
    [bezier2Path addLineToPoint: CGPointMake(163.92, 50.41)];
    [bezier2Path addLineToPoint: CGPointMake(235.42, 50.41)];
    [bezier2Path addLineToPoint: CGPointMake(235.42, 106.06)];
    [bezier2Path moveToPoint: CGPointMake(159.33, 122.69)];
    [bezier2Path addCurveToPoint: CGPointMake(177.83, 139.98) controlPoint1: CGPointMake(169.47, 122.69) controlPoint2: CGPointMake(177.83, 130.47)];
    [bezier2Path addCurveToPoint: CGPointMake(159.33, 157.25) controlPoint1: CGPointMake(177.83, 149.48) controlPoint2: CGPointMake(169.47, 157.25)];
    [bezier2Path addCurveToPoint: CGPointMake(140.81, 139.98) controlPoint1: CGPointMake(149.17, 157.25) controlPoint2: CGPointMake(140.81, 149.48)];
    [bezier2Path addCurveToPoint: CGPointMake(159.33, 122.69) controlPoint1: CGPointMake(140.81, 130.47) controlPoint2: CGPointMake(149.17, 122.69)];
    [bezier2Path closePath];
    [bezier2Path moveToPoint: CGPointMake(242.12, 122.69)];
    [bezier2Path addCurveToPoint: CGPointMake(260.62, 139.98) controlPoint1: CGPointMake(252.27, 122.69) controlPoint2: CGPointMake(260.62, 130.47)];
    [bezier2Path addCurveToPoint: CGPointMake(242.12, 157.25) controlPoint1: CGPointMake(260.62, 149.48) controlPoint2: CGPointMake(252.27, 157.25)];
    [bezier2Path addCurveToPoint: CGPointMake(223.61, 139.98) controlPoint1: CGPointMake(231.96, 157.25) controlPoint2: CGPointMake(223.61, 149.48)];
    [bezier2Path addCurveToPoint: CGPointMake(242.12, 122.69) controlPoint1: CGPointMake(223.61, 130.47) controlPoint2: CGPointMake(231.96, 122.69)];
    [bezier2Path closePath];
    bezier2Path.miterLimit = 4;
    
    bezier2Path.lineJoinStyle = kCGLineJoinRound;
    
    [color7 setStroke];
    bezier2Path.lineWidth = 5.11;
    [bezier2Path stroke];

}
@end
