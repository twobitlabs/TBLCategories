#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (TBL)

+(NSArray *)constraintsWithVisualFormat:(NSString *)format views:(NSDictionary *)views;
+(NSArray *)constraintsWithVisualFormats:(NSArray *)formats views:(NSDictionary *)views;
+(NSArray *)constraintsWithVisualFormats:(NSArray *)formats metrics:(NSDictionary *)metrics views:(NSDictionary *)views;
+(NSArray *)constraintsWithVisualFormat:(NSString *)format metrics:(NSDictionary *)metrics views:(NSDictionary *)views;
+(NSArray *)constraintsWithVisualFormat:(NSString *)format options:(NSLayoutFormatOptions)opts views:(NSDictionary *)views;

@end
