//
//  SocialSharingViewController.h
//  Quick Reminders
//
//  Created by Eduard Mocanu on 22/11/2013.
//  Copyright (c) 2013 Oscar Diplock + Eduard Mocanu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>

@interface SocialSharingViewController : UIViewController {
    IBOutlet UIView *creditsBack;
    IBOutlet UILabel *text;
    IBOutlet UILabel *text1;
    IBOutlet UILabel *text2;
    IBOutlet UILabel *text3;
    IBOutlet UILabel *text4;
    IBOutlet UILabel *text5;
    IBOutlet UILabel *text6;
    IBOutlet UILabel *text7;
}

- (IBAction)postToTwitter:(id)sender;
- (IBAction)postToFacebook:(id)sender;

@end