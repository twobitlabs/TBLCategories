//
//  NSDate+TBL.h
//  iKu
//
//  Created by Christopher Pickslay on 2/24/11.
//  Copyright 2011 Two Bit Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (TBL)

-(NSString *)timeAgo;
-(NSString *)timeAgoWithSeconds;
-(BOOL)isNewerThanDate:(NSDate *)aDate;
-(BOOL)isOlderThanDate:(NSDate *)aDate;
-(BOOL)isOlderThanDaysSinceNow:(NSTimeInterval)days;
-(BOOL)isNewerThanDaysSinceNow:(NSTimeInterval)days;
-(BOOL)isOlderThanHoursSinceNow:(NSTimeInterval)hours;
-(BOOL)isNewerThanHoursSinceNow:(NSTimeInterval)hours;
-(BOOL)isOlderThanMinutesSinceNow:(NSTimeInterval)min;
-(BOOL)isNewerThanMinutesSinceNow:(NSTimeInterval)min;
-(BOOL)isToday;
-(BOOL)isTomorrow;

@end
