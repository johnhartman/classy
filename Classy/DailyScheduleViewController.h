//
//  DailyScheduleViewController.h
//  Classy
//
//  Created by Natalie Hartman on 8/15/14.
//  Copyright (c) 2014 Natalie Hartman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DailyScheduleViewController : UIViewController

    // DAY SELECTION BUTTONS
-   (IBAction) handleMondayButton:(id)sender;
-   (IBAction) handleTuesdayButton:(id)sender;
-   (IBAction) handleWednesdayButton:(id)sender;
-   (IBAction) handleThursdayButton:(id)sender;
-   (IBAction) handleFridayButton:(id)sender;
    
    // ACTIVITY LABELS
    @property IBOutlet UILabel* activity1Label;
    @property IBOutlet UILabel* activity1StartTime;
    @property IBOutlet UILabel* activity1EndTime;
    @property IBOutlet UILabel* activity2Label;
    @property IBOutlet UILabel* activity2StartTime;
    @property IBOutlet UILabel* activity2EndTime;
    @property IBOutlet UILabel* activity3Label;
    @property IBOutlet UILabel* activity3StartTime;
    @property IBOutlet UILabel* activity3EndTime;
    @property IBOutlet UILabel* activity4Label;
    @property IBOutlet UILabel* activity4StartTime;
    @property IBOutlet UILabel* activity4EndTime;
    @property IBOutlet UILabel* activity5Label;
    @property IBOutlet UILabel* activity5StartTime;
    @property IBOutlet UILabel* activity5EndTime;
    @property IBOutlet UILabel* activity6Label;
    @property IBOutlet UILabel* activity6StartTime;
    @property IBOutlet UILabel* activity6EndTime;
    @property IBOutlet UILabel* activity7Label;
    @property IBOutlet UILabel* activity7StartTime;
    @property IBOutlet UILabel* activity7EndTime;
    @property IBOutlet UILabel* activity8Label;
    @property IBOutlet UILabel* activity8StartTime;
    @property IBOutlet UILabel* activity8EndTime;
    @property IBOutlet UILabel* activity9Label;
    @property IBOutlet UILabel* activity9StartTime;
    @property IBOutlet UILabel* activity9EndTime;
    @property IBOutlet UILabel* activity10Label;
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



@end
