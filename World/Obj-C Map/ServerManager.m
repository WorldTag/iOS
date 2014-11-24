//
//  NSObject+ServerManager.m
//  Obj-C Map
//
//  Created by Brendan McMorrow on 11/22/14.
//  Copyright (c) 2014 Loki. All rights reserved.
//

#import "ServerManager.h"

@implementation ServerManager

@synthesize session;
@synthesize delegate;
@synthesize baseURL;

-(id) initWithDefaultConfig {
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration];
    session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    baseURL = @"http://104.131.89.249/bubbler/";
    return self;
}

-(void)getBubbles{
    NSURL *url = [baseURL copy];
    url = [NSURL URLWithString:[baseURL stringByAppendingString:@"bubbles"]];
    
    NSURLSessionDownloadTask* task = [session downloadTaskWithURL:url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        NSData *jsonResult = [NSData dataWithContentsOfURL:location];
        id bubbleObjects = [NSJSONSerialization JSONObjectWithData:jsonResult options:0 error:nil];
        NSMutableArray *bubbles = [[NSMutableArray alloc]init];
        for(NSDictionary *t in bubbleObjects) {
            Bubble *tbub = [[Bubble alloc]initWithDictionary:t];
            [bubbles addObject:tbub];
        }
        [self.delegate addAnnotationsToMapWithArray:bubbles];
    }];
    [task resume];
}

-(BOOL)signUpWithUsername:(NSString *)username andPassword:(NSString *)password {
    NSURL *url = [NSURL URLWithString:[baseURL stringByAppendingString:@"signup/"]];
    NSDictionary *tmp = [[NSDictionary alloc] initWithObjectsAndKeys: (NSString*)@"username", username, (NSString *)@"password", password, nil];
    NSData *postData = [NSJSONSerialization dataWithJSONObject:tmp options:0 error:nil];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPBody:postData];
    NSURLResponse *requestResponse;
    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
    NSString *requestReply = [[NSString alloc] initWithBytes:[requestHandler bytes] length:[requestHandler length] encoding:NSASCIIStringEncoding];
    NSLog(requestReply);
    if([requestReply isEqual:(@"failed")])
       return false;
    return true;
}

-(BOOL)signOut {
    NSURL *url = [NSURL URLWithString:[baseURL stringByAppendingString:@"signout/"]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPBody:nil];
    NSURLResponse *requestResponse;
    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
    NSString *requestReply = [[NSString alloc] initWithBytes:[requestHandler bytes] length:[requestHandler length] encoding:NSASCIIStringEncoding];
    if([requestReply isEqual:(@"failed")])
        return false;
    NSLog(requestReply);
    return true;
}

@end
