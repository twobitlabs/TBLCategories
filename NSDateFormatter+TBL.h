//
//  NSDateFormatter+TBL.h
//  Thread safe reusable NSDateFormatter based on this post http://mobile.dzone.com/news/ios-threadsafe-date-formatting
//
//  Created by Todd Huss on 12/13/12.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (TBL)

+(NSDateFormatter *)dateFormatterWithFormat:(NSString *)format;
+(NSDateFormatter *)dateFormatterWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone;
+(NSDateFormatter *)dateFormatterWithFormat:(NSString *)format timezone:(NSString *)timezone __attribute__((deprecated));
+(NSDateFormatter *)dateFormatterWithDateStyle:(NSDateFormatterStyle)style;
+(NSDateFormatter *)dateFormatterWithDateStyle:(NSDateFormatterStyle)style timeZone:(NSTimeZone *)timeZone;
+(NSDateFormatter *)dateFormatterWithDateStyle:(NSDateFormatterStyle)style timezone:(NSString *)timezone __attribute__((deprecated));
+(NSDateFormatter *)dateFormatterWithTimeStyle:(NSDateFormatterStyle)style;
+(NSDateFormatter *)dateFormatterWithTimeStyle:(NSDateFormatterStyle)style timeZone:(NSTimeZone *)timeZone;
+(NSDateFormatter *)dateFormatterWithTimeStyle:(NSDateFormatterStyle)style timezone:(NSString *)timezone __attribute__((deprecated));

@end
