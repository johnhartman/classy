//
//  ClassyViewController.m
//  Classy
//
//  Created by Natalie Hartman on 4/8/14.
//  Copyright (c) 2014 Natalie Hartman. All rights reserved.
//

#import "ClassyViewController.h"
#import "TimeSlot.h"
#import "Activity.h"
#import "WeeklySchedule.h"

@interface ClassyViewController ()

@property (nonatomic, strong) UIProgressView *progressView;

- (void)toggleNextActivityLabelVisible:(BOOL)visible;

@end

@implementation ClassyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self setTimer];
    
    self.progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    
    self.progressView.center = self.view.center;
    [self.view addSubview:self.progressView];
}

// COUNTDOWN CODE

- (void) timerRun {
    // get the weekday schedule (copy/move from viewDidLoad above)
    
    // ESTABLISHING CURRENT DATE AND TIME
    
    NSDate *currentTime = [NSDate date];
    
    NSDateFormatter* theDateFormatter = [[NSDateFormatter alloc] init];
    [theDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [theDateFormatter setDateFormat:@"EEEE"];
    NSString *currentWeekday =  [theDateFormatter stringFromDate:currentTime];
    
    
    if ([currentWeekday isEqualToString:@"Sunday"] || [currentWeekday isEqualToString:@"Saturday"]) {
        currentWeekday = @"Monday";
    }
    
    // PRINTING MONDAY SCHEDULE (TESTING)
    
    NSArray* weekdaySchedule = [WeeklySchedule dailySchedule:currentWeekday];
    
    // determine current and next activities
    
    Activity *currentActivity = nil;
    Activity *nextActivity = nil;
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned unitFlags =  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *components = [gregorian components:unitFlags fromDate:currentTime];
    
    int secondsSinceMidnight = 60 * 60 * (int)[components hour] + 60 * (int)[components minute] + (int)[components second];
    int minutesSinceMidnight = secondsSinceMidnight/60;
    
    Activity* a = nil;
    
    for (Activity* b in weekdaySchedule) {
        
        if (a != nil) {
            
            int aStartMinutes = 0;
            int bStartMinutes = 0;
            
            for (TimeSlot* t in a.timeSlots) {
                aStartMinutes = [t.startMinute intValue];
            }
            
            for (TimeSlot* t in b.timeSlots) {
                bStartMinutes = [t.startMinute intValue];
            }
            
            if ((currentActivity == nil) && (minutesSinceMidnight >= aStartMinutes) && (minutesSinceMidnight < (bStartMinutes))) {
                currentActivity = a;
                nextActivity = b;
                break;
            }
        }
        a = b;
    }
    if (currentActivity == nil) {
        currentActivity = a;
    }
    
    TimeSlot *nextTimeSlot = nil;
    
    for (TimeSlot *t in nextActivity.timeSlots)
        nextTimeSlot = t;
    
    int intNextActivityStartMinute = [nextTimeSlot.startMinute intValue];
    
    if (intNextActivityStartMinute > 13*60) {
        intNextActivityStartMinute -= 12*60;
    }
    
    NSString *stringNextActivityStartTimeLabel = [NSString stringWithFormat:@"%2d:%02d", intNextActivityStartMinute/60, intNextActivityStartMinute%60];
    
    // trim whitespace so that times with single digit hour values are centered
    
    nextActivityStartTimeLabel.text = [stringNextActivityStartTimeLabel stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    // update next activity label
    
    if (nextActivity) {
        [self toggleNextActivityLabelVisible:YES];
        nextActivityLabel.text = nextActivity.name;
    } else {
        [self toggleNextActivityLabelVisible:NO];
    }
    
    
    // set secondsCount to # of seconds until next activity
    
    TimeSlot *currentTimeSlot = nil;
    for (TimeSlot *t in currentActivity.timeSlots) {
        currentTimeSlot = t;
    }
    
    // calculating remaining time in passing period
    
    int totalSecondsLeftInPassing = 0;
    
    // if there is a passing period after the end of current activity
    
    if (![nextTimeSlot.startMinute isEqualToNumber:[NSNumber numberWithInt:[currentTimeSlot.startMinute intValue]+[currentTimeSlot.duration intValue]]]) {
        // if we're in the passing period after the current timeslot
        if (secondsSinceMidnight > ([currentTimeSlot.startMinute intValue]*60+[currentTimeSlot.duration intValue]*60))
        {
            totalSecondsLeftInPassing = [nextTimeSlot.startMinute intValue]*60 - secondsSinceMidnight;
        }
        if (totalSecondsLeftInPassing < 0)
            NSLog(@"error: totalSecondsLeftInPassing is negative!!! very bad");
    }
    
    // determine if there is a passing after the current activity and if so, deterine
    // how much time is left in the passing period
    
    int intStartMinutes = [currentTimeSlot.startMinute intValue];
    int intDuration = [currentTimeSlot.duration intValue];
    
    int secondsLeftInActivity = (intStartMinutes*60 + intDuration*60) - secondsSinceMidnight;
    
    // are we in a passing period?
    
    int hours; int minutes; int seconds;
    
    if (totalSecondsLeftInPassing != 0) {
        currentActivityLabel.text = nil;
        countdownLabel.textColor = [UIColor redColor];
        hours = 0;
        minutes = totalSecondsLeftInPassing / 60;
        seconds = totalSecondsLeftInPassing % 60;
        _progressView.hidden = true;
    }
    else {
        
        // update current activity label
        
        currentActivityLabel.text = currentActivity.name;
        countdownLabel.textColor = [UIColor blackColor];
        
        _progressView.hidden = false;
        float progressNumber = (float)(secondsSinceMidnight - intStartMinutes*60)/(intDuration*60);
        _progressView.progress = progressNumber;
        
        hours = secondsLeftInActivity/3600;
        minutes = (secondsLeftInActivity%3600) / 60;
        seconds = (secondsLeftInActivity%3600) % 60;
    }
    NSString* timerOutput = [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
    countdownLabel.text = timerOutput;
}

- (void) setTimer {
    
    countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
}

// END COUNTDOWN CODE

- (void)toggleNextActivityLabelVisible:(BOOL)visible
{
    nextActivityLabel.hidden = !visible;
    nextActivityStartTimeLabel.hidden = !visible;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
