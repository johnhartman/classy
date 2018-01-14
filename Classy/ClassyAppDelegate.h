//
//  ClassyAppDelegate.h
//  Classy
//
//  Created by Natalie Hartman on 4/8/14.
//  Copyright (c) 2014-2018 Natalie Hartman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassyAppDelegate : UIResponder <UIApplicationDelegate>

+ (UIColor*)getHighlightColor;
+ (BOOL) isSchoolInSession;

@property (strong, nonatomic) UIWindow *window;

@end
