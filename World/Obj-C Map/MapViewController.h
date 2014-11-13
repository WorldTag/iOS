 //
//  ViewController.h
//  Obj-C Map
//
//  Created by Brendan McMorrow on 10/22/14.
//  Copyright (c) 2014 Loki. All rights reserved.//
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Bubble.h"
#import "AppDelegate.h"


@interface MapViewController : UIViewController <MKMapViewDelegate> {
    MKMapView *mapView;
    MKAnnotationView *selectedAnnotationView;    
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *Send;

- (IBAction)Send:(UIButton *)sender;

@end

