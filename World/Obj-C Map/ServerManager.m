//
//  NSObject+ServerManager.m
//  Obj-C Map
//
//  Created by Brendan McMorrow on 11/22/14.
//  Copyright (c) 2014 Loki. All rights reserved.
//

#import "ServerManager.h"

@implementation ServerManager

NSString *baseURL = @"http://104.131.89.249/bubbler/";

-(void)getBubbles{
    NSMutableArray *bubbles = [[NSMutableArray alloc]init];
    NSString *newURL = [baseURL stringByAppendingString:@"bubbles/"];
    NSURL *url = [NSURL URLWithString:newURL];
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionDownloadTask* task = [session downloadTaskWithURL:url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        NSData *jsonResult = [NSData dataWithContentsOfURL:location];
        id bubbleObjects = [NSJSONSerialization JSONObjectWithData:jsonResult options:0 error:nil];
        for(NSDictionary *t in bubbleObjects) {
            Bubble *tbub = [[Bubble alloc]initWithDictionary:t];
            [bubbles addObject:tbub];
        }
        [self.delegate addAnnotationsToMapWithArray:bubbles];
        return;
    }];
    [task resume];
    
}


@end
