//
//  ColourSettingsViewController.h
//  Quick Reminders
//
//  Created by Oscar Diplock on 9/01/2014.
//  Copyright (c) 2014 GRAPHITE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColourSettingsViewController : UIViewController{
    IBOutlet UIImageView *turq;
    IBOutlet UIImageView *orange;
    IBOutlet UIImageView *red;
    IBOutlet UIImageView *white;
    IBOutlet UIImageView *blue;
    IBOutlet UIImageView *green;
    IBOutlet UIImageView *yellow;
}

-(IBAction)turq:(id)sender;
-(IBAction)orange:(id)sender;
-(IBAction)red:(id)sender;
-(IBAction)white:(id)sender;
-(IBAction)blue:(id)sender;
-(IBAction)green:(id)sender;
-(IBAction)yellow:(id)sender;

@end
