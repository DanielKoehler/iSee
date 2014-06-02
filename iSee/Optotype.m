//
//  Optotype.m
//  iSee
//
//  Created by Daniel Koehler on 01/06/2014.
//  Copyright (c) 2014 Evangelos Georgiou. All rights reserved.
//

#import "Optotype.h"
#import "UIColor+Extensions.h"

@implementation Optotype

- (id)initWithFrame:(CGRect)frame {
  
    NSLog(@"Frame: %f", frame.origin.y);
  
    self = [super initWithFrame:frame];
    
    if (self)
    {
      self.vectorScaling = [[NSUserDefaults standardUserDefaults] floatForKey:@"Vector Scaling"];
        self.bezierPathThickness = [[NSUserDefaults standardUserDefaults] floatForKey:@"Bezier Path Thickness"];
        self.contrast = [[NSUserDefaults standardUserDefaults] floatForKey:@"Contrast"];
    }
    
    return self;
}

-(UIColor*) constrastAdjustedColor:(UIColor*) color {
    
    UIColor *background = [UIColor colorWithRed:177.0/255.0
                    green:179.0/255.0
                     blue:180.0/255.0
                    alpha:1];
    
    return [background blendWithColor:color alpha:self.contrast];
}



@end
