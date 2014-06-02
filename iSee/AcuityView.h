//
//  AcuityView.h
//  EyeTracking
//
//  Created by Michael Rhodes on 25/01/2014.
//  Copyright (c) 2014 Small Text. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Optotype.h"

@interface AcuityView : UIView

@property (nonatomic, strong) Optotype *optotype;
@property (nonatomic) CGRect drawBounds;
@property (nonatomic, strong) UIView *innerView;

@property (nonatomic, retain) Optotype *optotypeView;

@end
