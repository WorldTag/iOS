//
//  UIViewController+ComposeViewController.h
//  Obj-C Map
//
//  Created by Brendan McMorrow on 11/12/14.
//  Copyright (c) 2014 Loki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComposeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *composeField;

- (IBAction)Post:(id)sender;

@end
