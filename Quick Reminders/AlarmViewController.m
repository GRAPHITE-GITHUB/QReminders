//
//  AlarmViewController.m
//  TableViewProject
//
//  Created by Oscar Diplock & Eduard Mocanu on 28/11/2013.
//  Copyright (c) 2013 GRAPHITE. All rights reserved.
//

#import "AlarmViewController.h"

@interface AlarmViewController ()

@end

@implementation AlarmViewController

@synthesize datePicker, viewA, viewABG, datePickerPic, reminderLabel, reminderFieldDismiss, noteItPic, reminderField;

- (IBAction)options:(id)sender {
    
    [UIImageView animateWithDuration:0.35 animations:^{
        datePickerPic.alpha = 0;
        viewA.alpha = 0;
        viewABG.alpha = 0;
        datePicker.alpha = 0;
    } completion:^(BOOL finished){}];
}

-(IBAction)hideKeyboard:(id)Sender{
    [reminderFieldDismiss resignFirstResponder];
    [reminderField resignFirstResponder];
}

-(void)changeDate:(UIDatePicker *)sender {
    NSLog(@"New Date: %@", sender.date);
}

-(void)removeViews:(id)object {
    [[self.view viewWithTag:9] removeFromSuperview];
}

-(void)dismissDatePicker:(id)sender {
    
    myTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector (showData)userInfo: nil
                                              repeats:NO];
    [self.view viewWithTag:9].alpha = 0;
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(removeViews:)];
    [UIView commitAnimations];
    
    NSString *remind = reminderField.text;
    
    NSLog(@"Sucess: %@", remind);
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    localNotification.fireDate = [datePicker date];
    localNotification.alertBody = reminderLabel.text;
    localNotification.alertAction = @"View Reminder";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    NSDictionary *infoDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Object 1", @"Key 1", @"Object 2", @"Key 2", nil];
    localNotification.userInfo = infoDict;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

-(void)showData {
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];

    localNotification.fireDate = [datePicker date];
    localNotification.alertBody = reminderLabel.text;
    localNotification.alertAction = @"View Reminder";
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    NSDictionary *infoDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Object 1", @"Key 1", @"Object 2", @"Key 2", nil];
    localNotification.userInfo = infoDict;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEEE "];
    
    NSDateFormatter *formatterTime = [[NSDateFormatter alloc] init];
    [formatterTime setDateFormat:@"HH:mm"];
    
    NSString *timeFormat = [formatterTime stringFromDate:[datePicker date]];
    
    NSString *stringFromDate = [formatter stringFromDate:[datePicker date]];
    
    NSString *atSymbol = @"at ";
    
    NSString *setString = [@"Your reminder has been set for " stringByAppendingString:stringFromDate];
    
    NSString *atString = [setString stringByAppendingString:atSymbol];
    
    NSString *setString2 = [atString stringByAppendingString:timeFormat];
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Quick Reminders" message:setString2 delegate:self cancelButtonTitle:@"Continue" otherButtonTitles: nil];
    [alert show];

}

-(IBAction)halfhour:(id)sender{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *remind = [defaults objectForKey:@"remind"];
    
    NSDate *alertTime = [[NSDate date] dateByAddingTimeInterval:5]; //1800
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    localNotification.fireDate = alertTime;
    localNotification.alertBody = remind;
    localNotification.alertAction = @"Slide to View";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    NSDictionary *infoDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Object 1", @"Key 1", @"Object 2", @"Key 2", nil];
    localNotification.userInfo = infoDict;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    [self performSegueWithIdentifier:@"AlarmTimeBack" sender:sender];
    
}

-(IBAction)onehour:(id)sender{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *remind = [defaults objectForKey:@"remind"];
    
    NSDate *alertTime = [[NSDate date] dateByAddingTimeInterval:3600];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    localNotification.fireDate = alertTime;
    localNotification.alertBody = remind;
    localNotification.alertAction = @"View Reminder";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    NSDictionary *infoDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Object 1", @"Key 1", @"Object 2", @"Key 2", nil];
    localNotification.userInfo = infoDict;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    [self performSegueWithIdentifier:@"AlarmTimeBack" sender:sender];
}

-(IBAction)threehour:(id)sender{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *remind = [defaults objectForKey:@"remind"];
    
    NSDate *alertTime = [[NSDate date] dateByAddingTimeInterval:10800];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    localNotification.fireDate = alertTime;
    localNotification.alertBody = remind;
    localNotification.alertAction = @"View Reminder";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    NSDictionary *infoDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Object 1", @"Key 1", @"Object 2", @"Key 2", nil];
    localNotification.userInfo = infoDict;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    [self performSegueWithIdentifier:@"AlarmTimeBack" sender:sender];
}

-(IBAction)lunchtime:(id)sender{
    
    NSUserDefaults *defaults4 = [NSUserDefaults standardUserDefaults];
    NSString *hour = [defaults4 objectForKey:@"3,1"];
    
    NSUserDefaults *defaults5 = [NSUserDefaults standardUserDefaults];
    NSString *min = [defaults5 objectForKey:@"3,2"];
    
    int hourint = [hour intValue];

    int minint = [min intValue];
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    if (hour.length >= 1) {
        [dateComponents setHour:hourint];
    }
    else {
        [dateComponents setHour:13];
    }
    long finalHour = [dateComponents hour];
    
    if (min.length >= 1) {
        [dateComponents setMinute:minint];
    }
    else {
        [dateComponents setMinute:00];
    }
    long finalMin = [dateComponents minute];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    NSString *yearString = [formatter stringFromDate:[NSDate date]];
    int yearComp = [yearString intValue];
    
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateFormat:@"MM"];
    NSString *monthString = [formatter1 stringFromDate:[NSDate date]];
    int monthComp = [monthString intValue];
    
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:@"dd"];
    NSString *dayString = [formatter2 stringFromDate:[NSDate date]];
    int dayComp = [dayString intValue];
    
    NSDateFormatter *formatter3 = [[NSDateFormatter alloc] init];
    [formatter3 setDateFormat:@"HH"];
    NSString *hourString = [formatter3 stringFromDate:[NSDate date]];
    int hourComp = [hourString intValue];
    
    NSDateFormatter *formatter4 = [[NSDateFormatter alloc] init];
    [formatter4 setDateFormat:@"mm"];
    NSString *minString = [formatter4 stringFromDate:[NSDate date]];
    int minComp = [minString intValue];
    
    if (hourComp >= finalHour){
        [dateComponents setDay:dayComp+1];
    }
    else if (hourComp == finalHour){
        if (minComp >= finalMin){
            [dateComponents setMinute:hourComp+1];
        }
        else {
            [dateComponents setMinute:hourComp];
        }
    }
    else {
        [dateComponents setDay:dayComp];
    }
    
    [dateComponents setYear:yearComp];
    [dateComponents setMonth:monthComp];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];

    NSString *remind = [defaults objectForKey:@"remind"];

    NSDate *fireDateOfNotification = [calendar dateFromComponents: dateComponents];

    UILocalNotification *localNotification = [[UILocalNotification alloc]  init] ;
    
    localNotification.fireDate = fireDateOfNotification;
    localNotification.alertAction = @"View Reminder";
    localNotification.timeZone = [NSTimeZone localTimeZone];
    localNotification.alertBody = remind;
    localNotification.userInfo= [NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"Data"] forKey:@"Lunchtime"];
    
    localNotification.soundName = UILocalNotificationDefaultSoundName;

    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    [self performSegueWithIdentifier:@"AlarmTimeBack" sender:sender];
}

-(IBAction)nextmorning:(id)sender{
    
    NSUserDefaults *defaults0 = [NSUserDefaults standardUserDefaults];
    NSString *hour = [defaults0 objectForKey:@"1,1"];
    
    NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
    NSString *min = [defaults1 objectForKey:@"1,2"];
    
    int hourint = [hour intValue];
    
    int minint = [min intValue];
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    
    if (hour.length >= 1) {
        [dateComponents setHour:hourint];
    }
    else {
        [dateComponents setHour:8];
    }
    long finalHour = [dateComponents hour];
    
    if (min.length >= 1) {
        [dateComponents setMinute:minint];
    }
    else {
        [dateComponents setMinute:00];
    }
    long finalMin = [dateComponents minute];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    NSString *yearString = [formatter stringFromDate:[NSDate date]];
    int yearComp = [yearString intValue];
    
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateFormat:@"MM"];
    NSString *monthString = [formatter1 stringFromDate:[NSDate date]];
    int monthComp = [monthString intValue];
    
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:@"dd"];
    NSString *dayString = [formatter2 stringFromDate:[NSDate date]];
    int dayComp = [dayString intValue];
    
    NSDateFormatter *formatter3 = [[NSDateFormatter alloc] init];
    [formatter3 setDateFormat:@"HH"];
    NSString *hourString = [formatter3 stringFromDate:[NSDate date]];
    int hourComp = [hourString intValue];
    
    NSDateFormatter *formatter4 = [[NSDateFormatter alloc] init];
    [formatter4 setDateFormat:@"mm"];
    NSString *minString = [formatter4 stringFromDate:[NSDate date]];
    int minComp = [minString intValue];
    
    if (hourComp >= finalHour){
        [dateComponents setDay:dayComp+1];
    }
    else if (hourComp == finalHour){
        if (minComp >= finalMin){
            [dateComponents setMinute:hourComp+1];
        }
        else {
            [dateComponents setMinute:hourComp];
        }
    }
    else {
        [dateComponents setDay:dayComp];
    }
    
    [dateComponents setYear:yearComp];
    [dateComponents setMonth:monthComp];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];

    NSString *remind = [defaults objectForKey:@"remind"];

    NSDate *fireDateOfNotification = [calendar dateFromComponents: dateComponents];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc]  init] ;
    
    localNotification.fireDate = fireDateOfNotification ;
    localNotification.alertAction = @"View Reminder";
    localNotification.timeZone = [NSTimeZone localTimeZone] ;
    localNotification.alertBody = remind;
    localNotification.userInfo= [NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"Data"] forKey:@"Lunchtime"];
    localNotification.soundName = UILocalNotificationDefaultSoundName;

    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    [self performSegueWithIdentifier:@"AlarmTimeBack" sender:sender];
}

-(IBAction)customtime:(id)sender{
    
    //Called in methods below.
}

-(IBAction)home:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Coming Soon!"
                                                   message: @"This feature will be available in a future update. Thank you for your cooperation."
                                                  delegate: self
                                         cancelButtonTitle:@"Ok"
                                         otherButtonTitles:nil];
    [alert show];
}

-(IBAction)work:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Coming Soon!"
                                                   message: @"This feature will be available in a future update. Thank you for your cooperation."
                                                  delegate: self
                                         cancelButtonTitle:@"Ok"
                                         otherButtonTitles:nil];
    [alert show];
}

-(IBAction)customlocation:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Coming Soon!"
                                                   message: @"This feature will be available in a future update. Thank you for your cooperation."
                                                  delegate: self
                                         cancelButtonTitle:@"Ok"
                                         otherButtonTitles:nil];
    [alert show];
}

-(IBAction)beforebed:(id)sender{
    NSUserDefaults *defaults8 = [NSUserDefaults standardUserDefaults];
    NSString *hour = [defaults8 objectForKey:@"5,1"];
    
    NSUserDefaults *defaults9 = [NSUserDefaults standardUserDefaults];
    NSString *min = [defaults9 objectForKey:@"5,2"];
    
    int hourint = [hour intValue];
    
    int minint = [min intValue];
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    
    if (hour.length >= 1) {
        [dateComponents setHour:hourint];
    }
    else {
        [dateComponents setHour:22];
    }
    long finalHour = [dateComponents hour];
    
    if (min.length >= 1) {
        [dateComponents setMinute:minint];
    }
    else {
        [dateComponents setMinute:00];
    }
    long finalMin = [dateComponents minute];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    NSString *yearString = [formatter stringFromDate:[NSDate date]];
    int yearComp = [yearString intValue];
    
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateFormat:@"MM"];
    NSString *monthString = [formatter1 stringFromDate:[NSDate date]];
    int monthComp = [monthString intValue];
    
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:@"dd"];
    NSString *dayString = [formatter2 stringFromDate:[NSDate date]];
    int dayComp = [dayString intValue];
    
    NSDateFormatter *formatter3 = [[NSDateFormatter alloc] init];
    [formatter3 setDateFormat:@"HH"];
    NSString *hourString = [formatter3 stringFromDate:[NSDate date]];
    int hourComp = [hourString intValue];
    
    NSDateFormatter *formatter4 = [[NSDateFormatter alloc] init];
    [formatter4 setDateFormat:@"mm"];
    NSString *minString = [formatter4 stringFromDate:[NSDate date]];
    int minComp = [minString intValue];
    
    if (hourComp >= finalHour){
        [dateComponents setDay:dayComp+1];
    }
    else if (hourComp == finalHour){
        if (minComp >= finalMin){
            [dateComponents setMinute:hourComp+1];
        }
        else {
            [dateComponents setMinute:hourComp];
        }
    }
    else {
        [dateComponents setDay:dayComp];
    }
    
    [dateComponents setYear:yearComp];
    [dateComponents setMonth:monthComp];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    
    NSString *remind = [defaults objectForKey:@"remind"];
    
    NSDate *fireDateOfNotification = [calendar dateFromComponents: dateComponents];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc]  init] ;
    
    localNotification.fireDate = fireDateOfNotification ;
    localNotification.alertAction = @"View Reminder";
    localNotification.timeZone = [NSTimeZone localTimeZone] ;
    localNotification.alertBody = remind;
    localNotification.userInfo= [NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"Data"] forKey:@"Lunchtime"];
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    [self performSegueWithIdentifier:@"AlarmTimeBack" sender:sender];
}

-(IBAction)beforework:(id)sender{
    NSUserDefaults *defaults2 = [NSUserDefaults standardUserDefaults];
    NSString *hour = [defaults2 objectForKey:@"2,1"];
    
    NSUserDefaults *defaults3 = [NSUserDefaults standardUserDefaults];
    NSString *min = [defaults3 objectForKey:@"2,2"];
    
    int hourint = [hour intValue];
    
    int minint = [min intValue];
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    
    if (hour.length >= 1) {
        [dateComponents setHour:hourint];
    }
    else {
        [dateComponents setHour:9];
    }
    long finalHour = [dateComponents hour];
    
    if (min.length >= 1) {
        [dateComponents setMinute:minint];
    }
    else {
        [dateComponents setMinute:00];
    }
    long finalMin = [dateComponents minute];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    NSString *yearString = [formatter stringFromDate:[NSDate date]];
    int yearComp = [yearString intValue];
    
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateFormat:@"MM"];
    NSString *monthString = [formatter1 stringFromDate:[NSDate date]];
    int monthComp = [monthString intValue];
    
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:@"dd"];
    NSString *dayString = [formatter2 stringFromDate:[NSDate date]];
    int dayComp = [dayString intValue];
    
    NSDateFormatter *formatter3 = [[NSDateFormatter alloc] init];
    [formatter3 setDateFormat:@"HH"];
    NSString *hourString = [formatter3 stringFromDate:[NSDate date]];
    int hourComp = [hourString intValue];
    
    NSDateFormatter *formatter4 = [[NSDateFormatter alloc] init];
    [formatter4 setDateFormat:@"mm"];
    NSString *minString = [formatter4 stringFromDate:[NSDate date]];
    int minComp = [minString intValue];
    
    if (hourComp >= finalHour){
        [dateComponents setDay:dayComp+1];
    }
    else if (hourComp == finalHour){
        if (minComp >= finalMin){
            [dateComponents setMinute:hourComp+1];
        }
        else {
            [dateComponents setMinute:hourComp];
        }
    }
    else {
        [dateComponents setDay:dayComp];
    }
    
    [dateComponents setYear:yearComp];
    [dateComponents setMonth:monthComp];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    
    NSString *remind = [defaults objectForKey:@"remind"];
    
    NSDate *fireDateOfNotification = [calendar dateFromComponents: dateComponents];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc]  init] ;
    
    localNotification.fireDate = fireDateOfNotification ;
    localNotification.alertAction = @"View Reminder";
    localNotification.timeZone = [NSTimeZone localTimeZone] ;
    localNotification.alertBody = remind;
    localNotification.userInfo= [NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"Data"] forKey:@"Lunchtime"];
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    [self performSegueWithIdentifier:@"AlarmTimeBack" sender:sender];
}

-(IBAction)afterwork:(id)sender{
    NSUserDefaults *defaults6 = [NSUserDefaults standardUserDefaults];
    NSString *hour = [defaults6 objectForKey:@"4,1"];
    
    NSUserDefaults *defaults7 = [NSUserDefaults standardUserDefaults];
    NSString *min = [defaults7 objectForKey:@"4,2"];
    
    int hourint = [hour intValue];
    
    int minint = [min intValue];
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    
    if (hour.length >= 1) {
        [dateComponents setHour:hourint];
    }
    else {
        [dateComponents setHour:17];
    }
    long finalHour = [dateComponents hour];
    
    if (min.length >= 1) {
        [dateComponents setMinute:minint];
    }
    else {
        [dateComponents setMinute:00];
    }
    long finalMin = [dateComponents minute];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    NSString *yearString = [formatter stringFromDate:[NSDate date]];
    int yearComp = [yearString intValue];
    
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateFormat:@"MM"];
    NSString *monthString = [formatter1 stringFromDate:[NSDate date]];
    int monthComp = [monthString intValue];
    
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:@"dd"];
    NSString *dayString = [formatter2 stringFromDate:[NSDate date]];
    int dayComp = [dayString intValue];
    
    NSDateFormatter *formatter3 = [[NSDateFormatter alloc] init];
    [formatter3 setDateFormat:@"HH"];
    NSString *hourString = [formatter3 stringFromDate:[NSDate date]];
    int hourComp = [hourString intValue];
    
    NSDateFormatter *formatter4 = [[NSDateFormatter alloc] init];
    [formatter4 setDateFormat:@"mm"];
    NSString *minString = [formatter4 stringFromDate:[NSDate date]];
    int minComp = [minString intValue];
    
    if (hourComp >= finalHour){
        [dateComponents setDay:dayComp+1];
    }
    else if (hourComp == finalHour){
        if (minComp >= finalMin){
            [dateComponents setMinute:hourComp+1];
        }
        else {
            [dateComponents setMinute:hourComp];
        }
    }
    else {
        [dateComponents setDay:dayComp];
    }
    
    [dateComponents setYear:yearComp];
    [dateComponents setMonth:monthComp];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    
    NSString *remind = [defaults objectForKey:@"remind"];
    
    NSDate *fireDateOfNotification = [calendar dateFromComponents: dateComponents];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc]  init] ;
    
    localNotification.fireDate = fireDateOfNotification ;
    localNotification.alertAction = @"View Reminder";
    localNotification.timeZone = [NSTimeZone localTimeZone] ;
    localNotification.alertBody = remind;
    localNotification.userInfo= [NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"Data"] forKey:@"Lunchtime"];
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    

    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    [self performSegueWithIdentifier:@"AlarmTimeBack" sender:sender];
}

-(IBAction)noteIt:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *remind = [defaults objectForKey:@"remind"];
    
    NSDate *alertTime = [[NSDate date] dateByAddingTimeInterval:999999999999999999];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    localNotification.fireDate = alertTime;
    localNotification.alertBody = remind;
    localNotification.alertAction = @"View Reminder";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    NSDictionary *infoDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Object 1", @"Key 1", @"Object 2", @"Key 2", nil];
    localNotification.userInfo = infoDict;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    [self performSegueWithIdentifier:@"AlarmTimeBack" sender:sender];
}

-(IBAction)backbutton:(id)sender{
    
    [self performSegueWithIdentifier:@"AlarmTimeBack" sender:sender];
}

-(IBAction)setReminder:(id)sender{
    
    if (reminderField.text.length == 0) {
        
        UIAlertView *moreLetters = [[UIAlertView alloc] initWithTitle: @"Quick Reminders"
                                                              message:@"In order to set a reminder there needs to be 1 or more characters typed within the text field." delegate:self
                                                    cancelButtonTitle:@"Ok, I got it!"
                                                    otherButtonTitles:nil];
        [moreLetters show];
    }
    else {
        [reminderField resignFirstResponder];
        
        [self performSegueWithIdentifier:@"AlarmTimeForth" sender:(nil)];
    
    NSString *remind = [reminderField text];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:remind forKey:@"remind"];
    [defaults synchronize];
    NSLog(@"Data saved");
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent
                                                animated:YES];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)fadeIn {
    
    [UIView animateWithDuration:0.2 animations:^{
        
        viewA.alpha=1;
        datePicker.alpha=1;
        halfhour.enabled = NO;
        onehour.enabled = NO;
        threehour.enabled = NO;
        lunch.enabled = NO;
        morning.enabled = NO;
        customTime.enabled = NO;
        customLoc.enabled = NO;
        work.enabled = NO;
        house.enabled = NO;
        beforeBed.enabled = NO;
        beforeWork.enabled = NO;
        afterWork.enabled = NO;
        notehide.enabled = NO;
        
    } completion:^(BOOL finished){}];
}

//fadeIn2 is needed for the differnt timing, of only DatePickerBG.png.
-(IBAction)fadeIn2 {
    [UIImageView animateWithDuration:0.4 animations:^{
        
        viewABG.image = [UIImage imageNamed:@"viewA_image.png"];
        viewABG.alpha = 1;
        datePickerPic.image = [UIImage imageNamed:@"DatePickerBG.png"];
        datePickerPic.alpha = 1;
        viewA.alpha=1;
        datePicker.alpha=1;
        
    } completion:^(BOOL finished){}];
}

-(IBAction)fadeOutAll {
    [UIImageView animateWithDuration:0.25 animations:^{
        
        datePickerPic.alpha = 0;
        viewA.alpha = 0;
        viewABG.alpha = 0;
        datePicker.alpha = 0;
        halfhour.enabled = YES;
        onehour.enabled = YES;
        threehour.enabled = YES;
        lunch.enabled = YES;
        morning.enabled = YES;
        customTime.enabled = YES;
        customLoc.enabled = YES;
        work.enabled = YES;
        house.enabled = YES;
        beforeBed.enabled = YES;
        beforeWork.enabled = YES;
        afterWork.enabled = YES;
        notehide.enabled = YES;
        
    } completion:^(BOOL finished){}];
}

-(IBAction)setReminder {
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *remind = [defaults objectForKey:@"remind"];
    
    localNotification.fireDate = [datePicker date];
    localNotification.alertBody = remind;
    localNotification.alertAction = @"View Reminder";
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    NSDictionary *infoDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Object 1", @"Key 1", @"Object 2", @"Key 2", nil];
    localNotification.userInfo = infoDict;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEEE "];
    
    NSDateFormatter *formatterTime = [[NSDateFormatter alloc] init];
    [formatterTime setDateFormat:@"HH:mm"];
    
    NSString *timeFormat = [formatterTime stringFromDate:[datePicker date]];
    
    NSString *stringFromDate = [formatter stringFromDate:[datePicker date]];
    
    NSString *atSymbol = @"at ";
    
    NSString *setString = [@"Your reminder has been set for " stringByAppendingString:stringFromDate];
    
    NSString *atString = [setString stringByAppendingString:atSymbol];
    
    NSString *setString2 = [atString stringByAppendingString:timeFormat];
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Quick Reminders" message:setString2 delegate:self cancelButtonTitle:@"Continue" otherButtonTitles: nil];
    [alert show];
    
    viewA.alpha = 0;
    datePicker.alpha = 0;
    datePickerPic.alpha = 0;
    viewABG.alpha = 0;
    halfhour.enabled = YES;
    onehour.enabled = YES;
    threehour.enabled = YES;
    lunch.enabled = YES;
    morning.enabled = YES;
    customTime.enabled = YES;
    customLoc.enabled = YES;
    work.enabled = YES;
    house.enabled = YES;
    beforeBed.enabled = YES;
    beforeWork.enabled = YES;
    afterWork.enabled = YES;
    notehide.enabled = YES;
}

- (void)viewDidLoad{
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"FirstLaunch"])
    {}
    else {
        
        UIAlertView *firstLaunch = [[UIAlertView alloc] initWithTitle: @"Quick Reminders"
                                                              message:@"Welcome to Quick Reminders. As you can already see, the app has been heavily updated and more features have been added too. There are swipe gestueres that are added to the app from the main screen. Also, you now have a list to show you the current reminders. GRAPHITE" delegate:self
                                                    cancelButtonTitle:@"Continue"
                                                    otherButtonTitles:nil];
        [firstLaunch show];
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"FirstLaunch"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    // Scrolling label
    MarqueeLabel *scrollyLabel = [[MarqueeLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 22) duration:10 andFadeLength:0.0];
    
    scrollyLabel.text = @"  To get started, type your reminder in the field above and hit 'Next' when finished typing, then you will be prompted to choose a suitable time or location.  ";
    scrollyLabel.textColor = [UIColor colorWithWhite:0.984 alpha:1.000];
    scrollyLabel.backgroundColor = [UIColor colorWithRed:0.259 green:0.275 blue:0.282 alpha:1];
    scrollyLabel.font = [UIFont fontWithName:@"Helvetica-Normal" size:18];
    scrollyLabel.marqueeType = MLContinuous;
    scrollyLabel.shadowOffset = CGSizeMake(0.0, -1.0);
    
    self.marquee = scrollyLabel;
    
    // Rotating animation
    CABasicAnimation *spin;
    spin = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    spin.fromValue = [NSNumber numberWithFloat:0];
    spin.toValue = [NSNumber numberWithFloat:((360*M_PI)/180)];
    spin.duration = 4;
    spin.repeatCount = 10*1000;
    
    [noteItPic.layer addAnimation:spin forKey:@"360"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *remind = [defaults objectForKey:@"remind"];
    
    reminderField.text = remind;
    reminderLabel.text = remind;
    
    viewA.alpha = 0;
    datePicker.alpha = 0;
    datePickerPic.alpha = 0;
    viewABG.alpha = 0;

    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    reminderField.text = [[NSString stringWithFormat:@""] init];
    
    [reminderField setDelegate:self];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    if (reminderField.text.length == 0) {
        
        UIAlertView *moreLetters = [[UIAlertView alloc] initWithTitle: @"Quick Reminders"
                                                              message:@"In order to set a reminder there needs to be 1 or more characters typed within the text field." delegate:self
                                                    cancelButtonTitle:@"Ok, I got it!"
                                                    otherButtonTitles:nil];
        [moreLetters show];
    }
    else {
        [reminderField resignFirstResponder];
        
        [self performSegueWithIdentifier:@"AlarmTimeForth" sender:(nil)];
        
        NSString *remind = [reminderField text];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:remind forKey:@"remind"];
        [defaults synchronize];
        NSLog(@"Data saved");
        
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent
                                                    animated:YES];
    }
    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.inputAccessoryView = self.marquee;
    textField.delegate = self;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    textField.inputAccessoryView = nil;
    textField.delegate = self;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end