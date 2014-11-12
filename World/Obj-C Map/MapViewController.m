//
//  ViewController.m
//  Obj-C Map
//
//  Created by Brendan McMorrow on 10/22/14.
//  Copyright (c) 2014 Loki. All rights reserved.
//

#import "MapViewController.h"
#import "AppDelegate.h"
@import MapKit;
@import UIKit;
@import CoreLocation;

@interface ViewController () <CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;
@end

@implementation ViewController
@synthesize mapView = _mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.mapView.delegate self];
    [self.mapView setShowsUserLocation:YES];
        self.mapView.userTrackingMode=NO;
    [self performSelector:@selector(updateRegion) withObject:self afterDelay:3.0 ];
    [self updateRegion];

    // Do any additional setup after loading the view, typically from a nib.
}

-(void)startUpdatingLocation {
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    //if(kCLAuthorizationStatusAuthorizedWhenInUse){
    if([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];

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
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.location.coordinate, 250, 250);
    [self.mapView setRegion:region];
}

-(void) printSuccess {
    NSLog(@"yolo");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
