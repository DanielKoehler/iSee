//
//  Int32TableViewCell.m
//  OpenCV Tutorial
//
//  Created by BloodAxe on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Int32TableViewCell.h"
#import "NSString+StdString.h"

@implementation Int32TableViewCell
@synthesize option;
@synthesize label;
@synthesize sliderValue;
@synthesize currentValue;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) configureWithOption: (Int32Option*) opt
{
  self.option = opt;
  
  label.text = [NSString stringWithStdString: option->getName()];
  
  sliderValue.maximumValue = self.option->getMaxValue();
  sliderValue.minimumValue = self.option->getMinValue();
  sliderValue.value =        self.option->getValue();
  
  [self sliderValueChanged:self];
}

- (IBAction)sliderValueChanged:(id)sender 
{
  currentValue.text = [NSString stringWithFormat:@"%d", (int)sliderValue.value];
  
  bool changed = option->setValue( (int)sliderValue.value);
  if (changed && self.delegate)
  {
    [self.delegate optionDidChanged:option];
  }
}


@end
