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
@import CoreLocation;

@interface ViewController () <CLLocationManagerDelegate, UITextFieldDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;
@end

@implementation ViewController
@synthesize mapView = _mapView;
<<<<<<< HEAD
@synthesize selectedAnnotationView = selectedAnnotationView;
//@synthesize customAnnotation = customAnnotation;

=======
>>>>>>> FETCH_HEAD

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.mapView.delegate self];
    [self.mapView setShowsUserLocation:NO];
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    //if(kCLAuthorizationStatusAuthorizedWhenInUse){
        if([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    self.mapView.userTrackingMode=YES;

    // Do any additional setup after loading the view, typically from a nib.
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [_mapView setRegion:region animated:YES];

}

-(IBAction)Send:(UIButton *)sender
{
<<<<<<< HEAD
    if([_textField.text isEqual: @""])
=======
    if([_textField.text  isEqual: @""])
>>>>>>> FETCH_HEAD
        return;
    self.mapView.userTrackingMode=NO;
    id newBubble = [[Bubble alloc] initWithTitle:_textField.text AndCoordinate:self.mapView.userLocation.location.coordinate];
    _textField.text = @"";
    [self updateRegion];
    [self.mapView addAnnotation:newBubble];
}

-(void)updateRegion {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.location.coordinate, 250, 250);
    [self.mapView setRegion:region];
}

//-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {

















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
