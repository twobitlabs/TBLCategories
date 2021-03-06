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
-(id)randomObject;
-(void)each:(void (^)(id thing))blockToExecute;
-(void)eachKindOfClass:(Class)aClass block:(void (^)(id thing))blockToExecute;
-(void)eachNumber:(void (^)(NSNumber *thing))blockToExecute;
-(void)eachString:(void (^)(NSString *thing))blockToExecute;
-(void)eachArray:(void (^)(NSArray *thing))blockToExecute;
-(void)eachDictionary:(void (^)(NSDictionary *thing))blockToExecute;

@end
