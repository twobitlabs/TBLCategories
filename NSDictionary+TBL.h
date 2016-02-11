#import <Foundation/Foundation.h>

@interface NSDictionary (TBL)

-(id _Nullable)objectForKey:(id _Nonnull)aKey kindOfClass:(Class _Nonnull)aClass;
-(BOOL)boolForKey:(id _Nonnull)aKey defaultValue:(BOOL)defaultValue;
-(NSNumber * _Nullable)numberForKey:(id _Nonnull)aKey;
-(NSString * _Nullable)stringForKey:(id _Nonnull)aKey;
-(NSString * _Nonnull)stringOrEmptyStringForKey:(id _Nonnull)aKey;
-(NSString * _Nullable)stringOrNilIfEmptyStringForKey:(id _Nonnull)aKey;
-(NSString * _Nullable)stringFromObjectForKey:(id _Nonnull)aKey;
-(NSString * _Nonnull)stringFromObjectOrEmptyStringForKey:(id _Nonnull)aKey;
-(NSArray * _Nullable)arrayForKey:(id _Nonnull)aKey;
-(NSDictionary * _Nullable)dictionaryForKey:(id _Nonnull)aKey;

@end
