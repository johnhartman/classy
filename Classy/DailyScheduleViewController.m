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
#import "CustomBlockNames.h"
#import "UIDisplayNameTextField.h"
#import "RootViewController.h"

@interface DailyScheduleViewController ()
- (void) resignTextFieldFirstResponder;
@end

@implementation DailyScheduleViewController

static NSArray* rows;
NSMutableDictionary *textFieldToActivity;
static const CGFloat ANIMATION_DURATION = 0.4;
static const CGFloat LITTLE_SPACE = 5;
CGFloat animatedDistance;
NSArray *activityLabels;

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
    
    activityLabels = [[NSArray alloc] initWithObjects:_activity1Label,_activity2Label,_activity3Label,_activity4Label,_activity5Label,_activity6Label,_activity7Label,_activity8Label,_activity9Label,_activity10Label,nil];
    
    for(UIDisplayNameTextField *f in activityLabels) f.delegate = self;
    
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
    
    // add tap gesture to help in dismissing keyboard
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]
                                           initWithTarget:self
                                           action:@selector(screenWasTapped:)];// outside textfields
    
    [self.view addGestureRecognizer:tapGesture];
    
    // add keyboard notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
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
    
    NSArray* weekdaySchedule = [WeeklySchedule dailySchedule:weekday];
    
    NSEnumerator* enumerator = [weekdaySchedule objectEnumerator];
    textFieldToActivity = [[NSMutableDictionary alloc] init];
    
    for (NSArray* row in rows)
    {
        Activity* activity = [enumerator nextObject];
        
        UIDisplayNameTextField* activityDisplayName = [row objectAtIndex:0];
        activityDisplayName.text = activity.displayName;
        UILabel* activityStartTime = [row objectAtIndex:1];
        UILabel* activityDash = [row objectAtIndex:2];
        UILabel* activityEndTime = [row objectAtIndex:3];
        
        // setting each row to be visible or hidden
        
        if (activity != NULL) {
            //[textFieldToActivity setObject:activity.name forKey:activityDisplayName];
            activityDisplayName.activity = activity;
            
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
            
            activityDisplayName.hidden = FALSE;
            activityStartTime.hidden = FALSE;
            activityDash.hidden = FALSE;
            activityEndTime.hidden = FALSE;
        }
        else {
            activityDisplayName.hidden = TRUE;
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

/**
 * text field manipulations so that it's displayed above keyboard
 */
- (void) textFieldDidBeginEditing:(UITextField*)textField{
    textField.borderStyle = UITextBorderStyleRoundedRect;
}
- (BOOL) textFieldShouldBeginEditing:(UIDisplayNameTextField *)textField {
    // only allow 'block activities to be customized
    if ( ! [textField.activity.name containsString:@"Block"] ) {
        [self resignTextFieldFirstResponder];
        return NO;
    }
    
    textField.layer.borderColor = [ClassyAppDelegate getHighlightColor].CGColor;
    textField.layer.borderWidth = 1;
    textField.layer.cornerRadius = 5;
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UIDisplayNameTextField *)textField {
    textField.layer.borderWidth = 0;
    textField.layer.borderColor = [ClassyAppDelegate getHighlightColor].CGColor;
    [textField setBorderStyle:UITextBorderStyleNone];
    
    NSString *newDisplayName = [[NSString alloc] initWithString:textField.text];
    newDisplayName = [newDisplayName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    // Do not allow empty names
    if (newDisplayName.length == 0) return NO;
    
    // save the customized block name for the activity (stored as property in textField
    [CustomBlockNames setName:textField.activity.name withValue:newDisplayName];
    
    // reload entire the schedule with new display name for block
    [WeeklySchedule initialize];
    return YES;
}
- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (void) keyboardDidShow:(NSNotification*)aNotification{
    NSDictionary* info = [aNotification userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    // find the active text field and move the frame down, so that field is visible
    for(UIDisplayNameTextField *textField in activityLabels) {
        if ([textField isFirstResponder]) {
            CGRect viewFrame = self.view.frame;
            CGRect textFieldRect = [self.view convertRect:textField.bounds fromView:textField];
            CGRect viewRect = [self.view convertRect:self.view.bounds fromView:self.view];
            CGFloat textFieldBottomLine = textFieldRect.origin.y + textFieldRect.size.height;
            
            CGFloat keyboardHeight = keyboardSize.height;
            
            BOOL isTextFieldHidden = textFieldBottomLine > (viewRect.size.height - keyboardHeight)? TRUE :FALSE;
            if (isTextFieldHidden) {
                animatedDistance = textFieldBottomLine - (viewRect.size.height - keyboardHeight) ;
                viewFrame.origin.y -= animatedDistance;
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationBeginsFromCurrentState:YES];
                [UIView setAnimationDuration:ANIMATION_DURATION];
                [self.view setFrame:viewFrame];
                [UIView commitAnimations];
            }
            
            break;
        }
    }
}

- (void)keyboardDidHide:(NSNotification*)aNotification{
    // keyboard is dismissed, restore frame view to its  zero origin
    CGRect viewFrame = self.view.frame;
    if (viewFrame.origin.y != 0) {
        viewFrame.origin.y = 0;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:ANIMATION_DURATION];
        [self.view setFrame:viewFrame];
        [UIView commitAnimations];
    }
}
// dismiss keyboard when tap outside text fields
- (IBAction)screenWasTapped:(UITapGestureRecognizer *)sender {
    [self resignTextFieldFirstResponder];
}
- (void) resignTextFieldFirstResponder {
    for(UIDisplayNameTextField *f in activityLabels)
        if ([f isFirstResponder]) [f resignFirstResponder];
}
@end
