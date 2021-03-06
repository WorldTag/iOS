 //
//  ViewController.h
//  Obj-C Map
//
//  Created by Brendan McMorrow on 10/22/14.
//  Copyright (c) 2014 Loki. All rights reserved.//
//

#import <UIKit/UIKit.h>
#import "ComposeViewController.h"
#import "ServerManager.h"
@import MapKit;
@import UIKit;
@import CoreLocation;

@class MapViewController;

@interface MapViewController : UIViewController <MKMapViewDelegate, newBubbleCreationDelegate, CLLocationManagerDelegate, ServerManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *Send;
@property (strong, nonatomic) CLLocationManager *locationManager;


@end