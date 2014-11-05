//
//  Bubble.h
//  Obj-C Map
//
//  Created by Brendan McMorrow on 10/30/14.
//  Copyright (c) 2014 Loki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Bubble : NSObject <MKAnnotation> {
    CLLocationCoordinate2D _coordinate;
    NSString *_title;
}

@property (nonatomic, copy) NSString *title;



-(id) initWithTitle:(NSString *) title AndCoordinate:(CLLocationCoordinate2D)coordinate;



@end