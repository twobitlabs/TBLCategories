//
//  NSArray+TBL.h
//  TeamStream
//
//  Created by Todd Huss on 3/11/13.
//  Copyright (c) 2013 Two Bit Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (TBL)

-(id)objectAtIndex:(NSUInteger)index kindOfClass:(Class)aClass;
-(BOOL)boolAtIndex:(NSUInteger)index defaultValue:(BOOL)defaultValue;
-(NSNumber *)numberAtIndex:(NSUInteger)index;
-(NSString *)stringAtIndex:(NSUInteger)index;
-(NSString *)stringOrEmptyStringAtIndex:(NSUInteger)index;
-(NSString *)stringOrNilIfEmptyStringAtIndex:(NSUInteger)index;
-(NSString *)stringFromObjectAtIndex:(NSUInteger)index;
-(NSString *)stringFromObjectOrEmptyStringAtIndex:(NSUInteger)index;
-(NSArray *)arrayAtIndex:(NSUInteger)index;
-(NSDictionary *)dictionaryAtIndex:(NSUInteger)index;
-(NSArray *)subarrayFromIndex:(NSUInteger)index;
-(NSArray *)subarrayToIndex:(NSUInteger)index;
-(void)each:(void (^)(id thing))blockToExecute;

@end
