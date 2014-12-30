//
//  DailyScheduleViewController.m
//  Classy
//
//  Created by Natalie Hartman on 8/15/14.
//  Copyright (c) 2014 Natalie Hartman. All rights reserved.
//

#import "DailyScheduleViewController.h"
#import "WeeklySchedule.h"
#import "Activity.h"

@interface DailyScheduleViewController ()

@end


@implementation DailyScheduleViewController

static NSArray* rows;

- (void)initialize
{
    NSArray* row1 = [[NSArray alloc] initWithObjects:_activity1Label, _activity1StartTime, _activity1Dash, _activity1EndTime ,nil];
    NSArray* row2 = [[NSArray alloc] initWithObjects:_activity2Label, _activity2StartTime, _activity2Dash, _activity2EndTime ,nil];
    NSArray* row3 = [[NSArray alloc] initWithObjects:_activity3Label, _activity3StartTime, _activity3Dash, _activity3EndTime ,nil];
    NSArray* row4 = [[NSArray alloc] initWithObjects:_activity4Label, _activity4StartTime, _activity4Dash, _activity4EndTime ,nil];
    NSArray* row5 = [[NSArray alloc] initWithObjects:_activity5Label, _activity5StartTime, _activity5Dash, _activity5EndTime ,nil];
    NSArray* row6 = [[NSArray alloc] initWithObjects:_activity6Label, _activity6StartTime, _activity6Dash, _activity6EndTime ,nil];
    NSArray* row7 = [[NSArray alloc] initWithObjects:_activity7Label, _activity7StartTime, _activity7Dash, _activity7EndTime ,nil];
    NSArray* row8 = [[NSArray alloc] initWithObjects:_activity8Label, _activity8StartTime, _activity8Dash, _activity8EndTime ,nil];
    NSArray* row9 = [[NSArray alloc] initWithObjects:_activity9Label, _activity9StartTime, _activity9Dash, _activity9EndTime ,nil];
    NSArray* row10 = [[NSArray alloc] initWithObjects:_activity10Label, _activity10StartTime, _activity10Dash, _activity10EndTime ,nil];
    
    rows = [[NSArray alloc] initWithObjects:row1, row2, row3, row4, row5, row6, row7, row8, row9, row10, nil];

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
    [self initialize];
    
}

 
- (void)updateWeekday:(NSString*) weekday {
    NSArray* weekdaySchedule = [WeeklySchedule dailySchedule:weekday];
    
    NSEnumerator *enumerator = [weekdaySchedule objectEnumerator];
    
    for (NSArray* row in rows)
    {
        Activity* activity = [enumerator nextObject];
        
        UILabel* activityName = [row objectAtIndex:0];
        activityName.text = activity.name;
        UILabel* activityStartTime = [row objectAtIndex:1];
        UILabel* activityDash = [row objectAtIndex:2];
        UILabel* activityEndTime = [row objectAtIndex:3];
        
        
    }
}

- (IBAction)handleMondayButton:(id)sender {
    [self updateWeekday:@"Monday"];
}

- (IBAction)handleTuesdayButton:(id)sender {
    [self updateWeekday:@"Tuesday"];
}

- (IBAction)handleWednesdayButton:(id)sender {
    [self updateWeekday:@"Wednesday"];
}

- (IBAction)handleThursdayButton:(id)sender {
    [self updateWeekday:@"Thursday"];
}

- (IBAction)handleFridayButton:(id)sender {
    [self updateWeekday:@"Friday"];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
