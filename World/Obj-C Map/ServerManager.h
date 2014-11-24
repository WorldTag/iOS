//
//  NSObject+ServerManager.h
//  Obj-C Map
//
//  Created by Brendan McMorrow on 11/22/14.
//  Copyright (c) 2014 Loki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bubble.h"

@protocol ServerManagerDelegate <NSObject>

-(void)addAnnotationsToMapWithArray:(NSMutableArray*)array;

@end

@interface ServerManager : NSObject <NSURLSessionDelegate>

@property (nonatomic, weak) id <ServerManagerDelegate> delegate;
@property (nonatomic, weak) NSURLSession *session;
@property (nonatomic, weak) NSString *baseURL;

-(void)getBubbles;
-(id)initWithDefaultConfig;
-(BOOL)signUpWithUsername:(NSString *)username andPassword:(NSString *)password;


@end
