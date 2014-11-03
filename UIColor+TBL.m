#import "UIColor+TBL.h"

@implementation UIColor (TBL)

+ (UIColor *)parseColorValueFromHexString:(NSString *)hexString {
    NSScanner *colorScanner = [NSScanner scannerWithString:hexString];
    NSRange hashLocation = [hexString rangeOfString:@"#"];
    if (hashLocation.location != NSNotFound) {
        [colorScanner setScanLocation:hashLocation.location + 1];
    }
    unsigned int value = 0;
    //scanHexInt: returns YES if valid hex is found
    if ([colorScanner scanHexInt:&value])
        return [UIColor colorWithRed:((float)((value & 0xFF0000) >> 16))/255.0 green:((float)((value & 0xFF00) >> 8))/255.0 blue:((float)(value & 0xFF))/255.0 alpha:1.0];
    //if hex was invalid, return NO
    return nil;
}

@end