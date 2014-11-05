//
//  CalloutMapAnnotation.h
//  Obj-C Map
//
//  Created by Brendan McMorrow on 11/4/14.
//  Copyright (c) 2014 Loki. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <MapKit/Mapkit.h>

@interface CalloutMapAnnotation : NSObject <MKAnnotation> {
    CLLocationDegrees _latitude;
    CLLocationDegrees _longitude;
}

@property (nonatomic) CLLocationDegrees latitude;
@property (nonatomic) CLLocationDegrees longitude;

-(id) initWithLatitude:(CLLocationDegrees)latitude andLongitude:(CLLocationDegrees)longitude;

@end