//
//  ColourSettingsViewController.m
//  Quick Reminders
//
//  Created by Oscar Diplock on 9/01/2014.
//  Copyright (c) 2014 GRAPHITE. All rights reserved.
//

#import "ColourSettingsViewController.h"

@interface ColourSettingsViewController ()

@end

@implementation ColourSettingsViewController

-(IBAction)white:(id)sender{
    white.image = [UIImage imageNamed:@"tickWhite.png"];
    turq.image = [UIImage imageNamed:nil];
    red.image = [UIImage imageNamed:nil];
    orange.image = [UIImage imageNamed:nil];
    green.image = [UIImage imageNamed:nil];
    blue.image = [UIImage imageNamed:nil];
    yellow.image = [UIImage imageNamed:nil];
    NSString *specificStyle = @"white";
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setObject:specificStyle forKey:@"colourStyle"];
    [standardUserDefaults synchronize];
}

-(IBAction)turq:(id)sender{
    turq.image = [UIImage imageNamed:@"tickTurq.png"];
    white.image = [UIImage imageNamed:nil];
    red.image = [UIImage imageNamed:nil];
    orange.image = [UIImage imageNamed:nil];
    green.image = [UIImage imageNamed:nil];
    blue.image = [UIImage imageNamed:nil];
    yellow.image = [UIImage imageNamed:nil];
    NSString *specificStyle = @"turq";
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setObject:specificStyle forKey:@"colourStyle"];
    [standardUserDefaults synchronize];
}

-(IBAction)red:(id)sender{
    red.image = [UIImage imageNamed:@"tickRed.png"];
    turq.image = [UIImage imageNamed:nil];
    white.image = [UIImage imageNamed:nil];
    orange.image = [UIImage imageNamed:nil];
    green.image = [UIImage imageNamed:nil];
    blue.image = [UIImage imageNamed:nil];
    yellow.image = [UIImage imageNamed:nil];
    NSString *specificStyle = @"red";
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setObject:specificStyle forKey:@"colourStyle"];
    [standardUserDefaults synchronize];
}

-(IBAction)orange:(id)sender{
    orange.image = [UIImage imageNamed:@"tickOrange.png"];
    turq.image = [UIImage imageNamed:nil];
    red.image = [UIImage imageNamed:nil];
    white.image = [UIImage imageNamed:nil];
    green.image = [UIImage imageNamed:nil];
    blue.image = [UIImage imageNamed:nil];
    yellow.image = [UIImage imageNamed:nil];
    NSString *specificStyle = @"orange";
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setObject:specificStyle forKey:@"colourStyle"];
    [standardUserDefaults synchronize];
}

-(IBAction)green:(id)sender{
    green.image = [UIImage imageNamed:@"tickGreen.png"];
    turq.image = [UIImage imageNamed:nil];
    red.image = [UIImage imageNamed:nil];
    orange.image = [UIImage imageNamed:nil];
    white.image = [UIImage imageNamed:nil];
    blue.image = [UIImage imageNamed:nil];
    yellow.image = [UIImage imageNamed:nil];
    NSString *specificStyle = @"green";
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setObject:specificStyle forKey:@"colourStyle"];
    [standardUserDefaults synchronize];
}

-(IBAction)blue:(id)sender{
    blue.image = [UIImage imageNamed:@"tickBlue.png"];
    turq.image = [UIImage imageNamed:nil];
    red.image = [UIImage imageNamed:nil];
    orange.image = [UIImage imageNamed:nil];
    green.image = [UIImage imageNamed:nil];
    white.image = [UIImage imageNamed:nil];
    yellow.image = [UIImage imageNamed:nil];
    NSString *specificStyle = @"blue";
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setObject:specificStyle forKey:@"colourStyle"];
    [standardUserDefaults synchronize];
}

-(IBAction)yellow:(id)sender{
    yellow.image = [UIImage imageNamed:@"tickYellow.png"];
    turq.image = [UIImage imageNamed:nil];
    red.image = [UIImage imageNamed:nil];
    orange.image = [UIImage imageNamed:nil];
    green.image = [UIImage imageNamed:nil];
    blue.image = [UIImage imageNamed:nil];
    white.image = [UIImage imageNamed:nil];
    NSString *specificStyle = @"yellow";
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setObject:specificStyle forKey:@"colourStyle"];
    [standardUserDefaults synchronize];
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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"FirstLaunch"]){
        
    }
    else {
        turq.image = [UIImage imageNamed:@"tickTurq.png"];
    }
    
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *preferedColour = [standardUserDefaults stringForKey:@"colourStyle"];
    
    if ([preferedColour isEqual:@"white"]) {
        white.image = [UIImage imageNamed:@"tickWhite.png"];
    }
    else if ([preferedColour isEqual:@"red"]) {
        red.image = [UIImage imageNamed:@"tickRed.png"];
    }
    else if ([preferedColour isEqual:@"orange"]) {
        orange.image = [UIImage imageNamed:@"tickOrange.png"];
    }
    else if ([preferedColour isEqual:@"green"]) {
        green.image = [UIImage imageNamed:@"tickGreen.png"];
    }
    else if ([preferedColour isEqual:@"turq"]) {
        turq.image = [UIImage imageNamed:@"tickTurq.png"];
    }
    else if ([preferedColour isEqual:@"yellow"]) {
        yellow.image = [UIImage imageNamed:@"tickYellow.png"];
    }
    else if ([preferedColour isEqual:@"blue"]) {
        blue.image = [UIImage imageNamed:@"tickBlue.png"];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
