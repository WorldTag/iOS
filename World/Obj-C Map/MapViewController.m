//
//  ViewController.m
//  Obj-C Map
//
//  Created by Brendan McMorrow on 10/22/14.
//  Copyright (c) 2014 Loki. All rights reserved.
//

#import "MapViewController.h"
#import "LocationManager.h"
@import MapKit;
@import UIKit;
@import CoreLocation;

@interface ViewController () <CLLocationManagerDelegate>
@property (strong, nonatomic) LocationManager *locationManager;
@end

@implementation ViewController
@synthesize mapView = _mapView;
@synthesize locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.mapView.delegate self];
    [self.mapView setShowsUserLocation:YES];
    self.mapView.userTrackingMode=NO;
    self.locationManager = [AppDelegate getLocationManager];
    [self performSelector:@selector(updateRegion) withObject:self afterDelay:1.0 ];
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)Send:(UIButton *)sender
{
    if([_textField.text isEqual: @""])
        return;
    self.mapView.userTrackingMode=NO;
    Bubble *tbub = [[Bubble alloc] initWithTitle:_textField.text AndCoordinate:self.mapView.userLocation.location.coordinate];
    _textField.text = @"";
    [self updateRegion];
    [self.mapView addAnnotation:tbub];
}

-(void)updateRegion {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([self.locationManager getLocation], 200, 200);
    [self.mapView setRegion:region animated:YES];
}

-(void) printSuccess {
    NSLog(@"yolo");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
