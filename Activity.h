//
//  Activity.h
//  Classy
//
//  Created by Natalie Hartman on 4/5/14.
//  Copyright (c) 2014 Natalie Hartman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Activity : NSObject

@property NSString *name;
@property NSString *color;
@property NSMutableSet *timeSlots;

- (id) initWithName:(NSString*)name
          withColor:(NSString*)color
      withTimeSlots:(NSMutableSet*)timeSlots;

@end
