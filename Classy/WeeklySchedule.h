//
//  WeeklySchedule.h
//  Classy
//
//  Created by Natalie Hartman on 4/10/14.
//  Copyright (c) 2014-2018 Natalie Hartman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeeklySchedule : NSObject

+ (void) initialize;

+ (NSArray*) dailySchedule:(NSString*)forWeekday;

@end
