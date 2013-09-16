//
//  NSNumberFormatter+TBL.m
//  Thread safe reusable NSNumberFormatter
//
//

#import "NSNumberFormatter+TBL.h"

@implementation NSNumberFormatter (TBL)

+(NSNumberFormatter *)simpleNumberFormatter {
    NSMutableDictionary* dictionary = [[NSThread currentThread] threadDictionary];
    NSString *key = @"NSNumberFormatter";
    NSNumberFormatter* numberFormatter = [dictionary objectForKey:key];
    if (numberFormatter == nil) {
        numberFormatter = [[NSNumberFormatter alloc] init];
        [dictionary setObject:numberFormatter forKey:key];
    }
    return numberFormatter;
}

@end