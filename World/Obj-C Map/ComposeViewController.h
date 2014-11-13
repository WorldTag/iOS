//
//  UIViewController+ComposeViewController.h
//  Obj-C Map
//
//  Created by Brendan McMorrow on 11/12/14.
//  Copyright (c) 2014 Loki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bubble.h"
#import "LocationManager.h"
#import "AppDelegate.h"
#import "MapViewController.h"


@interface ComposeViewController : UIViewController {
    MapViewController *mapController;
}


@property (weak, nonatomic) IBOutlet UITextView *composeField;
@property (strong, nonatomic) LocationManager *locationManager;
@property (strong, nonatomic) MapViewController *mapController;


- (IBAction)Post:(id)sender;

@end
