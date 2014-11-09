//
//  ViewController.m
//  Obj-C Map
//
//  Created by Brendan McMorrow on 10/22/14.
//  Copyright (c) 2014 Loki. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "Bubble.h"
@import UIKit;
#import "AppDelegate.h"
@import CoreLocation;

@interface ViewController () <CLLocationManagerDelegate, UITextFieldDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic, retain) Bubble *customAnnotation;
@property (nonatomic, retain) Bubble *normalAnnotation;
@end

@implementation ViewController
@synthesize mapView = _mapView;
@synthesize selectedAnnotationView = selectedAnnotationView;
@synthesize customAnnotation = customAnnotation;
@synthesize normalAnnotation = normalAnnotation;




- (void)viewDidLoad {
    [super viewDidLoad];
    [self.mapView.delegate self];
    [self.mapView setShowsUserLocation:YES];
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    //if(kCLAuthorizationStatusAuthorizedWhenInUse){
        if([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    self.mapView.userTrackingMode=NO;
    [self performSelector:@selector(updateRegion) withObject:self afterDelay:3.0 ];
    [self updateRegion];

    // Do any additional setup after loading the view, typically from a nib.
}

/*-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [_mapView setRegion:region animated:YES];

}*/

-(IBAction)Send:(UIButton *)sender
{
    if([_textField.text  isEqual: @""])
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
