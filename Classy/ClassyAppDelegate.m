//
//  ClassyAppDelegate.m
//  Classy
//
//  Created by Natalie Hartman on 4/8/14.
//  Copyright (c) 2014 Natalie Hartman. All rights reserved.
//

#import "ClassyAppDelegate.h"
#import "ClassyViewController.h"
#import "ClassyNotInSessionViewController.h"

@implementation ClassyAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    // Determine whether class is in session
    
    NSDate *currentTime = [NSDate date];
    
    NSDateFormatter* theDateFormatter = [[NSDateFormatter alloc] init];
    [theDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [theDateFormatter setDateFormat:@"EEEE"];
    NSString *currentWeekday =  [theDateFormatter stringFromDate:currentTime];
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned unitFlags =  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *components = [gregorian components:unitFlags fromDate:currentTime];
    
    long secondsSinceMidnight = 60 * 60 * [components hour] + 60 * [components minute] + [components second];
    long minutesSinceMidnight = secondsSinceMidnight/60;
    
    // Check whether current time is during school
    
    UIViewController *mainViewController;
    // If it is, load ClassyViewController
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"lo" bundle:nil];
    if ((![currentWeekday isEqualToString:@"Sunday"] && ![currentWeekday isEqualToString:@"Saturday"]) && (minutesSinceMidnight >= 8*60+25) && (minutesSinceMidnight < 15*60+25)) {
        //mainViewController = [board instantiateViewControllerWithIdentifier:@"InSession"];
        mainViewController = [board instantiateViewControllerWithIdentifier:@"InSession"];
    }
    else {
        // If not (or it's a weekend), load ClassyNotInSessionViewController
        mainViewController = [board instantiateViewControllerWithIdentifier:@"Daily Schedule"];
    }
    // Display the view controller
    
    [self.window addSubview:mainViewController.view];
    [self.window setRootViewController:mainViewController];
    [self.window makeKeyAndVisible];
    
    return YES;
}
/*
- (NSUInteger) supportedInterfaceOrientations {
    // Return a bitmask of supported orientations. If you need more,
    // use bitwise or (see the commented return).
    return UIInterfaceOrientationMaskPortrait;
    // return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}

- (UIInterfaceOrientation) preferredInterfaceOrientationForPresentation {
    // Return the orientation you'd prefer - this is what it launches to. The
    // user can still rotate. You don't have to implement this method, in which
    // case it launches in the current orientation
    return UIInterfaceOrientationPortrait;
} */

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
