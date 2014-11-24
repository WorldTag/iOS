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
@synthesize author;
@synthesize time;
@synthesize likes;
@synthesize authorID;
@synthesize pk;

-(id) initWithTitle:(NSString *)text AndCoordinate:(CLLocationCoordinate2D)location {
    self = [super init];
    self.title = text;
    self.coordinate = location;
    return self;
}

-(id) initWithDictionary:(NSDictionary *)dictionary {
    title = [dictionary valueForKey:@"string"];
    author = [dictionary valueForKey:@"author"];
    likes = [[dictionary valueForKey:@"likes"] integerValue];
    pk = [[dictionary valueForKey:@"pk"] integerValue];
    NSDictionary *timeDictionary = [dictionary valueForKey:@"time"];
    double lat = [[dictionary valueForKey:@"latitdue"] doubleValue];
    double lon = [[dictionary valueForKey:@"longitude"] doubleValue];
    coordinate = CLLocationCoordinate2DMake(lat, lon);
    
    return self;
}

@end