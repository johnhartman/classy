//
//  ClassyPageViewController.m
//  Classy
//
//  Created by Natalie Hartman on 12/31/14.
//  Copyright (c) 2014 Natalie Hartman. All rights reserved.
//

#import "ClassyPageViewController.h"
#import "ClassyViewController.h"
#import "ClassyNotInSessionViewController.h"
#import "DailyScheduleViewController.h"

@interface ClassyPageViewController ()

@end

@implementation ClassyPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [super viewDidLoad];
    
    self.dataSource = self;
    
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
    
    // if current time is during school hours, load InSession, if not load NotInSession
    
    NSString* initialPage;
    
    UIViewController *mainViewController;
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"classy" bundle:nil];
    
    if ((![currentWeekday isEqualToString:@"Sunday"] && ![currentWeekday isEqualToString:@"Saturday"]) && (minutesSinceMidnight >= 8*60+25) && (minutesSinceMidnight < 15*60+25)) {
        mainViewController = [board instantiateViewControllerWithIdentifier:@"InSession"];
    }
    else {
        // If not (or it's a weekend), load ClassyNotInSessionViewController
        mainViewController = [board instantiateViewControllerWithIdentifier:@"NotInSession"];
    }
    
    //
    
    [self setViewControllers:@[[self.storyboard instantiateViewControllerWithIdentifier:initialPage]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass:[ClassyViewController class]])
        return nil;
    
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
    
    // if current time is during school hours, load InSession, if not load NotInSession
    
    UIViewController *mainViewController;
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"classy" bundle:nil];
    
    if ((![currentWeekday isEqualToString:@"Sunday"] && ![currentWeekday isEqualToString:@"Saturday"]) && (minutesSinceMidnight >= 8*60+25) && (minutesSinceMidnight < 15*60+25)) {
        mainViewController = [board instantiateViewControllerWithIdentifier:@"InSession"];
    }
    else {
        // If not (or it's a weekend), load ClassyNotInSessionViewController
        mainViewController = [board instantiateViewControllerWithIdentifier:@"NotInSession"];
    }
    
    //
    
    return mainViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass:[DailyScheduleViewController class]])
        return nil;
    
    return [self.storyboard instantiateViewControllerWithIdentifier:@"Daily Schedule"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
