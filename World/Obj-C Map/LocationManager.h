//
//  LocationManager.h
//  Obj-C Map
//
//  Created by Brendan McMorrow on 11/11/14.
//  Copyright (c) 2014 Loki. All rights reserved.
//

@import MapKit;
@import MapKit;
@import UIKit;
@import CoreLocation;

@interface LocationManager : CLLocationManager
-(id)init;
-(CLLocationCoordinate2D)getLocation;
@end


