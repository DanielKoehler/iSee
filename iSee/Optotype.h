//
//  Optotype.h
//  iSee
//
//  Created by Daniel Koehler on 01/06/2014.
//  Copyright (c) 2014 Evangelos Georgiou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Optotype : UIView

@property (nonatomic) float contrast;
@property (nonatomic) float vectorScaling;
@property (nonatomic) int bezierPathThickness;

-(UIColor*) constrastAdjustedColor:(UIColor*) color;

@end
