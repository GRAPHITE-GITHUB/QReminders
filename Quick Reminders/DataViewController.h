//
//  DataViewController.h
//  Quick Reminders
//
//  Created by Oscar Diplock on 23/10/2013.
//  Copyright (c) 2013 Oscar Diplock. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;

@end
