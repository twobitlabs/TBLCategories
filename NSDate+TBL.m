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
	double deltaMinutes = fabs([self timeIntervalSinceDate:now]) / 60.0f;
	if (deltaMinutes <= 0) {
		return @"1m"; // special case for clock wonkiness
	} else if (deltaMinutes < 60) {
        return [NSString stringWithFormat:@"%dm", deltaMinutes];
    } else if (deltaMinutes < (24 * 60)) {
        return [NSString stringWithFormat:@"%dh", (int)floor(deltaMinutes/60)];
    } else if (deltaMinutes < (24 * 60 * 7)) {
        return [NSString stringWithFormat:@"%dd", (int)floor(deltaMinutes/(60 * 24))];
    } else {
        return [NSString stringWithFormat:@"%dw", (int)floor(deltaMinutes/(60 * 24 * 7))];
    } 
}

@end
