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
                                @"handler":@"enableEyeCornerDidSwitch:"
                                },
                              @{@"name": @"Screen Brightness",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"screenBrightnessDidChange:"
                                },
                              @{@"name": @"Contrast",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"contrastDidChange:"
                                }
                              ]
                        },
                      @{@"name":@"Algorithm Parameters" ,
                        @"items": @[
                              @{@"name": @"Enable Weight",
                                @"reuseIdentifier": @"switchCell",
                                @"handler":@"enableWeightDidSwitch:"
                                },
                              @{@"name": @"Gradient Threshold",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"gradientThesholdDidChange:"
                                },
                              @{@"name": @"Weight Divisor",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"weightDivisorDidChange:"
                                },
                              @{@"name": @"Weight Blur Size",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"weightBlurSizeDidChange:"
                                },
                              @{@"name": @"Fast Eye Width",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"fastEyeWidthDidChange:"
                                }
                              ]
                        },
                      @{@"name":@"Preprocessing" ,
                        @"items": @[
                              @{@"name": @"Smooth Face Image",
                                @"reuseIdentifier": @"switchCell",
                                @"handler":@"smoothFaceImageDidSwitch:"
                                },
                              @{@"name": @"Smooth Face Factor",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"smoothFaceFactorDidChange:"
                                }
                              ]
                        },
                      @{@"name":@"Size constants" ,
                        @"items": @[
                              @{@"name": @"Eye Percent Width",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"eyePercentWidthDidChange:"
                                },
                              @{@"name": @"Eye Percent Height",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"eyePercentHeightDidChange:"
                                },
                              @{@"name": @"Eye Percent Side",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"eyePercentSideDidChange:"
                                },
                              @{@"name": @"Eye Percent Top",
                                @"reuseIdentifier": @"sliderCell",
                                @"handler":@"eyePercentTopDidChange:"
                                }
                              ]
                        },
                      @{@"name": @"Debugging" ,
                        @"items":@[
                              @{@"name": @"Plot Vector Field",
                                @"reuseIdentifier": @"switchCell",
                                @"handler":@"plotVectorFieldDidSwitch:"
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
    
    if([setting[@"reuseIdentifier"]  isEqual: @"sliderCell"])
    {
        UISlider *slider = (UISlider*)[cell viewWithTag:2];
      
        slider.restorationIdentifier = setting[@"name"];
        slider.value = [[NSUserDefaults standardUserDefaults] floatForKey:setting[@"name"]];
    
        [slider addTarget:self action:NSSelectorFromString(setting[@"handler"]) forControlEvents:UIControlEventValueChanged];
        
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

-(void) enableEyeCornerDidSwitch:(UISwitch *)uiswitch
{
    NSLog(@"%hhd", [uiswitch isOn]);
    
    [[NSUserDefaults standardUserDefaults] setBool:uiswitch.isOn forKey:uiswitch.restorationIdentifier];

}

-(void) enableWeightDidSwitch:(UISwitch *)uiswitch
{
    
    [[NSUserDefaults standardUserDefaults] setBool:uiswitch.isOn forKey:uiswitch.restorationIdentifier];
    
}

-(void) smoothFaceImageDidSwitch:(UISwitch *)uiswitch
{
    
    [[NSUserDefaults standardUserDefaults] setBool:uiswitch.isOn forKey:uiswitch.restorationIdentifier];
    
}

-(void) plotVectorFieldDidSwitch:(UISwitch *)uiswitch
{
    
    [[NSUserDefaults standardUserDefaults] setBool:uiswitch.isOn forKey:uiswitch.restorationIdentifier];
    
}

// Slider Handlers

-(void) screenBrightnessDidChange:(UISlider *)uislider
{
    
    NSLog(@"%f", uislider.value);
    [[UIScreen mainScreen] setBrightness:uislider.value];
    [[NSUserDefaults standardUserDefaults] setFloat:uislider.value forKey:uislider.restorationIdentifier];

}

-(void) contrastDidChange:(UISlider *)uislider
{
    
    
    
    [[NSUserDefaults standardUserDefaults] setFloat:uislider.value forKey:uislider.restorationIdentifier];

}

-(void) gradientThesholdDidChange:(UISlider *)uislider
{
    
    [[NSUserDefaults standardUserDefaults] setFloat:uislider.value forKey:uislider.restorationIdentifier];
    
}

-(void) weightDivisorDidChange:(UISlider *)uislider
{
    
    [[NSUserDefaults standardUserDefaults] setFloat:uislider.value forKey:uislider.restorationIdentifier];
    
}

-(void) weightBlurSizeDidChange:(UISlider *)uislider
{
    
    [[NSUserDefaults standardUserDefaults] setFloat:uislider.value forKey:uislider.restorationIdentifier];
    
}

-(void) fastEyeWidthDidChange:(UISlider *)uislider
{
    
    [[NSUserDefaults standardUserDefaults] setFloat:uislider.value forKey:uislider.restorationIdentifier];
    
}

-(void) smoothFaceFactorDidChange:(UISlider *)uislider
{
    
    [[NSUserDefaults standardUserDefaults] setFloat:uislider.value forKey:uislider.restorationIdentifier];
    
}

-(void) eyePercentWidthDidChange:(UISlider *)uislider
{
    
    [[NSUserDefaults standardUserDefaults] setFloat:uislider.value forKey:uislider.restorationIdentifier];
    
}

-(void) eyePercentHeightDidChange:(UISlider *)uislider
{
    
    [[NSUserDefaults standardUserDefaults] setFloat:uislider.value forKey:uislider.restorationIdentifier];
    
}

-(void) eyePercentSideDidChange:(UISlider *)uislider
{
    
    [[NSUserDefaults standardUserDefaults] setFloat:uislider.value forKey:uislider.restorationIdentifier];
    
}

-(void) eyePercentTopDidChange:(UISlider *)uislider
{
    
    [[NSUserDefaults standardUserDefaults] setFloat:uislider.value forKey:uislider.restorationIdentifier];
    
}

@end
