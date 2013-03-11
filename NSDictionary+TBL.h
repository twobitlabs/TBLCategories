//
//  NSDictionary+TBL.h
//  TeamStream
//
//  Created by Todd Huss on 3/11/13.
//  Copyright (c) 2013 Two Bit Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (TBL)

-(id)objectForKey:(id)aKey kindOfClass:(Class)aClass;
-(BOOL)boolForKey:(id)aKey defaultValue:(BOOL)defaultValue;
-(NSNumber *)numberForKey:(id)aKey;
-(NSString *)stringForKey:(id)aKey;
-(NSString *)stringOrEmptyStringForKey:(id)aKey;
-(NSString *)stringOrNilIfEmptyStringForKey:(id)aKey;
-(NSString *)stringFromObjectForKey:(id)aKey;
-(NSString *)stringFromObjectOrEmptyStringForKey:(id)aKey;
-(NSArray *)arrayForKey:(id)aKey;
-(NSDictionary *)dictionaryForKey:(id)aKey;

@end
