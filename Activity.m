//
//  Activity.m
//  Classy
//
//  Created by Natalie Hartman on 4/5/14.
//  Copyright (c) 2014-2018 Natalie Hartman. All rights reserved.
//

#import "Activity.h"

@implementation Activity

- (id) initWithName:(NSString*)name
    withDisplayName: (NSString *) displayName
    withColor:(NSString*)color
    withTimeSlots:(NSMutableSet*)timeSlots {
    
    self.name = name;
    self.displayName = [[NSMutableString alloc] initWithString:displayName];
    self.color = color;
    self.timeSlots = timeSlots;
    
    return self;
}

@end
