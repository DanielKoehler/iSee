//
//  AcuityView.m
//  EyeTracking
//
//  Created by Michael Rhodes on 25/01/2014.
//  Copyright (c) 2014 Small Text. All rights reserved.
//

#import "AcuityView.h"
#import "Optotype.h"

#import <AVFoundation/AVFoundation.h>

@implementation AcuityView

-(void)awakeFromNib
{
    [super awakeFromNib];
    NSLog(@"View Did Load");
    // Initialization code
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) layoutSubviews {
    
    if (self.optotypeView != nil){
        [self.optotypeView removeFromSuperview];
        self.optotypeView = nil; // unloads the view
    }
    
    if (self.optotype != nil){
        
        self.optotypeView = [self.optotype initWithFrame:self.drawBounds];
        
        [[self optotypeView] setBackgroundColor:self.backgroundColor];
        
        [self addSubview:self.optotypeView];
    }
    
    [super layoutSubviews];
}

@end
