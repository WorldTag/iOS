//
//  CalloutMapAnnotationView.h
//  Obj-C Map
//
//  Created by Brendan McMorrow on 11/4/14.
//  Copyright (c) 2014 Loki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mapkit/Mapkit.h>

@interface CalloutMapAnnotationView : MKAnnotationView {
    MKAnnotationView *parentAnnotationView;
    MKMapView *mapView;
    CGRect endFrame;
    UIView *contentView;
    CGFloat yShadowOffset;
    CGPoint offsetFromParent;
    CGFloat contentHeight;
}

@property (nonatomic, retain) MKAnnotationView *parentAnnotationView;
@property (nonatomic, retain) MKMapView *mapView;
@property (nonatomic, readonly) UIView *contentView;
@property (nonatomic) CGPoint offsetFromParent;
@property (nonatomic) CGFloat contentHeight;

-(void)animateIn;
-(void)animateInStepTwo;
-(void)animateInStepThree;

@end
