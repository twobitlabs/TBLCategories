#import "NSDictionary+TBL.h"

@implementation NSDictionary (TBL)

-(id)objectForKey:(id)aKey kindOfClass:(Class)aClass {
    id object = [self objectForKey:aKey];
    if (![object isKindOfClass:aClass]) {
        return nil;
    }
    return object;
}

-(BOOL)boolForKey:(id)aKey defaultValue:(BOOL)defaultValue {
    NSNumber *numValue = [self numberForKey:aKey];
    if (numValue == nil) {
        return defaultValue;
    }
    return [numValue boolValue];
}

-(NSNumber *)numberForKey:(id)aKey {
    return [self objectForKey:aKey kindOfClass:[NSNumber class]];
}

-(NSString *)stringForKey:(id)aKey {
    return [self objectForKey:aKey kindOfClass:[NSString class]];
}

-(NSString *)stringOrEmptyStringForKey:(id)aKey {
    NSString *aString = [self stringForKey:aKey];
    if (aString == nil) {
        return @"";
    }
    return aString;
}

-(NSString *)stringOrNilIfEmptyStringForKey:(id)aKey {
    NSString *aString = [self stringForKey:aKey];
    if (aString != nil && [aString length] == 0) {
        return nil;
    }
    return aString;
}

// converts the underlying object to a string or returns nil
-(NSString *)stringFromObjectForKey:(id)aKey {
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
-(NSString *)stringFromObjectOrEmptyStringForKey:(id)aKey {
    NSString *aString = [self stringFromObjectForKey:aKey];
    if (aString == nil) {
        return @"";
    }
    return aString;
}


-(NSArray *)arrayForKey:(id)aKey {
    return [self objectForKey:aKey kindOfClass:[NSArray class]];
}

-(NSDictionary *)dictionaryForKey:(id)aKey {
    return [self objectForKey:aKey kindOfClass:[NSDictionary class]];
}

@end
