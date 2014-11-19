//
//  ViewController.m
//  Obj-C Map
//
//  Created by Brendan McMorrow on 10/22/14.
//  Copyright (c) 2014 Loki. All rights reserved.
//

#import "MapViewController.h"
#import "LocationManager.h"
#import "ComposeViewController.h"
@import MapKit;
@import UIKit;
@import CoreLocation;

@interface MapViewController () <CLLocationManagerDelegate>
@property (strong, nonatomic) LocationManager *locationManager;
@end

@implementation MapViewController

@synthesize mapView = _mapView;
@synthesize locationManager;
@synthesize tempBubble;

static MapViewController *staticController;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    MapViewController *tempController = [[MapViewController alloc] init];
    tempController->_mapController = self;
    [self.mapView.delegate self];
    [self.mapView setShowsUserLocation:YES];
    self.mapView.userTrackingMode=NO;
    self.locationManager = [AppDelegate getLocationManager];
    [self performSelector:@selector(fastUpdateRegion) withObject:self afterDelay:.5 ];
    if([staticController isEqual:nil])
        staticController = self;
    self.navigationItem.backBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Post"
                                      style:UIBarButtonItemStyleBordered
                                     target:nil
                                     action:nil];

    // Do any additional setup after loading the view, typically from a nib.
}

/*-(IBAction)Send:(UIButton *)sender
{
    if([_textField.text isEqual: @""])
        return;
    self.mapView.userTrackingMode=NO;
    Bubble *tbub = [[Bubble alloc] initWithTitle:_textField.text AndCoordinate:self.mapView.userLocation.location.coordinate];
    _textField.text = @"";
    [self updateRegion];
    [self.mapView addAnnotation:tbub];
}*/

-(void)updateRegion {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([self.locationManager getLocation], 200, 200);
    [self.mapView setRegion:region animated:YES];
}

-(void)fastUpdateRegion {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([self.locationManager getLocation], 200, 200);
    [self.mapView setRegion:region animated:NO];
}

-(void) printSuccess {
    NSLog(@"yolo");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)newPostwithBubble: (Bubble*)newBubble {
    [self fastUpdateRegion];
    [self.mapView addAnnotation:newBubble];
}

+(id)getMapViewController {
    return staticController;
}

@end
