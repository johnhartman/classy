//
//  DailyScheduleViewController.h
//  Classy
//
//  Created by Natalie Hartman on 8/15/14.
//  Copyright (c) 2014 Natalie Hartman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIDisplayNameTextField.h"

@interface DailyScheduleViewController : UIViewController <UITextFieldDelegate>

// DAY SELECTION BUTTONS
-   (IBAction) handleMondayButton:(id)sender;
-   (IBAction) handleTuesdayButton:(id)sender;
-   (IBAction) handleWednesdayButton:(id)sender;
-   (IBAction) handleThursdayButton:(id)sender;
-   (IBAction) handleFridayButton:(id)sender;

// WEEKDAY BUTTON LABELS
@property IBOutlet UIButton* mondayButton;
@property IBOutlet UIButton* tuesdayButton;
@property IBOutlet UIButton* wednesdayButton;
@property IBOutlet UIButton* thursdayButton;
@property IBOutlet UIButton* fridayButton;

// ACTIVITY LABELS
//@property IBOutlet UILabel* activity1Label;
@property (strong, nonatomic) IBOutlet UIDisplayNameTextField *activity1Label;
@property IBOutlet UILabel* activity1StartTime;
@property IBOutlet UILabel* activity1EndTime;
@property (strong, nonatomic) IBOutlet UIDisplayNameTextField* activity2Label;
@property IBOutlet UILabel* activity2StartTime;
@property IBOutlet UILabel* activity2EndTime;
@property (strong, nonatomic) IBOutlet UIDisplayNameTextField* activity3Label;
@property IBOutlet UILabel* activity3StartTime;
@property IBOutlet UILabel* activity3EndTime;
@property (strong, nonatomic) IBOutlet UIDisplayNameTextField* activity4Label;
@property IBOutlet UILabel* activity4StartTime;
@property IBOutlet UILabel* activity4EndTime;
@property (strong, nonatomic) IBOutlet UIDisplayNameTextField* activity5Label;
@property IBOutlet UILabel* activity5StartTime;
@property IBOutlet UILabel* activity5EndTime;
@property (strong, nonatomic) IBOutlet UIDisplayNameTextField* activity6Label;
@property IBOutlet UILabel* activity6StartTime;
@property IBOutlet UILabel* activity6EndTime;
@property (strong, nonatomic) IBOutlet UIDisplayNameTextField* activity7Label;
@property IBOutlet UILabel* activity7StartTime;
@property IBOutlet UILabel* activity7EndTime;
@property (strong, nonatomic) IBOutlet UIDisplayNameTextField* activity8Label;
@property IBOutlet UILabel* activity8StartTime;
@property IBOutlet UILabel* activity8EndTime;
@property (strong, nonatomic) IBOutlet UIDisplayNameTextField* activity9Label;
@property IBOutlet UILabel* activity9StartTime;
@property IBOutlet UILabel* activity9EndTime;
@property (strong, nonatomic) IBOutlet UIDisplayNameTextField* activity10Label;
@property IBOutlet UILabel* activity10StartTime;
@property IBOutlet UILabel* activity10EndTime;

// LITTLE DASH THINGIES
@property IBOutlet UILabel* activity1Dash;
@property IBOutlet UILabel* activity2Dash;
@property IBOutlet UILabel* activity3Dash;
@property IBOutlet UILabel* activity4Dash;
@property IBOutlet UILabel* activity5Dash;
@property IBOutlet UILabel* activity6Dash;
@property IBOutlet UILabel* activity7Dash;
@property IBOutlet UILabel* activity8Dash;
@property IBOutlet UILabel* activity9Dash;
@property IBOutlet UILabel* activity10Dash;

// DAYS OF WEEK BUTTONS
@property IBOutlet UIButton* MButton;
@property IBOutlet UIButton* TButton;
@property IBOutlet UIButton* WButton;
@property IBOutlet UIButton* ThButton;
@property IBOutlet UIButton* FButton;

- (void)updateWeekday:(NSString*)weekday;

@end
