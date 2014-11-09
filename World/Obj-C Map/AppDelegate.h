//
//  AppDelegate.h
//  Obj-C Map
//
//  Created by Brendan McMorrow on 10/22/14.
//  Copyright (c) 2014 Loki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalloutView.h"
#import <MapKit/MapKit.h>

@class MapViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, MKMapViewDelegate, SMCalloutViewDelegate>


@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) IBOutlet UIViewController *viewController;



@end

