//
//  ClassyAppDelegate.m
//  Classy
//
//  Created by Natalie Hartman on 4/8/14.
//  Copyright (c) 2014 Natalie Hartman. All rights reserved.
//

#import "ClassyAppDelegate.h"
#import "RootViewController.h"
//#import "ClassyPageViewController.h"

@implementation ClassyAppDelegate
//static ClassyPageViewController *classyPageViewController;
//+ (ClassyPageViewController *) classyPageViewController {
//    return classyPageViewController;
//}
+ (BOOL) isSchoolInSession {
    NSDate *currentTime = [NSDate date];
    
    NSDateFormatter* theDateFormatter = [[NSDateFormatter alloc] init];
    [theDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [theDateFormatter setDateFormat:@"EEEE"];
    NSString *currentWeekday =  [theDateFormatter stringFromDate:currentTime];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned unitFlags =  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *components = [gregorian components:unitFlags fromDate:currentTime];
    
    long secondsSinceMidnight = 60 * 60 * [components hour] + 60 * [components minute] + [components second];
    long minutesSinceMidnight = secondsSinceMidnight/60;
    
    if ((![currentWeekday isEqualToString:@"Sunday"] && ![currentWeekday isEqualToString:@"Saturday"]) && (minutesSinceMidnight >= 8*60+25) && (minutesSinceMidnight < 15*60+25)) {
        return true;
    }
    return false;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    // Display the view controller
    
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"classy" bundle:nil];
    UIViewController *rootViewController = [board instantiateViewControllerWithIdentifier:@"RootViewController"];
    
    [self.window addSubview:rootViewController.view];
    [self.window setRootViewController:rootViewController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

+ (UIColor*)getHighlightColor
{
    return [UIColor colorWithRed:0 green:0.533 blue:1.0 alpha:1.0];
}


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
