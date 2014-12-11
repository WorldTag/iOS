//
//  UIViewController+ComposeViewController.m
//  Obj-C Map
//
//  Created by Brendan McMorrow on 11/12/14.
//  Copyright (c) 2014 Loki. All rights reserved.
//

#import "ComposeViewController.h"

@implementation ComposeViewController

@synthesize composeField;
@synthesize locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    locationManager = [AppDelegate getLocationManager];
    [locationManager startUpdatingLocation];
    [composeField becomeFirstResponder];
    //composeField.textColor = [UIColor cyanColor];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)post:(id)sender {
    NSString *temp = composeField.text;
    [self.delegate composeBubble:self didFinishBlowingBubble:temp];
    [self.navigationController popViewControllerAnimated:NO];
}

@end