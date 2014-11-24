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

@property (nonatomic, retain) id <ServerManagerDelegate> delegate;
@property (nonatomic, retain) NSURLSession *session;
@property (nonatomic, retain) NSString *baseURL;

-(void)getBubbles;
-(id)initWithDefaultConfig;
-(BOOL)signUpWithUsername:(NSString *)username andPassword:(NSString *)password;
-(BOOL)signOut;


@end
