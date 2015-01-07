//
//  CustomBlockNames.h
//  classy
//
//  Created by John Hartman on 1/5/15.
//  Copyright (c) 2015 Natalie Hartman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomBlockNames : NSObject
+ (NSString *)getName:(NSString *) key;
+ (void) setName:(NSString *) key withValue:(NSString*) value;
@end
