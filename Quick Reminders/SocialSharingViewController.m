//
//  SocialSharingViewController.m
//  Quick Reminders
//
//  Created by Eduard Mocanu on 22/11/2013.
//  Copyright (c) 2013 Oscar Diplock + Eduard Mocanu. All rights reserved.
//

#import "SocialSharingViewController.h"
#import <Social/Social.h>

@interface SocialSharingViewController ()

@end

@implementation SocialSharingViewController

- (IBAction)postToFacebook:(id)sender{
    
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
            SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            [controller setInitialText:@"Check out this awesome reminders app at https://itunes.apple.com/au/app/quick-reminders/id567727160"];
            [controller addURL:[NSURL URLWithString:@"https://itunes.apple.com/au/app/quick-reminders/id567727160"]];
            [self presentViewController:controller animated:YES completion:Nil];}
            else {
                NSLog(@"FacebookButton");
                
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"No Facebook Available"
                                                               message: @"In order to share to Facebook, you must have at least one Facebook account configured under settings of the iOS device"
                                                              delegate: self
                                                     cancelButtonTitle:@"Ok"
                                                     otherButtonTitles:nil];
                [alert show];
            }
    }

- (IBAction)postToTwitter:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:@"Check out this awesome reminders app at https://itunes.apple.com/au/app/quick-reminders/id567727160"];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
    else {
        NSLog(@"TWITTERButton");
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"No Twitter Available"
                                                       message: @"In order to share to Twitter, you must have at least one twitter account configured under settings of the iOS device"
                                                      delegate: self
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil];
        [alert show];
    }
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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end