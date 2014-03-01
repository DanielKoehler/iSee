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
    
    self.settings = @{
                      @"General Settings" :@[
                              @{@"name": @"Screen Brightness",
                                @"reuseIdentifier": @"sliderCell"
                                },
                              @{@"name": @"Contrast",
                                @"reuseIdentifier": @"sliderCell"
                                },
                              @{@"name": @"Enable Eye Corner",
                                @"reuseIdentifier": @"switchCell"
                                }
                              ],
                      @"Algorithm Parameters" : @[
                              @{@"name": @"Gradient Threshold",
                                @"reuseIdentifier": @"sliderCell"
                                },
                              @{@"name": @"Weight Divisor",
                                @"reuseIdentifier": @"sliderCell"
                                },
                              @{@"name": @"Enable Weight",
                                @"reuseIdentifier": @"switchCell"
                                },
                              @{@"name": @"Weight Blur Size",
                                @"reuseIdentifier": @"sliderCell"
                                },
                              @{@"name": @"Fast Eye Width",
                                @"reuseIdentifier": @"sliderCell"
                                }
                              ],
                      @"Preprocessing" : @[
                              @{@"name": @"Smooth Face Factor",
                                @"reuseIdentifier": @"sliderCell"
                                },
                              @{@"name": @"Smooth Face Image",
                                @"reuseIdentifier": @"switchCell"
                                }
                              ],
                      @"Size constants" : @[
                              @{@"name": @"Eye Percent Width",
                                @"reuseIdentifier": @"sliderCell"
                                },
                              @{@"name": @"Eye Percent Height",
                                @"reuseIdentifier": @"sliderCell"
                                },
                              @{@"name": @"Eye Percent Side",
                                @"reuseIdentifier": @"sliderCell"
                                },
                              @{@"name": @"Eye Percent Top",
                                @"reuseIdentifier": @"sliderCell"
                                }
                              ],
                      @"Debugging" :@[
                              @{@"name": @"Plot Vector Field",
                                @"reuseIdentifier": @"switchCell"
                                }
                              ]
                      };
    
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
    return 80;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.settings count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    
    id section = [[self.settings allKeys] objectAtIndex:sectionIndex];
    
    return [[self.settings valueForKey:section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[self.settings allKeys] objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *setting = [self.settings valueForKey:[[self.settings allKeys] objectAtIndex:indexPath.section]][indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:setting[@"reuseIdentifier"]];
    

    cell.selectedBackgroundView = [[UIView alloc] init];
    
    UILabel *name = (UILabel *)[cell viewWithTag:1];
    name.text = setting[@"name"];
    
    return cell;

}

@end
