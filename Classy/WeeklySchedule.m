//
//  WeeklySchedule.m
//  Classy
//
//  Created by Natalie Hartman on 4/10/14.
//  Copyright (c) 2014 Natalie Hartman. All rights reserved.
//

#import "WeeklySchedule.h"
#import "TimeSlot.h"
#import "Activity.h"

@implementation WeeklySchedule

static NSMutableSet* weeklySchedule;

+ (NSArray*) dailySchedule:(NSString*)forWeekday {
    
    NSMutableArray* weekdaySchedule = [[NSMutableArray alloc] init];
    
    // CREATING NSMUTABLEARRAY OF EVERY CLASS THAT DAY
    
    for (Activity* a in weeklySchedule) {
        
        NSMutableSet* weekdayTimeslots = [[NSMutableSet alloc] init];
        
        for (TimeSlot* t in a.timeSlots) {
            if ([t.weekday isEqualToString:forWeekday]) {
                [weekdayTimeslots addObject:t];
            }
        }
        
        NSUInteger count = [weekdayTimeslots count];
        
        if (count != 0) {
        Activity* weekdayActivity = [[Activity alloc] initWithName:a.name withColor:a.color withTimeSlots:weekdayTimeslots];
            [weekdaySchedule addObject:weekdayActivity];
            
        }
    }
    
    // SORTING THIS ARRAY INTO CHRONOLOGICAL ORDER
    
    NSArray *sortedArray = [weekdaySchedule sortedArrayUsingComparator: ^(id obj1, id obj2) {
        
        Activity* activity1 = (Activity*)obj1;
        Activity* activity2 = (Activity*)obj2;
        
        NSNumber* startMinutes1;
        NSNumber* startMinutes2;
        
        for (TimeSlot* t in activity1.timeSlots) {
            startMinutes1 = t.startMinute;
        }
        
        for (TimeSlot* t in activity2.timeSlots) {
            startMinutes2 = t.startMinute;
        }
        
        if ([startMinutes1 integerValue] > [startMinutes2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([startMinutes1 integerValue] < [startMinutes2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    return sortedArray;
}

+ (void) initialize {
    // A BLOCK TIMESLOTS -----------------------------
    
    TimeSlot* ABlockMonday = [[TimeSlot alloc] initWithWeekday:@"Monday" withStartMinute:[NSNumber numberWithInt:8*60+25] withDuration:[NSNumber numberWithInt:45]];
    
    TimeSlot* ABlockTuesday = [[TimeSlot alloc] initWithWeekday:@"Tuesday" withStartMinute:[NSNumber numberWithInt:14*60+35] withDuration:[NSNumber numberWithInt:45]];
    
    TimeSlot* ABlockWednesday = [[TimeSlot alloc] initWithWeekday:@"Wednesday" withStartMinute:[NSNumber numberWithInt:8*60+25] withDuration:[NSNumber numberWithInt:90]];
    
    TimeSlot* ABlockFriday = [[TimeSlot alloc] initWithWeekday:@"Friday" withStartMinute:[NSNumber numberWithInt:13*60+10] withDuration:[NSNumber numberWithInt:40]];
    
    // B BLOCK TIMESLOTS -----------------------------
    
    TimeSlot* BBlockMonday = [[TimeSlot alloc] initWithWeekday:@"Monday" withStartMinute:[NSNumber numberWithInt:9*60+15] withDuration:[NSNumber numberWithInt:45]];
    
    TimeSlot* BBlockTuesday = [[TimeSlot alloc] initWithWeekday:@"Tuesday" withStartMinute:[NSNumber numberWithInt:8*60+25] withDuration:[NSNumber numberWithInt:45]];
    
    TimeSlot* BBlockWednesday = [[TimeSlot alloc] initWithWeekday:@"Wednesday" withStartMinute:[NSNumber numberWithInt:10*60+10] withDuration:[NSNumber numberWithInt:90]];
    
    TimeSlot* BBlockFriday = [[TimeSlot alloc] initWithWeekday:@"Friday" withStartMinute:[NSNumber numberWithInt:13*60+55] withDuration:[NSNumber numberWithInt:40]];
    
    // C BLOCK TIMESLOTS -----------------------------
    
    TimeSlot* CBlockMonday = [[TimeSlot alloc] initWithWeekday:@"Monday" withStartMinute:[NSNumber numberWithInt:10*60+20] withDuration:[NSNumber numberWithInt:45]];
    
    TimeSlot* CBlockTuesday = [[TimeSlot alloc] initWithWeekday:@"Tuesday" withStartMinute:[NSNumber numberWithInt:9*60+15] withDuration:[NSNumber numberWithInt:45]];
    
    TimeSlot* CBlockWednesday = [[TimeSlot alloc] initWithWeekday:@"Wednesday" withStartMinute:[NSNumber numberWithInt:12*60+15] withDuration:[NSNumber numberWithInt:90]];
    
    TimeSlot* CBlockFriday = [[TimeSlot alloc] initWithWeekday:@"Friday" withStartMinute:[NSNumber numberWithInt:14*60+40] withDuration:[NSNumber numberWithInt:40]];
    
    // D BLOCK TIMESLOTS -----------------------------
    
    TimeSlot* DBlockMonday = [[TimeSlot alloc] initWithWeekday:@"Monday" withStartMinute:[NSNumber numberWithInt:11*60+10] withDuration:[NSNumber numberWithInt:45]];
    
    TimeSlot* DBlockTuesday = [[TimeSlot alloc] initWithWeekday:@"Tuesday" withStartMinute:[NSNumber numberWithInt:10*60+20] withDuration:[NSNumber numberWithInt:45]];
    
    TimeSlot* DBlockWednesday = [[TimeSlot alloc] initWithWeekday:@"Wednesday" withStartMinute:[NSNumber numberWithInt:13*60+50] withDuration:[NSNumber numberWithInt:90]];
    
    TimeSlot* DBlockFriday = [[TimeSlot alloc] initWithWeekday:@"Friday" withStartMinute:[NSNumber numberWithInt:8*60+25] withDuration:[NSNumber numberWithInt:40]];
    
    // E BLOCK TIMESLOTS -----------------------------
    
    TimeSlot* EBlockMonday = [[TimeSlot alloc] initWithWeekday:@"Monday" withStartMinute:[NSNumber numberWithInt:12*60+55] withDuration:[NSNumber numberWithInt:45]];
    
    TimeSlot* EBlockTuesday = [[TimeSlot alloc] initWithWeekday:@"Tuesday" withStartMinute:[NSNumber numberWithInt:11*60+10] withDuration:[NSNumber numberWithInt:45]];
    
    TimeSlot* EBlockThursday = [[TimeSlot alloc] initWithWeekday:@"Thursday" withStartMinute:[NSNumber numberWithInt:12*60+45] withDuration:[NSNumber numberWithInt:90]];
    
    TimeSlot* EBlockFriday = [[TimeSlot alloc] initWithWeekday:@"Friday" withStartMinute:[NSNumber numberWithInt:9*60+10] withDuration:[NSNumber numberWithInt:40]];
    
    // F BLOCK TIMESLOTS -----------------------------
    
    TimeSlot* FBlockMonday = [[TimeSlot alloc] initWithWeekday:@"Monday" withStartMinute:[NSNumber numberWithInt:13*60+45] withDuration:[NSNumber numberWithInt:45]];
    
    TimeSlot* FBlockTuesday = [[TimeSlot alloc] initWithWeekday:@"Tuesday" withStartMinute:[NSNumber numberWithInt:12*60+55] withDuration:[NSNumber numberWithInt:45]];
    
    TimeSlot* FBlockThursday = [[TimeSlot alloc] initWithWeekday:@"Thursday" withStartMinute:[NSNumber numberWithInt:10*60+25] withDuration:[NSNumber numberWithInt:90]];
    
    TimeSlot* FBlockFriday = [[TimeSlot alloc] initWithWeekday:@"Friday" withStartMinute:[NSNumber numberWithInt:10*60+10] withDuration:[NSNumber numberWithInt:40]];
    
    // G BLOCK TIMESLOTS -----------------------------
    
    TimeSlot* GBlockMonday = [[TimeSlot alloc] initWithWeekday:@"Monday" withStartMinute:[NSNumber numberWithInt:14*60+35] withDuration:[NSNumber numberWithInt:45]];
    
    TimeSlot* GBlockTuesday = [[TimeSlot alloc] initWithWeekday:@"Tuesday" withStartMinute:[NSNumber numberWithInt:13*60+45] withDuration:[NSNumber numberWithInt:45]];
    
    TimeSlot* GBlockThursday = [[TimeSlot alloc] initWithWeekday:@"Thursday" withStartMinute:[NSNumber numberWithInt:8*60+25] withDuration:[NSNumber numberWithInt:90]];
    
    TimeSlot* GBlockFriday = [[TimeSlot alloc] initWithWeekday:@"Friday" withStartMinute:[NSNumber numberWithInt:12*60+25] withDuration:[NSNumber numberWithInt:40]];
    
    // MORNING MEETING TIMESLOTS -----------------------------
    
    TimeSlot* MorningMeetingMonday = [[TimeSlot alloc] initWithWeekday:@"Monday" withStartMinute:[NSNumber numberWithInt:10*60+5] withDuration:[NSNumber numberWithInt:10]];
    
    TimeSlot* MorningMeetingThursday = [[TimeSlot alloc] initWithWeekday:@"Thursday" withStartMinute:[NSNumber numberWithInt:10*60+0] withDuration:[NSNumber numberWithInt:20]];
    
    // BREAK TIMESLOTS -----------------------------
    
    TimeSlot* BreakTuesday = [[TimeSlot alloc] initWithWeekday:@"Tuesday" withStartMinute:[NSNumber numberWithInt:10*60] withDuration:[NSNumber numberWithInt:20]];
    
    TimeSlot* BreakWednesday = [[TimeSlot alloc] initWithWeekday:@"Wednesday"  withStartMinute:[NSNumber numberWithInt:10*60+0] withDuration:[NSNumber numberWithInt:10]];
    
    TimeSlot* BreakFriday = [[TimeSlot alloc] initWithWeekday:@"Friday" withStartMinute:[NSNumber numberWithInt:9*60+50] withDuration:[NSNumber numberWithInt:15]];
    
    // LUNCH TIMESLOTS -----------------------------
    
    TimeSlot* LunchMonday = [[TimeSlot alloc] initWithWeekday:@"Monday" withStartMinute:[NSNumber numberWithInt:11*60+55] withDuration:[NSNumber numberWithInt:55]];
    
    TimeSlot* LunchTuesday = [[TimeSlot alloc] initWithWeekday:@"Tuesday" withStartMinute:[NSNumber numberWithInt:11*60+55] withDuration:[NSNumber numberWithInt:35]];
    
    TimeSlot* LunchWednesday = [[TimeSlot alloc] initWithWeekday:@"Wednesday" withStartMinute:[NSNumber numberWithInt:11*60+40] withDuration:[NSNumber numberWithInt:30]];
    
    TimeSlot* LunchThursday = [[TimeSlot alloc] initWithWeekday:@"Thursday" withStartMinute:[NSNumber numberWithInt:11*60+55] withDuration:[NSNumber numberWithInt:45]];
    
    TimeSlot* LunchFriday = [[TimeSlot alloc] initWithWeekday:@"Friday" withStartMinute:[NSNumber numberWithInt:11*60+35] withDuration:[NSNumber numberWithInt:45]];
    
    // ADVISING TIMESLOTS -----------------------------
    
    TimeSlot* AdvisingTuesday = [[TimeSlot alloc] initWithWeekday:@"Tuesday" withStartMinute:[NSNumber numberWithInt:12*60+30] withDuration:[NSNumber numberWithInt:20]];
    
    // PRACTICUM TIMESLOTS -----------------------------
    
    TimeSlot* PracticumThursday = [[TimeSlot alloc] initWithWeekday:@"Thursday" withStartMinute:[NSNumber numberWithInt:14*60+20] withDuration:[NSNumber numberWithInt:60]];
    
    // ASSEMBLY TIMESLOTS -----------------------------
    
    TimeSlot* AssemblyFriday = [[TimeSlot alloc] initWithWeekday:@"Friday" withStartMinute:[NSNumber numberWithInt:10*60+55] withDuration:[NSNumber numberWithInt:40]];
    
    // CREATING MUTABLE SET OF BLOCK TIMESLOTS -----------------------------
    
    NSMutableSet* ABlockTimeSlots = [[NSMutableSet alloc] initWithObjects:ABlockMonday, ABlockTuesday, ABlockWednesday, ABlockFriday, nil];
    NSMutableSet* BBlockTimeSlots = [[NSMutableSet alloc] initWithObjects:BBlockMonday, BBlockTuesday, BBlockWednesday, BBlockFriday, nil];
    NSMutableSet* CBlockTimeSlots = [[NSMutableSet alloc] initWithObjects:CBlockMonday, CBlockTuesday, CBlockWednesday, CBlockFriday, nil];
    NSMutableSet* DBlockTimeSlots = [[NSMutableSet alloc] initWithObjects:DBlockMonday, DBlockTuesday, DBlockWednesday, DBlockFriday, nil];
    NSMutableSet* EBlockTimeSlots = [[NSMutableSet alloc] initWithObjects:EBlockMonday, EBlockTuesday, EBlockThursday, EBlockFriday, nil];
    NSMutableSet* FBlockTimeSlots = [[NSMutableSet alloc] initWithObjects:FBlockMonday, FBlockTuesday, FBlockThursday, FBlockFriday, nil];
    NSMutableSet* GBlockTimeSlots = [[NSMutableSet alloc] initWithObjects:GBlockMonday, GBlockTuesday, GBlockThursday, GBlockFriday, nil];
    NSMutableSet* MorningMeetingTimeSlots = [[NSMutableSet alloc] initWithObjects:MorningMeetingMonday, MorningMeetingThursday, nil];
    NSMutableSet* BreakTimeSlots = [[NSMutableSet alloc] initWithObjects:BreakTuesday, BreakWednesday, BreakFriday, nil];
    NSMutableSet* LunchTimeSlots = [[NSMutableSet alloc] initWithObjects:LunchMonday, LunchTuesday, LunchWednesday, LunchThursday, LunchFriday, nil];
    NSMutableSet* AdvisingTimeSlots = [[NSMutableSet alloc] initWithObjects:AdvisingTuesday, nil];
    NSMutableSet* PracticumTimeSlots = [[NSMutableSet alloc] initWithObjects:PracticumThursday, nil];
    NSMutableSet* AssemblyTimeSlots = [[NSMutableSet alloc] initWithObjects:AssemblyFriday, nil];
    
    // CREATE ACTIVITY
    
    Activity* ABlock = [[Activity alloc] initWithName:@"A Block" withColor:@"Red" withTimeSlots:ABlockTimeSlots];
    Activity* BBlock = [[Activity alloc] initWithName:@"B Block" withColor:@"Purple" withTimeSlots:BBlockTimeSlots];
    Activity* CBlock = [[Activity alloc] initWithName:@"C Block" withColor:@"DarkBlue" withTimeSlots:CBlockTimeSlots];
    Activity* DBlock = [[Activity alloc] initWithName:@"D Block" withColor:@"Orange" withTimeSlots:DBlockTimeSlots];
    Activity* EBlock = [[Activity alloc] initWithName:@"E Block" withColor:@"Pink" withTimeSlots:EBlockTimeSlots];
    Activity* FBlock = [[Activity alloc] initWithName:@"F Block" withColor:@"Green" withTimeSlots:FBlockTimeSlots];
    Activity* GBlock = [[Activity alloc] initWithName:@"G Block" withColor:@"LightBlue" withTimeSlots:GBlockTimeSlots];
    Activity* MorningMeeting = [[Activity alloc] initWithName:@"Morning Meeting" withColor:@"Gray" withTimeSlots:MorningMeetingTimeSlots];
    Activity* Break = [[Activity alloc] initWithName:@"Break" withColor:@"Gray" withTimeSlots:BreakTimeSlots];
    Activity* Lunch = [[Activity alloc] initWithName:@"Lunch" withColor:@"Gray" withTimeSlots:LunchTimeSlots];
    Activity* Advising = [[Activity alloc] initWithName:@"Advising" withColor:@"Gray" withTimeSlots:AdvisingTimeSlots];
    Activity* Practicum = [[Activity alloc] initWithName:@"Practicum" withColor:@"Gray" withTimeSlots:PracticumTimeSlots];
    Activity* Assembly = [[Activity alloc] initWithName:@"Assembly" withColor:@"Gray" withTimeSlots:AssemblyTimeSlots];
    
    // CREATE MUTABLE SET "SCHEDULE"
    
    weeklySchedule = [[NSMutableSet alloc] initWithObjects:ABlock, BBlock, CBlock, DBlock, EBlock, FBlock, GBlock, MorningMeeting, Break, Lunch, Advising, Practicum, Assembly, nil];
}

@end
