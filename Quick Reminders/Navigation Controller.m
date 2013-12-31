//
//  Navigation Controller.m
//  Quick Reminders
//
//  Created by Eduard Mocanu on 29/10/2013.
//  Copyright (c) 2013 Oscar Diplock + Eduard Mocanu. All rights reserved.
//

#import "Navigation Controller.h"

@interface Navigation_Controller ()

@end

@implementation Navigation_Controller
@synthesize mapView;

- (IBAction)changeMapType:(UISegmentedControl *)sender
{
    switch (sender.selectedSegmentIndex){
        case 1:
            self.mapView.mapType = MKMapTypeStandard;
            break;
        case 2:
            self.mapView.mapType = MKMapTypeHybrid;
            break;
        default:
            self.mapView.mapType = MKMapTypeSatellite;
            break;
    }
}

-(IBAction)showCurrentLocation:(id)sender{
    [mapView setCenterCoordinate:mapView.userLocation.location.coordinate animated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
        [super viewDidLoad];
        mapView.showsUserLocation = YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end