//
//  ViewControllerMap.m
//  Quick Reminders
//
//  Created by Oscar Diplock on 5/11/2013.
//  Copyright (c) 2013 Oscar Diplock + Eduard Mocanu. All rights reserved.
//

#import "ViewControllerMap.h"

@interface ViewControllerMap ()
- (void)showActionSheet:(id)sender;
@end

@implementation ViewControllerMap
@synthesize mapView;

-(IBAction)done:(id)sender{
    
}

-(IBAction)currentLoc:(id)sender{
    self.mapView.delegate =  self;
    self.mapView.showsUserLocation = YES;
    NSLog(@"currentloc");
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"Standard"]) {
        mapView.mapType = MKMapTypeStandard;
        NSLog(@"Standard");
    }
    if ([buttonTitle isEqualToString:@"Hybrid"]) {
        mapView.mapType = MKMapTypeHybrid;
        NSLog(@"Hybrid");
    }
    if ([buttonTitle isEqualToString:@"Satellite"]) {
        mapView.mapType = MKMapTypeSatellite;
        NSLog(@"Satellite");
    }
    if ([buttonTitle isEqualToString:@"Cancel Button"]) {
        NSLog(@"Cancel");
    }
}

- (void)showActionSheet:(id)sender{
    NSString *actionSheetTitle = @"Choose the Style of Map";
    NSString *other1 = @"Standard";
    NSString *other2 = @"Hybrid";
    NSString *other3 = @"Satellite";
    NSString *cancelTitle = @"Cancel";
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:actionSheetTitle
                                  delegate:self
                                  cancelButtonTitle:cancelTitle
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:other1, other2, other3, nil];
    [actionSheet showInView:self.view];
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
    
    mapView = [[MKMapView alloc]
               initWithFrame:CGRectMake(0,
                                        0,
                                        self.view.bounds.size.width,
                                        self.view.bounds.size.height-44)
               ];
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 1.5;
    [self.mapView addGestureRecognizer:lpgr];
    [self.view addSubview:mapView];
    
	UIBarButtonItem *customItem = [[UIBarButtonItem alloc]  initWithImage:[UIImage imageNamed:@"location.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(currentLoc:)];
    
    UIBarButtonItem *customItem1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem *customItem2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(showActionSheet:)];
    
    NSArray *items = [NSArray arrayWithObjects: customItem, customItem1, customItem2, nil];
    [toolbar setItems:items animated:NO];
}

- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan)
        return;
    
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
    CLLocationCoordinate2D touchMapCoordinate =
    [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    
    MKPointAnnotation *annot = [[MKPointAnnotation alloc] init];
    annot.coordinate = touchMapCoordinate;
    [self.mapView addAnnotation:annot];
}

- (void)mapView:(MKMapView *)aMapView didUpdateUserLocation:(MKUserLocation *)aUserLocation {
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.005;
    span.longitudeDelta = 0.005;
    CLLocationCoordinate2D location;
    location.latitude = aUserLocation.coordinate.latitude;
    location.longitude = aUserLocation.coordinate.longitude;
    region.span = span;
    region.center = location;
    [aMapView setRegion:region animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end