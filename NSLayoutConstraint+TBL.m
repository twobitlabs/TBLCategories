#import "NSLayoutConstraint+TBL.h"

@implementation NSLayoutConstraint (TBL)

+(NSArray *)constraintsWithVisualFormat:(NSString *)format views:(NSDictionary *)views {
    return [NSLayoutConstraint constraintsWithVisualFormat:format options:0 views:views];
}

+(NSArray *)constraintsWithVisualFormats:(NSArray *)formats metrics:(NSDictionary *)metrics views:(NSDictionary *)views {
    NSMutableArray *constraints = [NSMutableArray array];
    for (NSString *format in formats) {
        [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:format metrics:metrics views:views]];
    }
    return constraints;
}

+(NSArray *)constraintsWithVisualFormats:(NSArray *)formats views:(NSDictionary *)views {
    return [self constraintsWithVisualFormats:formats metrics:nil views:views];
}

+(NSArray *)constraintsWithVisualFormat:(NSString *)format metrics:(NSDictionary *)metrics views:(NSDictionary *)views {
    return [NSLayoutConstraint constraintsWithVisualFormat:format options:0 metrics:metrics views:views];
}

+(NSArray *)constraintsWithVisualFormat:(NSString *)format options:(NSLayoutFormatOptions)opts views:(NSDictionary *)views {
    return [NSLayoutConstraint constraintsWithVisualFormat:format options:opts metrics:nil views:views];
}

@end
