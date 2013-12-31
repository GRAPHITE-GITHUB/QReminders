//
//  GeneralTableViewController.h
//  Quick Reminders
//
//  Created by Eduard Mocanu on 17/12/2013.
//  Copyright (c) 2013 GRAPHITE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GeneralTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{
    
    NSMutableArray *dataList;
    
    IBOutlet UITableView *table;
    
}

@property (nonatomic, copy) NSMutableArray *scheduledLocalNotifications;
@property (nonatomic, copy) NSMutableArray *scheduledLocalNotificationsDetail;

@property (nonatomic, strong) NSMutableArray *objects;

@end