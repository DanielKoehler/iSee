//
//  AVHouse.m
//  iSee
//
//  Created by Daniel Koehler on 01/06/2014.
//  Copyright (c) 2014 Evangelos Georgiou. All rights reserved.
//

#import "AVHouse.h"

@implementation AVHouse

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
    NSLog(@"Starting to draw house BPT:%d", self.bezierPathThickness);
    
    //// Color Declarations
    UIColor* color6 = [self constrastAdjustedColor:[UIColor colorWithRed: 0.103 green: 0.092 blue: 0.095 alpha: 1]];
    UIColor* color7 = [self constrastAdjustedColor:[UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1]];
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(55.78, 111.85)];
    [bezierPath addLineToPoint: CGPointMake(349.03, 111.85)];
    [bezierPath addLineToPoint: CGPointMake(349.03, 242.53)];
    [bezierPath addLineToPoint: CGPointMake(55.78, 242.53)];
    [bezierPath addLineToPoint: CGPointMake(55.78, 111.85)];
    [bezierPath closePath];
    bezierPath.miterLimit = 4;
    
    bezierPath.lineJoinStyle = kCGLineJoinRound;
    
    [color6 setStroke];
    bezierPath.lineWidth = self.bezierPathThickness;
    [bezierPath stroke];
    
    
    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(77.6, 143.02)];
    [bezier2Path addLineToPoint: CGPointMake(150.1, 143.02)];
    [bezier2Path addLineToPoint: CGPointMake(150.1, 175.42)];
    [bezier2Path addLineToPoint: CGPointMake(77.6, 175.42)];
    [bezier2Path addLineToPoint: CGPointMake(77.6, 143.02)];
    [bezier2Path closePath];
    bezier2Path.miterLimit = 4;
    
    bezier2Path.lineJoinStyle = kCGLineJoinRound;
    
    [color6 setStroke];
    bezier2Path.lineWidth = self.bezierPathThickness;
    [bezier2Path stroke];
    
    
    //// Bezier 3 Drawing
    UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
    [bezier3Path moveToPoint: CGPointMake(251.26, 143.02)];
    [bezier3Path addLineToPoint: CGPointMake(325.41, 143.02)];
    [bezier3Path addLineToPoint: CGPointMake(325.41, 175.42)];
    [bezier3Path addLineToPoint: CGPointMake(251.26, 175.42)];
    [bezier3Path addLineToPoint: CGPointMake(251.26, 143.02)];
    [bezier3Path closePath];
    bezier3Path.miterLimit = 4;
    
    bezier3Path.lineJoinStyle = kCGLineJoinRound;
    
    [color6 setStroke];
    bezier3Path.lineWidth = self.bezierPathThickness;
    [bezier3Path stroke];
    
    
    //// Bezier 4 Drawing
    UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
    [bezier4Path moveToPoint: CGPointMake(175.37, 182.62)];
    [bezier4Path addLineToPoint: CGPointMake(227.64, 182.62)];
    [bezier4Path addLineToPoint: CGPointMake(227.64, 242.53)];
    [bezier4Path addLineToPoint: CGPointMake(175.37, 242.53)];
    [bezier4Path addLineToPoint: CGPointMake(175.37, 182.62)];
    [bezier4Path closePath];
    bezier4Path.miterLimit = 4;
    
    bezier4Path.lineJoinStyle = kCGLineJoinRound;
    
    [color6 setStroke];
    bezier4Path.lineWidth = self.bezierPathThickness;
    [bezier4Path stroke];
    
    
    //// Bezier 5 Drawing
    UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
    [bezier5Path moveToPoint: CGPointMake(32.24, 111.85)];
    [bezier5Path addLineToPoint: CGPointMake(77.6, 79.45)];
    [bezier5Path addLineToPoint: CGPointMake(325.41, 79.45)];
    [bezier5Path addLineToPoint: CGPointMake(370.92, 111.85)];
    [bezier5Path addLineToPoint: CGPointMake(32.24, 111.85)];
    [bezier5Path closePath];
    bezier5Path.miterLimit = 4;
    
    bezier5Path.lineJoinStyle = kCGLineJoinRound;
    
    [color6 setStroke];
    bezier5Path.lineWidth = self.bezierPathThickness;
    [bezier5Path stroke];
    
    
    //// Bezier 6 Drawing
    UIBezierPath* bezier6Path = [UIBezierPath bezierPath];
    [bezier6Path moveToPoint: CGPointMake(269.83, 55.47)];
    [bezier6Path addLineToPoint: CGPointMake(305.26, 55.47)];
    [bezier6Path addLineToPoint: CGPointMake(305.26, 79.45)];
    [bezier6Path addLineToPoint: CGPointMake(269.83, 79.45)];
    [bezier6Path addLineToPoint: CGPointMake(269.83, 55.47)];
    [bezier6Path closePath];
    bezier6Path.miterLimit = 4;
    
    bezier6Path.lineJoinStyle = kCGLineJoinRound;
    
    [color6 setStroke];
    bezier6Path.lineWidth = self.bezierPathThickness;
    [bezier6Path stroke];
    
    
    //// Bezier 7 Drawing
    UIBezierPath* bezier7Path = [UIBezierPath bezierPath];
    [bezier7Path moveToPoint: CGPointMake(55.78, 111.85)];
    [bezier7Path addLineToPoint: CGPointMake(349.03, 111.85)];
    [bezier7Path addLineToPoint: CGPointMake(349.03, 242.53)];
    [bezier7Path addLineToPoint: CGPointMake(55.78, 242.53)];
    [bezier7Path addLineToPoint: CGPointMake(55.78, 111.85)];
    [bezier7Path closePath];
    bezier7Path.miterLimit = 4;
    
    bezier7Path.lineJoinStyle = kCGLineJoinRound;
    
    [color7 setStroke];
    bezier7Path.lineWidth = (self.bezierPathThickness / 2);
    [bezier7Path stroke];
    
    
    //// Bezier 8 Drawing
    UIBezierPath* bezier8Path = [UIBezierPath bezierPath];
    [bezier8Path moveToPoint: CGPointMake(77.6, 143.02)];
    [bezier8Path addLineToPoint: CGPointMake(150.1, 143.02)];
    [bezier8Path addLineToPoint: CGPointMake(150.1, 175.42)];
    [bezier8Path addLineToPoint: CGPointMake(77.6, 175.42)];
    [bezier8Path addLineToPoint: CGPointMake(77.6, 143.02)];
    [bezier8Path closePath];
    bezier8Path.miterLimit = 4;
    
    bezier8Path.lineJoinStyle = kCGLineJoinRound;
    
    [color7 setStroke];
    bezier8Path.lineWidth = (self.bezierPathThickness / 2);
    [bezier8Path stroke];
    
    
    //// Bezier 9 Drawing
    UIBezierPath* bezier9Path = [UIBezierPath bezierPath];
    [bezier9Path moveToPoint: CGPointMake(251.26, 143.02)];
    [bezier9Path addLineToPoint: CGPointMake(325.41, 143.02)];
    [bezier9Path addLineToPoint: CGPointMake(325.41, 175.42)];
    [bezier9Path addLineToPoint: CGPointMake(251.26, 175.42)];
    [bezier9Path addLineToPoint: CGPointMake(251.26, 143.02)];
    [bezier9Path closePath];
    bezier9Path.miterLimit = 4;
    
    bezier9Path.lineJoinStyle = kCGLineJoinRound;
    
    [color7 setStroke];
    bezier9Path.lineWidth = (self.bezierPathThickness / 2);
    [bezier9Path stroke];
    
    
    //// Bezier 10 Drawing
    UIBezierPath* bezier10Path = [UIBezierPath bezierPath];
    [bezier10Path moveToPoint: CGPointMake(175.37, 182.62)];
    [bezier10Path addLineToPoint: CGPointMake(227.64, 182.62)];
    [bezier10Path addLineToPoint: CGPointMake(227.64, 242.53)];
    [bezier10Path addLineToPoint: CGPointMake(175.37, 242.53)];
    [bezier10Path addLineToPoint: CGPointMake(175.37, 182.62)];
    [bezier10Path closePath];
    bezier10Path.miterLimit = 4;
    
    bezier10Path.lineJoinStyle = kCGLineJoinRound;
    
    [color7 setStroke];
    bezier10Path.lineWidth = (self.bezierPathThickness / 2);
    [bezier10Path stroke];
    
    
    //// Bezier 11 Drawing
    UIBezierPath* bezier11Path = [UIBezierPath bezierPath];
    [bezier11Path moveToPoint: CGPointMake(32.24, 111.85)];
    [bezier11Path addLineToPoint: CGPointMake(77.6, 79.45)];
    [bezier11Path addLineToPoint: CGPointMake(325.41, 79.45)];
    [bezier11Path addLineToPoint: CGPointMake(370.92, 111.85)];
    [bezier11Path addLineToPoint: CGPointMake(32.24, 111.85)];
    [bezier11Path closePath];
    bezier11Path.miterLimit = 4;
    
    bezier11Path.lineJoinStyle = kCGLineJoinRound;
    
    [color7 setStroke];
    bezier11Path.lineWidth = (self.bezierPathThickness / 2);
    [bezier11Path stroke];
    
    
    //// Bezier 12 Drawing
    UIBezierPath* bezier12Path = [UIBezierPath bezierPath];
    [bezier12Path moveToPoint: CGPointMake(269.83, 55.47)];
    [bezier12Path addLineToPoint: CGPointMake(305.26, 55.47)];
    [bezier12Path addLineToPoint: CGPointMake(305.26, 79.45)];
    [bezier12Path addLineToPoint: CGPointMake(269.83, 79.45)];
    [bezier12Path addLineToPoint: CGPointMake(269.83, 55.47)];
    [bezier12Path closePath];
    bezier12Path.miterLimit = 4;
    
    bezier12Path.lineJoinStyle = kCGLineJoinRound;
    
    [color7 setStroke];
    bezier12Path.lineWidth = (self.bezierPathThickness / 2);
    [bezier12Path stroke];

}
@end
