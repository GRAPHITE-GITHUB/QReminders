//
//  popSide2.m
//  Quick Reminders
//
//  Created by Eduard Mocanu on 18/12/2013.
//  Copyright (c) 2013 GRAPHITE. All rights reserved.
//

#import "popSide2.h"

@implementation popSide2

- (void)perform {
    UIViewController *srcViewController = (UIViewController *) self.sourceViewController;
    UIViewController *destViewController = (UIViewController *) self.destinationViewController;
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
    [srcViewController.view.window.layer addAnimation:transition forKey:nil];
    
    [srcViewController presentViewController:destViewController animated:NO completion:nil];
}


@end