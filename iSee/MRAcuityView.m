//
//  MRAcuityView.m
//  EyeTracking
//
//  Created by Michael Rhodes on 25/01/2014.
//  Copyright (c) 2014 Small Text. All rights reserved.
//

#import "MRAcuityView.h"

#import <AVFoundation/AVFoundation.h>

#import "UIImage+Resize.h"

@implementation MRAcuityView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Hack to make drawRect: work for retina
-(void) layoutSubviews {
    [super layoutSubviews];
    self.contentScaleFactor = 1;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);

    CGAffineTransform t0 = CGContextGetCTM(context);
    CGContextConcatCTM(context, t0);

    if (self.image != nil) {
        // Scale the image inside our draw rectangle
        CGRect scaled = AVMakeRectWithAspectRatioInsideRect(self.image.size, self.drawBounds);
        CGContextDrawImage(context, scaled, [self.image CGImage]);

//        NSLog(@"view: x %f, y %f, w %f, h %f", self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height);
//        NSLog(@"scaled: x %f, y %f, w %f, h %f", scaled.origin.x, scaled.origin.y, scaled.size.width, scaled.size.height);
    }

    CGContextRestoreGState(context);
}


@end
