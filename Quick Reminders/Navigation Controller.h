//
//  Navigation Controller.h
//  Quick Reminders
//
//  Created by Eduard Mocanu on 29/10/2013.
//  Copyright (c) 2013 Eduard Mocanu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewControllerMap : UIViewController <MKMapViewDelegate> {
    IBOutlet MKMapView *mapView;
}

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

-(IBAction)changeMapType:(id)sender;
-(IBAction)showCurrentLocation:(id)sender;

@end

@interface Navigation_Controller : UINavigationController{
    IBOutlet MKMapView *mapView;
}

-(IBAction)changeMapType:(id)sender;
-(IBAction)showCurrentLocation:(id)sender;

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end