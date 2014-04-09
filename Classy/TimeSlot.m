//
//  TimeSlot.m
//  Classy
//
//  Created by Natalie Hartman on 4/5/14.
//  Copyright (c) 2014 Natalie Hartman. All rights reserved.
//

#import "TimeSlot.h"

@implementation TimeSlot

- (id) initWithWeekday:(NSString *)weekday withStartMinute:(NSNumber *)startMinute withDuration:(NSNumber *)duration {
    
    self.weekday = weekday;
    self.startMinute = startMinute;
    self.duration = duration;
    
    return self;
    
}

@end