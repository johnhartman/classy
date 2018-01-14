//
//  CustomBlockNames.m
//  classy
//
//  Created by John Hartman on 1/5/15.
//  Copyright (c) 2014-2018 Natalie Hartman. All rights reserved.
//

#import "CustomBlockNames.h"
static NSDictionary *customBlockNames;

@implementation CustomBlockNames
+ (NSString *)getName:(NSString *) key
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *customBlockNamesPath = [documentsDirectory stringByAppendingPathComponent:@"customBlockNames.dat"];
    NSMutableDictionary *customBlockNames = [[NSMutableDictionary alloc] initWithContentsOfFile: customBlockNamesPath];
    if(customBlockNames == nil) return nil;
    return [customBlockNames objectForKey:key];
}

+ (void) setName:(NSString *) key withValue:(NSString*) value
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *customBlockNamesPath = [documentsDirectory stringByAppendingPathComponent:@"customBlockNames.dat"];
    NSMutableDictionary *customBlockNames = [[NSMutableDictionary alloc ] initWithContentsOfFile: customBlockNamesPath];

    if(customBlockNames == nil) customBlockNames = [[NSMutableDictionary alloc] init];

    [customBlockNames setObject:value forKey: key];
    [customBlockNames writeToFile:customBlockNamesPath atomically:YES];
}
@end
