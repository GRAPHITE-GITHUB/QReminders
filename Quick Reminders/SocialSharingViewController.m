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

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *preferedColour = [standardUserDefaults stringForKey:@"colourStyle"];
    
    if ([preferedColour isEqualToString:@"white"]) {
        self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.961 green:0.957 blue:0.969 alpha:1.0];
        self.navigationController.navigationBar.tintColor = [UIColor blackColor];
        creditsBack.backgroundColor = [UIColor colorWithRed:0.961 green:0.957 blue:0.969 alpha:1.0];
        text.textColor = [UIColor blackColor];
        text1.textColor = [UIColor blackColor];
        text2.textColor = [UIColor blackColor];
        text3.textColor = [UIColor blackColor];
        text4.textColor = [UIColor blackColor];
        text5.textColor = [UIColor blackColor];
        text6.textColor = [UIColor blackColor];
        text7.textColor = [UIColor blackColor];
    }
    else if ([preferedColour isEqualToString:@"red"]) {
        self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.996 green:0.463 blue:0.478 alpha:1.0];
        creditsBack.backgroundColor = [UIColor colorWithRed:0.996 green:0.463 blue:0.478 alpha:1.0];
    }
    else if ([preferedColour isEqualToString:@"orange"]) {
        self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1 green:0.584 blue:0 alpha:1.0];
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = creditsBack.bounds;
        gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:1 green:0.584 blue:0 alpha:1.0] CGColor], (id)[[UIColor colorWithRed:1 green:0.369 blue:0.227 alpha:1.0] CGColor], nil];
        [creditsBack.layer insertSublayer:gradient atIndex:0];
    }
    else if ([preferedColour isEqualToString:@"green"]) {
        self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.631 green:0.91 blue:0.467 alpha:1.0];
        creditsBack.backgroundColor = [UIColor colorWithRed:0.631 green:0.91 blue:0.467 alpha:1.0];
    }
    else if ([preferedColour isEqualToString:@"turq"]) {
        self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.322 green:0.929 blue:0.78 alpha:1.0];
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = creditsBack.bounds;
        gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:0.322 green:0.929 blue:0.78 alpha:1.0] CGColor], (id)[[UIColor colorWithRed:0.353 green:0.784 blue:0.984 alpha:1.0] CGColor], nil];
        [creditsBack.layer insertSublayer:gradient atIndex:0];
    }
    else if ([preferedColour isEqualToString:@"yellow"]) {
        self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.98 green:0.945 blue:0.537 alpha:1.0];
        self.navigationController.navigationBar.tintColor = [UIColor blackColor];
        creditsBack.backgroundColor = [UIColor colorWithRed:0.98 green:0.945 blue:0.537 alpha:1.0];
        text.textColor = [UIColor blackColor];
        text1.textColor = [UIColor blackColor];
        text2.textColor = [UIColor blackColor];
        text3.textColor = [UIColor blackColor];
        text4.textColor = [UIColor blackColor];
        text5.textColor = [UIColor blackColor];
        text6.textColor = [UIColor blackColor];
        text7.textColor = [UIColor blackColor];
    }
    else if ([preferedColour isEqualToString:@"blue"]) {
        self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.275 green:0.671 blue:0.878 alpha:1.0];
        creditsBack.backgroundColor = [UIColor colorWithRed:0.275 green:0.671 blue:0.878 alpha:1.0];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end