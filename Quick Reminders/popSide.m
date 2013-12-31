//
//  popSide.m
//  Quick Reminders
//
//  Created by Eduard Mocanu on 18/12/2013.
//  Copyright (c) 2013 GRAPHITE. All rights reserved.
//

#import "popSide.h"

@implementation popSide

- (void)perform {
    UIViewController *srcViewController = (UIViewController *) self.sourceViewController;
    UIViewController *destViewController = (UIViewController *) self.destinationViewController;
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    [srcViewController.view.window.layer addAnimation:transition forKey:nil];
    
    [srcViewController presentViewController:destViewController animated:NO completion:nil];
}

@end