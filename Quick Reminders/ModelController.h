//
//  ModelController.h
//  Quick Reminders
//
//  Created by Oscar Diplock on 23/10/2013.
//  Copyright (c) 2013 Oscar Diplock. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end
