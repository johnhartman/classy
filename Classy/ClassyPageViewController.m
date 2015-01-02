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
#import "ClassyAppDelegate.h"

@interface ClassyPageViewController ()

@end

@implementation ClassyPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // allocate our page view controller
    self.uiPageViewController = [[UIPageViewController alloc]
                                 initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                 navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                 options: nil];
    self.dataSource = self;
    
    // Set the background of the view to match the background of the subviews (all are white)
    self.view.backgroundColor = [UIColor whiteColor];
    

    // if current time is during school hours, load InSession, if not load NotInSession
    
    UIViewController *initialContentView;
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"classy" bundle:nil];
    
    if ([ClassyAppDelegate isSchoolInSession]) {
        initialContentView = [board instantiateViewControllerWithIdentifier:@"InSession"];
    }
    else {
        // If not (or it's a weekend), load ClassyNotInSessionViewController
        initialContentView = [board instantiateViewControllerWithIdentifier:@"NotInSession"];
    }
    
    //
    
    [self setViewControllers:[[NSArray alloc] initWithObjects:initialContentView, nil] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass:[ClassyViewController class]] || [viewController isKindOfClass:[ClassyNotInSessionViewController class]])
        return nil;
    
    // if current time is during school hours, load InSession, if not load NotInSession
    
    UIViewController *mainViewController;
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"classy" bundle:nil];
    
    if ([ClassyAppDelegate isSchoolInSession]) {
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
