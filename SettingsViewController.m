//
//  SettingsViewController.m
//  Quick Reminders
//
//  Created by Oscar Diplock on 22/12/2013.
//  Copyright (c) 2013 GRAPHITE. All rights reserved.
//


#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
@synthesize scroller, scrolleriPhone5, textFields;

- (void)keyboardDidShow:(NSNotification *)notification
{
    [self.view setFrame:CGRectMake(0,-20,320,440)];
}

- (void)keyboardDidHide:(NSNotification *)notification
{
    [self.view setFrame:CGRectMake(0,0,320,460)];
}

- (IBAction)hideKeyboard:(id)Sender{
    
    [self.view endEditing:YES];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    return (newLength > 2) ? NO : YES;
}

-(IBAction)doneButton:(id)sender{
    NSString *textBox11 = cell1Field1.text;
    NSUserDefaults *defaults0 = [NSUserDefaults standardUserDefaults];
    [defaults0 setObject:textBox11 forKey:@"1,1"];
    [defaults0 synchronize];
    
    NSString *textBox12 = cell1Field2.text;
    NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
    [defaults1 setObject:textBox12 forKey:@"1,2"];
    [defaults1 synchronize];
    
    NSString *textBox21 = cell2Field1.text;
    NSUserDefaults *defaults2 = [NSUserDefaults standardUserDefaults];
    [defaults2 setObject:textBox21 forKey:@"2,1"];
    [defaults2 synchronize];
    
    NSString *textBox22 = cell2Field2.text;
    NSUserDefaults *defaults3 = [NSUserDefaults standardUserDefaults];
    [defaults3 setObject:textBox22 forKey:@"2,2"];
    [defaults3 synchronize];
    
    NSString *textBox31 = cell3Field1.text;
    NSUserDefaults *defaults4 = [NSUserDefaults standardUserDefaults];
    [defaults4 setObject:textBox31 forKey:@"3,1"];
    [defaults4 synchronize];
    
    NSString *textBox32 = cell3Field2.text;
    NSUserDefaults *defaults5 = [NSUserDefaults standardUserDefaults];
    [defaults5 setObject:textBox32 forKey:@"3,2"];
    [defaults5 synchronize];
    
    NSString *textBox41 = cell4Field1.text;
    NSUserDefaults *defaults6 = [NSUserDefaults standardUserDefaults];
    [defaults6 setObject:textBox41 forKey:@"4,1"];
    [defaults6 synchronize];
    
    NSString *textBox42 = cell4Field2.text;
    NSUserDefaults *defaults7 = [NSUserDefaults standardUserDefaults];
    [defaults7 setObject:textBox42 forKey:@"4,2"];
    [defaults7 synchronize];
    
    NSString *textBox51 = cell5Field1.text;
    NSUserDefaults *defaults8 = [NSUserDefaults standardUserDefaults];
    [defaults8 setObject:textBox51 forKey:@"5,1"];
    [defaults8 synchronize];
    
    NSString *textBox52 = cell5Field2.text;
    NSUserDefaults *defaults9 = [NSUserDefaults standardUserDefaults];
    [defaults9 setObject:textBox52 forKey:@"5,2"];
    [defaults9 synchronize];
    
    [self performSegueWithIdentifier:@"SettingsBack" sender:sender];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{

    MarqueeLabel *scrollyLabel = [[MarqueeLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44) duration:8 andFadeLength:0.0];
    
    scrollyLabel.text = @"  24 Hour time format only, DO NOT exceed over 24:59 or else it will rollover to next day!  ";
    scrollyLabel.textColor = [UIColor colorWithWhite:0.902 alpha:1.000];
    scrollyLabel.backgroundColor = [UIColor colorWithRed:0.384 green:0.384 blue:0.392 alpha:0.990];
    scrollyLabel.font = [UIFont fontWithName:@"Helvetica-Normal" size:18];
    scrollyLabel.marqueeType = MLContinuous;
    scrollyLabel.shadowOffset = CGSizeMake(0.0, -1.0);
    
    self.marquee = scrollyLabel;
    
    //iPhone 4 scroller
    scroller.translatesAutoresizingMaskIntoConstraints = NO;
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(320 ,554)]; //510
    [scroller setPagingEnabled:NO];
    
    //iPhone 5 scroller
    scrolleriPhone5.translatesAutoresizingMaskIntoConstraints = NO;
    [scrolleriPhone5 setScrollEnabled:YES];
    [scrolleriPhone5 setContentSize:CGSizeMake(320 ,534)];
    [scrolleriPhone5 setPagingEnabled:NO];
    
    NSUserDefaults *defaults0 = [NSUserDefaults standardUserDefaults];
    cell1Field1.text = [defaults0 objectForKey:@"1,1"];
    NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
    cell1Field2.text = [defaults1 objectForKey:@"1,2"];
    NSUserDefaults *defaults2 = [NSUserDefaults standardUserDefaults];
    cell2Field1.text = [defaults2 objectForKey:@"2,1"];
    NSUserDefaults *defaults3 = [NSUserDefaults standardUserDefaults];
    cell2Field2.text = [defaults3 objectForKey:@"2,2"];
    NSUserDefaults *defaults4 = [NSUserDefaults standardUserDefaults];
    cell3Field1.text = [defaults4 objectForKey:@"3,1"];
    NSUserDefaults *defaults5 = [NSUserDefaults standardUserDefaults];
    cell3Field2.text = [defaults5 objectForKey:@"3,2"];
    NSUserDefaults *defaults6 = [NSUserDefaults standardUserDefaults];
    cell4Field1.text = [defaults6 objectForKey:@"4,1"];
    NSUserDefaults *defaults7 = [NSUserDefaults standardUserDefaults];
    cell4Field2.text = [defaults7 objectForKey:@"4,2"];
    NSUserDefaults *defaults8 = [NSUserDefaults standardUserDefaults];
    cell5Field1.text = [defaults8 objectForKey:@"5,1"];
    NSUserDefaults *defaults9 = [NSUserDefaults standardUserDefaults];
    cell5Field2.text = [defaults9 objectForKey:@"5,2"];
    
    [super viewDidLoad];
    
    [cell1Field1 setDelegate:self];
    [cell1Field2 setDelegate:self];
    [cell2Field1 setDelegate:self];
    [cell2Field2 setDelegate:self];
    [cell3Field1 setDelegate:self];
    [cell3Field2 setDelegate:self];
    [cell4Field1 setDelegate:self];
    [cell4Field2 setDelegate:self];
    [cell5Field1 setDelegate:self];
    [cell5Field2 setDelegate:self];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end