#import "NSDictionary+TBL.h"

@implementation NSDictionary (TBL)

-(id _Nullable)objectForKey:(id _Nonnull)aKey kindOfClass:(Class _Nonnull)aClass {
    id object = [self objectForKey:aKey];
    if (![object isKindOfClass:aClass]) {
        return nil;
    }
    return object;
}

-(BOOL)boolForKey:(id _Nonnull)aKey defaultValue:(BOOL)defaultValue {
    NSNumber *numValue = [self numberForKey:aKey];
    if (numValue == nil) {
        return defaultValue;
    }
    return [numValue boolValue];
}

-(NSNumber * _Nullable)numberForKey:(id _Nonnull)aKey {
    return [self objectForKey:aKey kindOfClass:[NSNumber class]];
}

-(NSString * _Nullable)stringForKey:(id _Nonnull)aKey {
    return [self objectForKey:aKey kindOfClass:[NSString class]];
}

-(NSString * _Nonnull)stringOrEmptyStringForKey:(id _Nonnull)aKey {
    NSString *aString = [self stringForKey:aKey];
    if (aString == nil) {
        return @"";
    }
    return aString;
}

-(NSString * _Nullable)stringOrNilIfEmptyStringForKey:(id _Nonnull)aKey {
    NSString *aString = [self stringForKey:aKey];
    if (aString != nil && [aString length] == 0) {
        return nil;
    }
    return aString;
}

// converts the underlying object to a string or returns nil
-(NSString * _Nullable)stringFromObjectForKey:(id _Nonnull)aKey {
    id object = [self objectForKey:aKey];
	if (object == nil || [object isEqual:[NSNull null]]) {
		return nil;
	} else if ([object isKindOfClass:[NSString class]]) {
		return object;
	} else if ([object respondsToSelector:@selector(stringValue)]){
		return [object stringValue];
	}
    return [object description];
}

// converts the underlying object to a string or empty string, never nil
-(NSString * _Nonnull)stringFromObjectOrEmptyStringForKey:(id _Nonnull)aKey {
    NSString *aString = [self stringFromObjectForKey:aKey];
    if (aString == nil) {
        return @"";
    }
    return aString;
}

-(NSArray * _Nullable)arrayForKey:(id _Nonnull)aKey {
    return [self objectForKey:aKey kindOfClass:[NSArray class]];
}

-(NSDictionary * _Nullable)dictionaryForKey:(id _Nonnull)aKey {
    return [self objectForKey:aKey kindOfClass:[NSDictionary class]];
}

@end
