//
//  SettingsViewController.h
//  Quick Reminders
//
//  Created by Oscar Diplock on 22/12/2013.
//  Copyright (c) 2013 GRAPHITE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MarqueeLabel.h"

@interface SettingsViewController : UIViewController <UITextFieldDelegate, UIScrollViewDelegate>{
    
    IBOutlet UITextField *cell1Field1;
    IBOutlet UITextField *cell1Field2;
    IBOutlet UITextField *cell2Field1;
    IBOutlet UITextField *cell2Field2;
    IBOutlet UITextField *cell3Field1;
    IBOutlet UITextField *cell3Field2;
    IBOutlet UITextField *cell4Field1;
    IBOutlet UITextField *cell4Field2;
    IBOutlet UITextField *cell5Field1;
    IBOutlet UITextField *cell5Field2;
    
    IBOutlet UIView *view;
    
    IBOutlet UIScrollView *scroller;
    IBOutlet UIScrollView *scrolleriPhone5;
}

-(IBAction)doneButton:(id)sender;
-(IBAction)hideKeyboard:(id)sender;
-(IBAction)cancelButton:(id)sender;

@property (strong, nonatomic) IBOutlet MarqueeLabel *marquee;

@property (nonatomic, strong) IBOutletCollection(UITextField) NSArray *textFields;

@property (nonatomic, retain) UIScrollView *scroller;
@property (nonatomic, retain) UIScrollView *scrolleriPhone5;

@end