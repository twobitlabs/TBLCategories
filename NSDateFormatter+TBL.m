//
//  NSDateFormatter+TBL.m
//  TeamStream
//
//  Created by Todd Huss on 12/13/12.
//  Copyright (c) 2012 Bleacher Report. All rights reserved.
//

#import "NSDateFormatter+TBL.h"

@implementation NSDateFormatter (TBL)

+(NSDateFormatter *)dateFormatterWithFormat:(NSString *)format {
    return [self dateFormatterWithFormat:format timezone:nil];
}

// Thread safe NSDateFormatter based on this post http://mobile.dzone.com/news/ios-threadsafe-date-formatting
+(NSDateFormatter *)dateFormatterWithFormat:(NSString *)format timezone:(NSString *)timezone {
    if (IsEmpty(timezone)) timezone = @"UTC";
    if (IsEmpty(format)) return nil;
    NSString *key = [NSString stringWithFormat:@"%@-%@", timezone, format];
    NSMutableDictionary* dictionary = [[NSThread currentThread] threadDictionary];
    NSDateFormatter* dateFormatter = [dictionary objectForKey:key];
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:timezone];
        [dateFormatter setTimeZone:timeZone];
        [dateFormatter setDateFormat:format];
        [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US.POSIX"]];
        [dictionary setObject:dateFormatter forKey:key];
    }
    return dateFormatter;
}

@end
