//
//  ViewController.m
//  Obj-C Map
//
//  Created by Brendan McMorrow on 10/22/14.
//  Copyright (c) 2014 Loki. All rights reserved.
//

#import "MapViewController.h"

@implementation MapViewController

@synthesize mapView = mapView;
@synthesize locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    [self.mapView.delegate self];
    [self.mapView setShowsUserLocation:YES];
    self.mapView.userTrackingMode=NO;
    self.locationManager = [AppDelegate getLocationManager];
    [self performSelector:@selector(fastUpdateRegion) withObject:self afterDelay:.5 ];
    self.navigationItem.backBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:nil action:nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ComposeViewController *controller = (ComposeViewController *)segue.destinationViewController;
    controller.delegate = self;
    [self.locationManager startUpdatingLocation];

}

-(void)composeBubble:(ComposeViewController *)controller didFinishBlowingBubble:(NSString *)bubbleText {
    [self.locationManager startUpdatingLocation];
    [self updateRegion];
    Bubble *tbub = [[Bubble alloc]initWithTitle:bubbleText AndCoordinate:[locationManager getLocation]];
    [self.mapView addAnnotation:tbub];
}

-(void)updateRegion {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.locationManager.location.coordinate, 100, 100);
    [self.mapView setRegion:region animated:YES];
}

-(void)fastUpdateRegion {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.locationManager.location.coordinate, 100, 100);
    [self.mapView setRegion:region animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)newPostwithBubble: (Bubble*)newBubble {
    [self fastUpdateRegion];
    [self.mapView addAnnotation:newBubble];
}



@end
