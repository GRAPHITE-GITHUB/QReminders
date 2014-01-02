//
//  AlarmViewController.h
//  TableViewProject
//
//  Created by Oscar Diplock & Eduard Mocanu on 28/11/2013.
//  Copyright (c) 2013 GRAPHITE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MarqueeLabel.h"

@interface AlarmViewController : UIViewController <UITextFieldDelegate> {
    
    IBOutlet UIToolbar *toolBar1;
    IBOutlet UIView *darkview;
    IBOutlet UITextField *reminderField;
    IBOutlet UILabel *dateStorage;
    IBOutlet UILabel *dateLabel;
    IBOutlet UILabel *reminderLabel;
    IBOutlet UIDatePicker *datePicker;
    IBOutlet UIView *viewA;
    IBOutlet UIImageView *viewABG;
    IBOutlet UIImageView *datePickerPic;
    IBOutlet UIImageView *noteItPic;
    
    NSTimer *myTimer;
    NSTimer *timer1;
    
    UITextField *reminderFieldDismiss;
    
    IBOutlet UIButton *halfhour;
    IBOutlet UIButton *onehour;
    IBOutlet UIButton *threehour;
    IBOutlet UIButton *morning;
    IBOutlet UIButton *lunch;
    IBOutlet UIButton *customTime;
    IBOutlet UIButton *customLoc;
    IBOutlet UIButton *house;
    IBOutlet UIButton *work;
    IBOutlet UIButton *beforeWork;
    IBOutlet UIButton *afterWork;
    IBOutlet UIButton *beforeBed;
    IBOutlet UIButton *notehide;
}

-(IBAction)halfhour:(id)sender;
-(IBAction)onehour:(id)sender;
-(IBAction)threehour:(id)sender;
-(IBAction)lunchtime:(id)sender;
-(IBAction)nextmorning:(id)sender;
-(IBAction)home:(id)sender;
-(IBAction)work:(id)sender;
-(IBAction)customlocation:(id)sender;
-(IBAction)beforebed:(id)sender;
-(IBAction)beforework:(id)sender;
-(IBAction)afterwork:(id)sender;
-(IBAction)backbutton:(id)sender;
-(IBAction)setReminder:(id)sender;
-(IBAction)noteIt:(id)sender;
-(void)changeDate:(id)object;
-(void)removeViews:(id)object;
-(void)dismissDatePicker:(id)sender;
-(IBAction)hideKeyboard:(id)Sender;

// iPhone 4 only.
-(IBAction)options:(id)sender;

@property (strong, nonatomic) IBOutlet MarqueeLabel *marquee;

@property (nonatomic, retain) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, retain) IBOutlet UILabel *reminderLabel;
@property (nonatomic, retain) IBOutlet UIImageView *viewABG;
@property (nonatomic, retain) IBOutlet UIView *viewA;
@property (nonatomic, retain) IBOutlet UIImageView *datePickerPic;
@property (nonatomic, retain) IBOutlet UIImageView *noteItPic;
@property (nonatomic, retain) IBOutlet UITextField *reminderField;
@property (nonatomic, retain) IBOutlet UITextField *reminderFieldDismiss;
@property (weak, nonatomic) IBOutlet UIButton *halfhour;
@property (weak, nonatomic) IBOutlet UIButton *onehour;
@property (weak, nonatomic) IBOutlet UIButton *threehour;
@property (weak, nonatomic) IBOutlet UIButton *morning;
@property (weak, nonatomic) IBOutlet UIButton *lunch;
@property (weak, nonatomic) IBOutlet UIButton *customTime;
@property (weak, nonatomic) IBOutlet UIButton *customLoc;
@property (weak, nonatomic) IBOutlet UIButton *house;
@property (weak, nonatomic) IBOutlet UIButton *work;
@property (weak, nonatomic) IBOutlet UIButton *beforeWork;
@property (weak, nonatomic) IBOutlet UIButton *afterWork;
@property (weak, nonatomic) IBOutlet UIButton *beforeBed;
@property (weak, nonatomic) IBOutlet UIButton *notehide;

@end