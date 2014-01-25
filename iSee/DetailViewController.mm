//
//  DetailViewController.m
//  OpenCV Tutorial
//
//  Created by BloodAxe on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "VideoViewController.h"
#import "NSString+StdString.h"
#import "AppDelegate.h"
#import "BaseSampleViewController.h"

@interface DetailViewController ()

@property (strong, nonatomic) UIPopoverController *masterPopoverController;

@property (weak, nonatomic) VideoViewController * activeVideoController;

- (void)configureView;
@end

@implementation DetailViewController
@synthesize sampleIconView;
@synthesize sampleDescriptionTextView;
@synthesize runOnImageButton;
@synthesize runOnVideoButton;
@synthesize masterPopoverController = _masterPopoverController;

#pragma mark - Managing the detail item

- (void)setDetailItem:(SampleFacade*) sample
{
    if (currentSample != sample)
    {
        currentSample = sample;
        [self configureView];
    }
    
//    if (self.masterPopoverController != nil)
//    {
//        [self.masterPopoverController dismissPopoverAnimated:YES];
//    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (currentSample)
    {
//        self.sampleDescriptionTextView.text = [currentSample description];
//        self.title = [currentSample title];
//        self.sampleIconView.image = [currentSample largeIcon];
        
        if (self.activeVideoController)
            [self.activeVideoController setSample:currentSample];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppDelegate * appDel = [UIApplication sharedApplication].delegate;
    
    SampleFacade * sample = appDel->allSamples[0];
    
    
    [self setDetailItem:sample];
    
    [self configureView];
    
}

- (void)viewDidUnload
{
    [self setSampleIconView:nil];
    [self setSampleDescriptionTextView:nil];
    [self setRunOnImageButton:nil];
    [self setRunOnVideoButton:nil];
    [super viewDidUnload];
}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
//    } else {
//        return YES;
//    }
//}

#pragma mark - Split view

//- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
//{
//    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
//    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
//    self.masterPopoverController = popoverController;
//}

//- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
//{
//    // Called when the view is shown again in the split view, invalidating the button and popover controller.
//    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
//    self.masterPopoverController = nil;
//}

#pragma mark - Run Sample

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    if ([[segue identifier] isEqualToString:@"processVideo"])
    
    AppDelegate * appDel = [UIApplication sharedApplication].delegate;
    
//    {
        VideoViewController * sampleController = [segue destinationViewController];
        [sampleController setSample:appDel->allSamples[0]];
        self.activeVideoController = sampleController;
//    }
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"Detail view is going to appear");
    
    self.activeVideoController = nil;
//    self.activeImageController = nil;
}



@end
