//
//  SettingsViewController.m
//  iSee
//
//  Created by Daniel Koehler on 01/03/2014.
//  Copyright (c) 2014 Evangelos Georgiou. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.settings = @[
                      @{@"name":@"General Settings",
                        @"items":@[
                              @{@"name": @"Enable Eye Corner",
                                @"reuseIdentifier": @"switchCell",
                                @"handler":@"switchValueDidChange:"
                                },
                              @{@"name": @"Screen Brightness",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"screenBrightnessDidChange:",
                                @"min":[NSNumber numberWithFloat:0],
                                @"max":[NSNumber numberWithFloat:1],
                                @"default":[NSNumber numberWithFloat:1]
                                },
                              ],
                        },
                        @{@"name":@"Optotype Parameters",
                            @"items":@[
                              @{@"name": @"Contrast",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"sliderValueDidChange:",
                                @"min":[NSNumber numberWithFloat:0],
                                @"max":[NSNumber numberWithFloat:1],
                                @"default":[NSNumber numberWithFloat:1]
                                },
                              @{@"name": @"Vector Scaling",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"sliderValueDidChange:",
                                @"min":[NSNumber numberWithFloat:0],
                                @"max":[NSNumber numberWithFloat:0],
                                @"default":[NSNumber numberWithFloat:1]
                                },
                              @{@"name": @"Bezier Path Thickness",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"sliderValueDidChange:",
                                @"min":[NSNumber numberWithFloat:0.01],
                                @"max":[NSNumber numberWithFloat:2],
                                @"default":[NSNumber numberWithFloat:1]
                                },
                              ]
                        },
                      @{@"name":@"Algorithm Parameters" ,
                        @"items": @[
                              @{@"name": @"Enable Weight",
                                @"reuseIdentifier": @"switchCell",
                                @"handler":@"switchValueDidChange:"
                                },
                              @{@"name": @"Gradient Threshold",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"sliderValueDidChange:",
                                @"min":[NSNumber numberWithFloat:20],
                                @"max":[NSNumber numberWithFloat:100],
                                @"default":[NSNumber numberWithFloat:50.0]
                                },
                              @{@"name": @"Weight Divisor",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"sliderValueDidChange:",
                                @"min":[NSNumber numberWithFloat:50],
                                @"max":[NSNumber numberWithFloat:150],
                                @"default":[NSNumber numberWithFloat:150.0]
                                },
                              @{@"name": @"Weight Blur Size",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"sliderValueDidChange:",
                                @"min":[NSNumber numberWithFloat:1],
                                @"max":[NSNumber numberWithFloat:10],
                                @"default":[NSNumber numberWithFloat:5.0]
                                },
                              @{@"name": @"Fast Eye Width",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"sliderValueDidChange:",
                                @"min":[NSNumber numberWithFloat:10],
                                @"max":[NSNumber numberWithFloat:100],
                                @"default":[NSNumber numberWithFloat:50.0]
                                }
                              ]
                        },
                      @{@"name":@"Preprocessing" ,
                        @"items": @[
                              @{@"name": @"Smooth Face Image",
                                @"reuseIdentifier": @"switchCell",
                                @"handler":@"switchValueDidChange:"
                                },
                              @{@"name": @"Smooth Face Factor",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"sliderValueDidChange:",
                                @"min":[NSNumber numberWithFloat:0.001],
                                @"max":[NSNumber numberWithFloat:0.010],
                                @"default":[NSNumber numberWithFloat:0.005]
                                }
                              ]
                        },
                      @{@"name":@"Size constants" ,
                        @"items": @[
                              @{@"name": @"Eye Percent Width",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"sliderValueDidChange:",
                                @"min":[NSNumber numberWithFloat:10],
                                @"max":[NSNumber numberWithFloat:100],
                                @"default":[NSNumber numberWithFloat:35]
                                },
                              @{@"name": @"Eye Percent Height",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"sliderValueDidChange:",
                                @"min":[NSNumber numberWithFloat:10],
                                @"max":[NSNumber numberWithFloat:100],
                                @"default":[NSNumber numberWithFloat:30]
                                },
                              @{@"name": @"Eye Percent Side",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"sliderValueDidChange:",
                                @"min":[NSNumber numberWithFloat:10],
                                @"max":[NSNumber numberWithFloat:100],
                                @"default":[NSNumber numberWithFloat:13]
                                },
                              @{@"name": @"Eye Percent Top",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"sliderValueDidChange:",
                                @"min":[NSNumber numberWithFloat:10],
                                @"max":[NSNumber numberWithFloat:100],
                                @"default":[NSNumber numberWithFloat:25]
                                }
                              ]
                        },
                      @{@"name": @"Debugging" ,
                        @"items":@[
                              @{@"name": @"Plot Vector Field",
                                @"reuseIdentifier": @"switchCell",
                                @"handler":@"switchValueDidChange:"
                                }
                              ]
                        }
                      ];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    if([[self.settings valueForKey:[[self.settings allKeys] objectAtIndex:indexPath.section]][indexPath.row][@"reuseIdentifier"]  isEqual: @"switchCell"])
//        return 56;
    return 52;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 52;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.settings count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return [self.settings[sectionIndex][@"items"] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.settings[section][@"name"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *setting = self.settings[indexPath.section][@"items"][indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:setting[@"reuseIdentifier"]];
    
    cell.selectedBackgroundView = [[UIView alloc] init];
    
    UILabel *name = (UILabel *)[cell viewWithTag:1];
    name.text = setting[@"name"];
    UILabel *label = (UILabel*)[cell viewWithTag:4];
  
    if([setting[@"reuseIdentifier"]  isEqual: @"sliderCell"])
    {
        UISlider *slider = (UISlider*)[cell viewWithTag:2];
      
      
        slider.restorationIdentifier = setting[@"name"];
      
        [slider addTarget:self action:NSSelectorFromString(setting[@"handler"]) forControlEvents:UIControlEventValueChanged];
        slider.minimumValue = [setting[@"min"] floatValue];
        slider.maximumValue = [setting[@"max"] floatValue];
      
      
        if(![[NSUserDefaults standardUserDefaults] floatForKey:setting[@"name"]]){
          [[NSUserDefaults standardUserDefaults] setFloat:[setting[@"default"] floatValue] forKey:setting[@"name"]];
        }
      
        slider.value = [[NSUserDefaults standardUserDefaults] floatForKey:setting[@"name"]];
        label.text = [NSString stringWithFormat:@"%.3f", slider.value];
      
      
    } else if ([setting[@"reuseIdentifier"]  isEqual: @"switchCell"])
    {
        UISwitch *button = (UISwitch*)[cell viewWithTag:3];
        
        button.restorationIdentifier = setting[@"name"];
        button.on = [[NSUserDefaults standardUserDefaults] boolForKey:setting[@"name"]];
      
        [button addTarget:self action:NSSelectorFromString(setting[@"handler"]) forControlEvents:UIControlEventValueChanged];
    }
    
    return cell;

}

// Switch Handlers

-(void) switchValueDidChange:(UISwitch *)uiswitch
{
    NSLog(@"%hhd", [uiswitch isOn]);
    NSLog(@"%@", [uiswitch restorationIdentifier]);
  
    [[NSUserDefaults standardUserDefaults] setBool:uiswitch.isOn forKey:uiswitch.restorationIdentifier];

}

// Slider Handlers

-(void) sliderValueDidChange:(UISlider *)uislider
{
    NSLog(@"%f", uislider.value);
    NSLog(@"%@", [uislider restorationIdentifier]);
    [[NSUserDefaults standardUserDefaults] setFloat:uislider.value forKey:uislider.restorationIdentifier];
    [(UILabel*) [uislider.superview viewWithTag:4] setText:[NSString stringWithFormat:@"%.3f", uislider.value]];

}


-(void) screenBrightnessDidChange:(UISlider *)uislider
{
  NSLog(@"%f", uislider.value);
  NSLog(@"%@", [uislider restorationIdentifier]);
  
  
  [[UIScreen mainScreen] setBrightness:uislider.value];
  
  [self sliderValueDidChange:uislider];
  
}



@end
