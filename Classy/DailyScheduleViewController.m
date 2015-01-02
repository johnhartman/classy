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
#import "TimeSlot.h"
#import "ClassyAppDelegate.h"

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
    
    // getting the current weekday
    
    NSDate *currentTime = [NSDate date];
    NSDateFormatter* theDateFormatter = [[NSDateFormatter alloc] init];
    [theDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [theDateFormatter setDateFormat:@"EEEE"];
  
    NSString *currentWeekday =  [theDateFormatter stringFromDate:currentTime];
   
    if ([currentWeekday isEqualToString:@"Sunday"] || [currentWeekday isEqualToString:@"Saturday"]) {
        currentWeekday = @"Monday";
    }
    
    //
    
    [self updateWeekday:currentWeekday];
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
    
    // set only the current weekday's button to blue, set the rest to gray
  
    UIColor* highlightColor = [ClassyAppDelegate getHighlightColor];
    
    [self.mondayButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.tuesdayButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.wednesdayButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.thursdayButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.fridayButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    if ([weekday isEqualToString:@"Monday"]) {
        [self.mondayButton setTitleColor:highlightColor forState:UIControlStateNormal];
    }
    if ([weekday isEqualToString:@"Tuesday"]) {
        [self.tuesdayButton setTitleColor:highlightColor forState:UIControlStateNormal];
    }
    if ([weekday isEqualToString:@"Wednesday"]) {
        [self.wednesdayButton setTitleColor:highlightColor forState:UIControlStateNormal];
    }
    if ([weekday isEqualToString:@"Thursday"]) {
        [self.thursdayButton setTitleColor:highlightColor forState:UIControlStateNormal];
    }
    if ([weekday isEqualToString:@"Friday"]) {
        [self.fridayButton setTitleColor:highlightColor forState:UIControlStateNormal];
    }

    //
    
    NSArray* weekdaySchedule = [WeeklySchedule dailySchedule:weekday];
    
    NSEnumerator* enumerator = [weekdaySchedule objectEnumerator];
    
    for (NSArray* row in rows)
    {
        Activity* activity = [enumerator nextObject];
        
        UILabel* activityName = [row objectAtIndex:0];
        activityName.text = activity.name;
        UILabel* activityStartTime = [row objectAtIndex:1];
        UILabel* activityDash = [row objectAtIndex:2];
        UILabel* activityEndTime = [row objectAtIndex:3];
        
        // setting each row to be visible or hidden
        
        if (activity != NULL) {
            
            // turn the time into 00:00 form
            
            int startMinutes = 0;
            int endMinutes = 0;
            for (TimeSlot* t in activity.timeSlots) {
                startMinutes = [t.startMinute intValue];
                endMinutes = [t.duration intValue] + startMinutes;
            }
            
            if (startMinutes > 13*60) {
                startMinutes -= 12*60;
            }
            if (endMinutes > 13*60) {
                endMinutes -= 12*60;
            }
            
            NSString* startTime = [NSString stringWithFormat:@"%2d:%02d", startMinutes/60, startMinutes%60];
            NSString* endTime = [NSString stringWithFormat:@"%2d:%02d", endMinutes/60, endMinutes%60];
            
            //
            
            activityStartTime.text = startTime;
            activityEndTime.text = endTime;
            
            activityName.hidden = FALSE;
            activityStartTime.hidden = FALSE;
            activityDash.hidden = FALSE;
            activityEndTime.hidden = FALSE;
        }
        else {
            activityName.hidden = TRUE;
            activityStartTime.hidden = TRUE;
            activityDash.hidden = TRUE;
            activityEndTime.hidden = TRUE;
        }
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
