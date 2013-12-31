//
//  GeneralTableViewController.m
//  Quick Reminders
//
//  Created by Eduard Mocanu on 17/12/2013.
//  Copyright (c) 2013 GRAPHITE. All rights reserved.
//

#import "GeneralTableViewController.h"
#import "GeneralDetailViewController.h"
#import "AlarmViewController.h"

@interface GeneralTableViewController ()

@end

@implementation GeneralTableViewController
@synthesize scheduledLocalNotifications, scheduledLocalNotificationsDetail;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    //UIApplication* reminderApp = [UIApplication sharedApplication];
    //NSArray *localNotifications = [reminderApp scheduledLocalNotifications];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *noAlert = [defaults objectForKey:@"timeTitle"];
    
    NSArray *array = [noAlert componentsSeparatedByString:@","];
    
    if (![noAlert isEqualToString:@""]) {
        [dataList addObjectsFromArray:array [1]];
    }
    
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reloadTable)
                                                 name:@"reloadData"
                                               object:nil];
    
    // Uncomment the following line to preserve selection between presentations.
    //self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[UIApplication sharedApplication] scheduledLocalNotifications] count];

    if (tableView == self.tableView) {
        return self.scheduledLocalNotifications.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Get list of local notifications
    NSArray *localNotifications = [[UIApplication sharedApplication] scheduledLocalNotifications];
    UILocalNotification *localNotification = [localNotifications objectAtIndex:indexPath.row];
    
    // Display notification info
    NSDate *date = localNotification.fireDate;
    
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateFormat:@"dd/MM/yyyy"];
    NSString *dateFormatter = [formatter1 stringFromDate:date];
    
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:@"EEEE hh:mm"];
    NSString *dateFormatter2 = [formatter2 stringFromDate:date];

    NSString *on = [dateFormatter2 stringByAppendingString:@" on the "];
    NSString *final = [on stringByAppendingString:dateFormatter];
    
    [cell.textLabel setText:localNotification.alertBody];
    
    if (final.length != 8) {
        [cell.detailTextLabel setText:final];
    }
    else {
        [cell.detailTextLabel setText:@""];
    }
    
    return cell;
}

- (void)reloadTable
{
    [self.tableView reloadData];
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.

    return YES;
    
    [self.tableView reloadData];
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    [[UIApplication sharedApplication]  scheduledLocalNotifications];
    //UIApplication *reminderApp = [UIApplication sharedApplication];
    //NSArray *localNotifications = [reminderApp scheduledLocalNotifications];
    
    //NSString *saveString = localNotifications [0];
    
    //NSLog(@"move from:%ld to:%ld", fromIndexPath.row, toIndexPath.row);
    
    //[[UIApplication sharedApplication] setScheduledLocalNotifications:localNotifications];
    
    //[self.tableView reloadSectionIndexTitles];
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *localNotifications = [[UIApplication sharedApplication]  scheduledLocalNotifications];
        UILocalNotification *notify = [localNotifications objectAtIndex:indexPath.row];
        [[UIApplication sharedApplication] cancelLocalNotification:notify];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    [tableView reloadData];
}

// Swipe ot delete.
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
      if (self.searchDisplayController.isActive) {
        [self performSegueWithIdentifier:@"ShowDetail" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier]isEqualToString:@"ShowDetail"]) {
        NSString *object = nil;
        NSIndexPath *indexPath = nil;
     
        if (self.searchDisplayController.isActive) {
            indexPath = [[self.searchDisplayController searchResultsTableView] indexPathForSelectedRow];
            
        } else {
            
            indexPath = [self.tableView indexPathForSelectedRow];
            object = self.objects[indexPath.row];
            
        }
        [segue destinationViewController];
    }
}

@end