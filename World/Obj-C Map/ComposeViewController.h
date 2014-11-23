//
//  UIViewController+ComposeViewController.h
//  Obj-C Map
//
//  Created by Brendan McMorrow on 11/12/14.
//  Copyright (c) 2014 Loki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bubble.h"
#import "AppDelegate.h"

@class ComposeViewController;

@protocol newBubbleCreationDelegate <NSObject>

-(void)composeBubble:(ComposeViewController *)controller didFinishBlowingBubble:(NSString *)bubbleText;

@end

@interface ComposeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *composeField;
@property (nonatomic, weak) id <newBubbleCreationDelegate> delegate;
@property (weak, nonatomic) CLLocationManager *locationManager;

- (IBAction)post:(id)sender;

@end
