//
//  TimeSlot.h
//  Classy
//
//  Created by Natalie Hartman on 4/5/14.
//  Copyright (c) 2014-2018 Natalie Hartman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeSlot : NSObject

@property NSString *weekday;
@property NSNumber *startMinute;
@property NSNumber *duration;

- (id) initWithWeekday:(NSString*)weekday
       withStartMinute:(NSNumber*)startMinute
          withDuration:(NSNumber*)duration;

@end
