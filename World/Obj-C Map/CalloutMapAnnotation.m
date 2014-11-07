//
//  CalloutMapAnnotation.m
//  Obj-C Map
//
//  Created by Brendan McMorrow on 11/4/14.
//  Copyright (c) 2014 Loki. All rights reserved.
//

#import "CalloutMapAnnotation.h"

@interface CalloutMapAnnotation()

@end

@implementation CalloutMapAnnotation

@synthesize latitude = _latitude;
@synthesize longitude = _longitude;

-(id) initWithLatitude:(CLLocationDegrees)latitude andLongitude:(CLLocationDegrees)longitude {
    if(self = [super init]) {
        self.latitude = latitude;
        self.longitude = longitude;
    }
    return self;
}

-(CLLocationCoordinate2D)coordinate {
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = self.latitude;
    coordinate.longitude = self.longitude;
    return coordinate;
}
//
@end
