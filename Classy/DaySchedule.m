//
//  DaySchedule.m
//  Classy
//
//  Created by Natalie Hartman on 4/9/14.
//  Copyright (c) 2014 Natalie Hartman. All rights reserved.
//

#import "DaySchedule.h"
#import "Activity.h"
#import "TimeSlot.h"

@implementation DaySchedule

for (Activity* a in Schedule) {
    for (TimeSlot* t in a.timeSlots) {
        if ([t.weekday isEqualToString:@"Monday"]) {
            
            int intDuration = [t.duration intValue];
            
            int intStartMinutes = [t.startMinute intValue];
            int intStartHour = (intStartMinutes/60)%12;
            
            int intEndMinutes = (intStartMinutes + intDuration);
            int intEndHour = ((intEndMinutes)/60)%12;
            
            if (intStartHour == 0)
                intStartHour = 12;
            
            if (intEndHour == 0)
                intEndHour = 12;
            
            NSLog(@"%@: %d:%02d - %d:%02d\n",a.name, intStartHour, intStartMinutes%60, intEndHour, intEndMinutes%60);
            
        }
    }
}

@end
