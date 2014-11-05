//
//  Bubble.m
//  Obj-C Map
//
//  Created by Brendan McMorrow on 10/30/14.
//  Copyright (c) 2014 Loki. All rights reserved.
//


#import "Bubble.h"

@implementation Bubble

@synthesize coordinate = _coordinate;
@synthesize title = _title;


-(id) initWithTitle:(NSString *)title AndCoordinate:(CLLocationCoordinate2D)coordinate
{
    self = [super init];
    _title = title;
    _coordinate = coordinate;

    return self;
}



@end