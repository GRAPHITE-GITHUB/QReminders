//
//  ViewControllerMap.h
//  Quick Reminders
//
//  Created by Oscar Diplock on 5/11/2013.
//  Copyright (c) 2013 Oscar Diplock + Eduard Mocanu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

IBOutlet MKMapView *mapView;

@interface ViewControllerMap : UIViewController <UIActionSheetDelegate, MKMapViewDelegate> {
    IBOutlet UIToolbar *toolbar;
    BOOL pinWasDropped;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
-(IBAction)currentLoc:(id)sender;
-(IBAction)done:(id)sender;

@end