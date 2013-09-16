//
//  NSNumberFormatter+TBL.m
//  Thread safe reusable NSNumberFormatter
//
//

#import "NSNumberFormatter+TBL.h"

@implementation NSNumberFormatter (TBL)

+(NSNumberFormatter *)simpleNumberFormatter {
    NSMutableDictionary* dictionary = [[NSThread currentThread] threadDictionary];
    NSNumberFormatter* numberFormatter = [dictionary objectForKey:@"NSNumberFormatter"];
    if (dateFormatter == nil) {
        numberFormatter = [[NSNumberFormatter alloc] init];
        [dictionary setObject:numberFormatter forKey:key];
    }
    return numberFormatter;
}