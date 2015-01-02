//
//  ClassyAppDelegate.h
//  Classy
//
//  Created by Natalie Hartman on 4/8/14.
//  Copyright (c) 2014 Natalie Hartman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassyPageViewController.h"

@interface ClassyAppDelegate : UIResponder <UIApplicationDelegate>

+ (UIColor*)getHighlightColor;
+ (ClassyPageViewController *) classyPageViewController;
+ (BOOL) isSchoolInSession;

@property (strong, nonatomic) UIWindow *window;

@end