//
//  UIViewController+ComposeViewController.m
//  Obj-C Map
//
//  Created by Brendan McMorrow on 11/12/14.
//  Copyright (c) 2014 Loki. All rights reserved.
//

#import "ComposeViewController.h"

@implementation ComposeViewController

@synthesize locationManager;
@synthesize composeField;
@synthesize mapController;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager = [AppDelegate getLocationManager];
    self.mapController = [MapViewController getMapViewController];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)Post:(id)sender {
    self.mapController = [MapViewController getMapViewController];
    
    Bubble *newBubble = [[Bubble alloc] initWithTitle:composeField.text AndCoordinate:[locationManager getLocation]];
    [mapController newPostwithBubble:newBubble];
}
@end
