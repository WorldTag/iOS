//
//  Bubble.h
//  Obj-C Map
//
//  Created by Brendan McMorrow on 10/30/14.
//  Copyright (c) 2014 Loki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface Bubble : NSObject <MKAnnotation>

@property (nonatomic, copy) NSString *title;
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *author;
@property (nonatomic) NSDate *time;
@property (nonatomic) int likes;
@property (nonatomic) int pk;
@property (nonatomic) int authorID;

-(id) initWithTitle:(NSString *) title AndCoordinate:(CLLocationCoordinate2D)coordinate;
-(id) initWithDictionary:(NSDictionary *)dictionary;

@end