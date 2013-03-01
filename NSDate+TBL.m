//
//  NSDate+TBL.m
//  iKu
//
//  Created by Christopher Pickslay on 2/24/11.
//  Copyright 2011 Two Bit Labs. All rights reserved.
//

#import "NSDate+TBL.h"

@implementation NSDate (TBL)

// TODO: add version with format specifier
-(NSString *)timeAgo {
	NSDate *now = [NSDate date];
	double deltaMinutes = [now timeIntervalSinceDate:self] / 60.0;
	if (deltaMinutes <= 0) {
		return @"1m"; // special case for clock wonkiness
	} else if (deltaMinutes < 60) {
        return [NSString stringWithFormat:@"%dm", (int)deltaMinutes];
    } else if (deltaMinutes < (24 * 60)) {
        return [NSString stringWithFormat:@"%dh", (int)floor(deltaMinutes/60)];
    } else if (deltaMinutes < (24 * 60 * 7)) {
        return [NSString stringWithFormat:@"%dd", (int)floor(deltaMinutes/(60 * 24))];
    } else {
        return [NSString stringWithFormat:@"%dw", (int)floor(deltaMinutes/(60 * 24 * 7))];
    } 
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
