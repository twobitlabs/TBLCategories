//
//  NSDate+TBL.m
//  iKu
//
//  Created by Christopher Pickslay on 2/24/11.
//  Copyright 2011 Two Bit Labs. All rights reserved.
//

#import "NSDate+TBL.h"

@implementation NSDate (TBL)

-(NSString *)timeAgo {
    return [self timeAgoWithSeconds:NO];
}

-(NSString *)timeAgoWithSeconds {
    return [self timeAgoWithSeconds:YES];
}

// TODO: add version with format specifier
-(NSString *)timeAgoWithSeconds:(BOOL)withSeconds {
	NSDate *now = [NSDate date];
    double deltaSeconds = [now timeIntervalSinceDate:self];
	if (deltaSeconds <= 0) {
		return (withSeconds ? @"1s" : @"1m"); // special case for clock wonkiness
    } else if (deltaSeconds < 60) {
        if (withSeconds) {
            return [NSString stringWithFormat:@"%ds", (int)deltaSeconds];
        } else {
            return @"0m";
        }
	} else if (deltaSeconds < (60 * 60)) {
        return [NSString stringWithFormat:@"%dm", (int)floor(deltaSeconds/60)];
    } else if (deltaSeconds < (24 * 60 * 60)) {
        return [NSString stringWithFormat:@"%dh", (int)floor(deltaSeconds/(60 * 60))];
    } else if (deltaSeconds < (7 * 24 * 60 * 60)) {
        return [NSString stringWithFormat:@"%dd", (int)floor(deltaSeconds/(24 * 60 * 60))];
    } else {
        return [NSString stringWithFormat:@"%dw", (int)floor(deltaSeconds/(7 * 24 * 60 * 60))];
    } 
}

-(BOOL)isNewerThanDate:(NSDate *)aDate {
    return [self compare:aDate] == NSOrderedDescending;
}

-(BOOL)isOlderThanDate:(NSDate *)aDate {
    return [self compare:aDate] == NSOrderedAscending;
}

-(BOOL)isOlderThanDaysSinceNow:(NSTimeInterval)days {
    return [self isOlderThanMinutesSinceNow:days * 24 * 60];
}

-(BOOL)isNewerThanDaysSinceNow:(NSTimeInterval)days {
    return [self isNewerThanMinutesSinceNow:days * 24 * 60];
}

-(BOOL)isOlderThanHoursSinceNow:(NSTimeInterval)hours {
    return [self isOlderThanMinutesSinceNow:hours * 60];
}

-(BOOL)isNewerThanHoursSinceNow:(NSTimeInterval)hours {
    return [self isNewerThanMinutesSinceNow:hours * 60];
}

-(BOOL)isOlderThanMinutesSinceNow:(NSTimeInterval)min {
    return self.timeIntervalSinceNow < min * 60;
}

-(BOOL)isNewerThanMinutesSinceNow:(NSTimeInterval)min {
    return self.timeIntervalSinceNow > min * 60;
}

-(BOOL)isToday{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:[NSDate date]];
    NSDate *today = [calendar dateFromComponents:components];
    components = [calendar components:(NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:self];
    NSDate *fakeSelfDate = [calendar dateFromComponents:components];
    
    if([today isEqualToDate:fakeSelfDate]) {
        return YES;
    }
    return NO;
}

-(BOOL)isTomorrow{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:[NSDate date]];
    NSDate *today = [calendar dateFromComponents:components];
    components = [calendar components:(NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:self];
    NSDate *fakeSelfDate = [calendar dateFromComponents:components];
    
    if([today timeIntervalSinceDate:fakeSelfDate] == -60*60*24) {
        return YES;
    }
    return NO;
}

@end
