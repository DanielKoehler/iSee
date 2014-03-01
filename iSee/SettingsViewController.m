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
    return 150;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    NSDictionary *settings = @{
//                               @"General Settings" :@{
                                       @"Screen Brightness":@"sliderCell",
                                       @"Contrast":@"sliderCell",
                                       @"Enable Eye Corner":@"switchCell",
//                                       },
//                               @"Algorithm Parameters" : @{
                                       @"Gradient Threshold":@"sliderCell",
                                       @"Weight Divisor":@"sliderCell",
                                       @"Enable Weight":@"switchCell",
                                       @"Weight Blur Size":@"sliderCell",
//                                       @"Fast Eye Width":@"sliderCell",
//                                       },
//                               @"Preprocessing" : @{
                                       @"Smooth Face Factor":@"sliderCell",
//                                       @"Smooth Face Image":@"switchCell",
//                                       },
//                               @"Size constants" : @{
                                       @"Eye Percent Width":@"sliderCell",
                                       @"Eye Percent Height":@"sliderCell",
                                       @"Eye Percent Side":@"sliderCell",
//                                       @"Eye Percent Top":@"sliderCell",
//                                       },
//                               @"Debugging" : @{
                                       @"Plot Vector Field":@"switchCell",
//                                       }
                                 };
    
    NSString *cellIdentifier = @"Cell";
    
    if(indexPath.row == 0){
        cellIdentifier = @"UserProfile";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    if (cell == nil && indexPath.row != 0){
        cell = [[UITableViewCell alloc] initWithStyle:  UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//        cell.selectedBackgroundView = [[UIView alloc] init];
        
        NSArray *keys = [settings allKeys];
        id aKey = [keys objectAtIndex:indexPath.row];
        NSLog([settings valueForKey:aKey]);
        
        UILabel *name = (UILabel *)[cell viewWithTag:1];
        name.text = [settings valueForKey:aKey];
    }
    
    return cell;
}

@end
