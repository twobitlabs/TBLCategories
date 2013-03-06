//
//  NSDateFormatter+TBL.m
//  Thread safe reusable NSDateFormatter based on this post http://mobile.dzone.com/news/ios-threadsafe-date-formatting
//
//  Created by Todd Huss on 12/13/12.
//

#import "NSDateFormatter+TBL.h"

@implementation NSDateFormatter (TBL)

+(NSDateFormatter *)dateFormatterWithFormat:(NSString *)format {
    return [self dateFormatterWithFormat:format timeZone:nil];
}

+(NSDateFormatter *)dateFormatterWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone {
    if (timeZone == nil) timezone = [NSTimeZone localTimeZone];
    if (IsEmpty(format)) return nil;
    NSString *key = [NSString stringWithFormat:@"NSDateFormatter-%@-%@", [timeZone abbreviation], format];
    NSMutableDictionary* dictionary = [[NSThread currentThread] threadDictionary];
    NSDateFormatter* dateFormatter = [dictionary objectForKey:key];
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeZone:timeZone];
        [dateFormatter setDateFormat:format];
        [dictionary setObject:dateFormatter forKey:key];
    }
    return dateFormatter;
}

+(NSDateFormatter *)dateFormatterWithFormat:(NSString *)format timezone:(NSString *)timezone {
    if (IsEmpty(timezone)) timezone = @"UTC";
    if (IsEmpty(format)) return nil;
    NSString *key = [NSString stringWithFormat:@"NSDateFormatter-%@-%@", timezone, format];
    NSMutableDictionary* dictionary = [[NSThread currentThread] threadDictionary];
    NSDateFormatter* dateFormatter = [dictionary objectForKey:key];
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        NSTimeZone *timeZone = [NSTimeZone timeZoneWithAbbreviation:timezone];
        [dateFormatter setTimeZone:timeZone];
        [dateFormatter setDateFormat:format];
        [dictionary setObject:dateFormatter forKey:key];
    }
    return dateFormatter;
}

+(NSDateFormatter *)dateFormatterWithDateStyle:(NSDateFormatterStyle)style {
    return [self dateFormatterWithDateStyle:style timeZone:nil];
}

+(NSDateFormatter *)dateFormatterWithDateStyle:(NSDateFormatterStyle)style timeZone:(NSTimeZone *)timeZone {
    if (timeZone == nil) timeZone = [NSTimeZone localTimeZone];
    NSString *key = [NSString stringWithFormat:@"NSDateFormatter-%@-dateStyle-%d", [timeZone abbreviation], style];
    NSMutableDictionary* dictionary = [[NSThread currentThread] threadDictionary];
    NSDateFormatter* dateFormatter = [dictionary objectForKey:key];
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeZone:timeZone];
        [dateFormatter setDateStyle:style];
        [dictionary setObject:dateFormatter forKey:key];
    }
    return dateFormatter;
}

+(NSDateFormatter *)dateFormatterWithDateStyle:(NSDateFormatterStyle)style timezone:(NSString *)timezone {
    if (IsEmpty(timezone)) timezone = @"UTC";
    NSString *key = [NSString stringWithFormat:@"NSDateFormatter-%@-dateStyle-%d", timezone, style];
    NSMutableDictionary* dictionary = [[NSThread currentThread] threadDictionary];
    NSDateFormatter* dateFormatter = [dictionary objectForKey:key];
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        NSTimeZone *timeZone = [NSTimeZone timeZoneWithAbbreviation:timezone];
        [dateFormatter setTimeZone:timeZone];
        [dateFormatter setDateStyle:style];
        [dictionary setObject:dateFormatter forKey:key];
    }
    return dateFormatter;
}

+(NSDateFormatter *)dateFormatterWithTimeStyle:(NSDateFormatterStyle)style {
    return [self dateFormatterWithTimeStyle:style timeZone:nil];
}

+(NSDateFormatter *)dateFormatterWithTimeStyle:(NSDateFormatterStyle)style timeZone:(NSTimeZone *)timeZone {
    if (timeZone == nil) timezone = [NSTimeZone localTimeZone];
    NSString *key = [NSString stringWithFormat:@"NSDateFormatter-%@-timeStyle-%d", [timeZone abbreviation], style];
    NSMutableDictionary* dictionary = [[NSThread currentThread] threadDictionary];
    NSDateFormatter* dateFormatter = [dictionary objectForKey:key];
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeZone:timeZone];
        [dateFormatter setDateStyle:style];
        [dictionary setObject:dateFormatter forKey:key];
    }
    return dateFormatter;
}

+(NSDateFormatter *)dateFormatterWithTimeStyle:(NSDateFormatterStyle)style timezone:(NSString *)timezone {
    if (IsEmpty(timezone)) timezone = @"UTC";
    NSString *key = [NSString stringWithFormat:@"NSDateFormatter-%@-timeStyle-%d", timezone, style];
    NSMutableDictionary* dictionary = [[NSThread currentThread] threadDictionary];
    NSDateFormatter* dateFormatter = [dictionary objectForKey:key];
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        NSTimeZone *timeZone = [NSTimeZone timeZoneWithAbbreviation:timezone];
        [dateFormatter setTimeZone:timeZone];
        [dateFormatter setTimeStyle:style];
        [dictionary setObject:dateFormatter forKey:key];
    }
    return dateFormatter;
}

@end
