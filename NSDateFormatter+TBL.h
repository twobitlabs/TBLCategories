//
//  NSDateFormatter+TBL.h
//  TeamStream
//
//  Created by Todd Huss on 12/13/12.
//  Copyright (c) 2012 Bleacher Report. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (TBL)

+(NSDateFormatter *)dateFormatterWithFormat:(NSString *)format;
+(NSDateFormatter *)dateFormatterWithFormat:(NSString *)format timezone:(NSString *)timezone;
+(NSDateFormatter *)dateFormatterWithDateStyle:(NSDateFormatterStyle)style;
+(NSDateFormatter *)dateFormatterWithDateStyle:(NSDateFormatterStyle)style timezone:(NSString *)timezone;
+(NSDateFormatter *)dateFormatterWithTimeStyle:(NSDateFormatterStyle)style;
+(NSDateFormatter *)dateFormatterWithTimeStyle:(NSDateFormatterStyle)style timezone:(NSString *)timezone;

@end
