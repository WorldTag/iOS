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
#import "CalloutMapAnnotationView.h"
#import "CalloutMapAnnotation.h"
#import "AppDelegate.h"
@import CoreLocation;

@interface ViewController () <CLLocationManagerDelegate, UITextFieldDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic, retain) CalloutMapAnnotation *calloutAnnotation;
@property (nonatomic, retain) Bubble *customAnnotation;
@property (nonatomic, retain) Bubble *normalAnnotation;
@end

@implementation ViewController
@synthesize mapView = _mapView;
@synthesize selectedAnnotationView = selectedAnnotationView;
@synthesize customAnnotation = customAnnotation;
@synthesize normalAnnotation = normalAnnotation;
@synthesize calloutAnnotation = calloutAnnotation;




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
    if([_textField.text  isEqual: @""])
        return;
    self.mapView.userTrackingMode=NO;
    self.customAnnotation = [[Bubble alloc] initWithTitle:_textField.text AndCoordinate:self.mapView.userLocation.location.coordinate];
    self.normalAnnotation = [[Bubble alloc] initWithTitle:_textField.text AndCoordinate:self.mapView.userLocation.location.coordinate];
    _textField.text = @"";
    [self updateRegion];
    [self.mapView addAnnotation:self.customAnnotation];
    
}

-(void)updateRegion {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.location.coordinate, 250, 250);
    [self.mapView setRegion:region];
}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    if(view.annotation == self.customAnnotation) {
        if(self.calloutAnnotation == nil) {
            self.calloutAnnotation = [[CalloutMapAnnotation alloc] initWithLatitude:view.annotation.coordinate.latitude andLongitude:view.annotation.coordinate.longitude];
        }
        else {
            self.calloutAnnotation.latitude = view.annotation.coordinate.latitude;
            self.calloutAnnotation.longitude = view.annotation.coordinate.longitude;
        }
        [self.mapView addAnnotation:self.calloutAnnotation];
        self.selectedAnnotationView = view;
    }
}

-(void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    if(self.calloutAnnotation && view.annotation == self.customAnnotation) {
        [self.mapView removeAnnotation:self.calloutAnnotation];
    }
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if(annotation == self.calloutAnnotation) {
        CalloutMapAnnotationView *calloutMapAnnotationView = (CalloutMapAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:@"CalloutAnnotation"];
        if(!calloutMapAnnotationView) {
            calloutMapAnnotationView = [[CalloutMapAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CalloutAnnotation"];
            calloutMapAnnotationView.contentHeight = 78.0f;
//add subview?
            
        }
        calloutMapAnnotationView.parentAnnotationView = self.selectedAnnotationView;
        calloutMapAnnotationView.mapView = self.mapView;
        return calloutMapAnnotationView;
    } else if (annotation == self.customAnnotation) {
        MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomAnnotation"];
        annotationView.canShowCallout = NO;
        annotationView.pinColor = MKPinAnnotationColorGreen;
        return annotationView;
    } else if (annotation == self.normalAnnotation) {
        MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"NormalAnnotation"];
        annotationView.canShowCallout = YES;
        annotationView.pinColor = MKPinAnnotationColorPurple;
        return annotationView;
    }
    return nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
