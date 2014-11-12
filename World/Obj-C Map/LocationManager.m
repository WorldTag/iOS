//
//  LocationManager.m
//  Obj-C Map
//
//  Created by Brendan McMorrow on 11/11/14.
//  Copyright (c) 2014 Loki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationManager.h"


@interface LocationManager() <CLLocationManagerDelegate>
@end


@implementation LocationManager

-(id)init {
    self = [super init];
    self.delegate = self;
    if([self respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [self requestWhenInUseAuthorization];
    }
    [self startUpdatingLocation];
    return self;
}

-(CLLocationCoordinate2D)getLocation {
    return self.location.coordinate;
}

@end