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
-(BOOL)isSoonerThanDaysFromNow:(NSTimeInterval)days;

@end
