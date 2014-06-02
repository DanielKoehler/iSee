//
//  SettingsViewController.h
//  iSee
//
//  Created by Daniel Koehler on 01/03/2014.
//  Copyright (c) 2014 Evangelos Georgiou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) NSArray *settings;

-(IBAction)restoreDefault:(id)sender;

@end
