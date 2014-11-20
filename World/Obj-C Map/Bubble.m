//
//  Bubble.m
//  Obj-C Map
//
//  Created by Brendan McMorrow on 10/30/14.
//  Copyright (c) 2014 Loki. All rights reserved.
//


#import "Bubble.h"

@implementation Bubble

@synthesize coordinate;
@synthesize title;

-(id) initWithTitle:(NSString *)text AndCoordinate:(CLLocationCoordinate2D)location
{
    self = [super init];
    self.title = text;
    self.coordinate = location;
    return self;
}

@end