//
//  GeneralDetailViewController.h
//  Quick Reminders
//
//  Created by Eduard Mocanu on 17/12/2013.
//  Copyright (c) 2013 GRAPHITE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GeneralDetailViewController : UIViewController <UITextFieldDelegate> {
    IBOutlet UITextField *itemText;
}

//@property (strong ,nonatomic) NSString *detailLabelContents;
//@property (weak, nonatomic) IBOutlet UILabel *detailLabel;


- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *itemText;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end