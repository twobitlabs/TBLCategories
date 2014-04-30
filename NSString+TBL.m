#import "NSString+TBL.h"
#import "Availability.h"

@implementation NSString (TBL)

-(NSString *)stringByTruncatingStringWithFont_tbl:(UIFont *)font forSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode {
	NSString *ellipsis = @"…";
	
#if __has_feature(objc_arc)
    NSMutableString *resultString = [self mutableCopy];
#else
    NSMutableString *resultString = [[self mutableCopy] autorelease];
#endif

    NSRange range = NSMakeRange(resultString.length - 1, 1);

    CGSize fixedWidth = CGSizeMake(size.width, CGFLOAT_MAX);

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    while ([resultString boundingRectWithSize:fixedWidth
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:@{NSFontAttributeName:font} context:nil].size.height > size.height && range.location > 0) {
#else
    while ([resultString sizeWithFont:font constrainedToSize:fixedWidth lineBreakMode:lineBreakMode].height > size.height && range.location > 0) {
#endif
        // delete the last character
        [resultString deleteCharactersInRange:range];
        range.location--;

		// delete trailing whitespace and punctuation
		while (range.location > 0 && (
			[[NSCharacterSet punctuationCharacterSet] characterIsMember:[resultString characterAtIndex:(range.location - 1)]] ||
			[[NSCharacterSet whitespaceAndNewlineCharacterSet] characterIsMember:[resultString characterAtIndex:(range.location - 1)]]
			)) {
			range.location--;
		    [resultString deleteCharactersInRange:range];
		}
		
        // replace the last character with an ellipsis
        [resultString replaceCharactersInRange:range withString:ellipsis];
    }

    return resultString;
}

-(BOOL)containsString:(NSString *)subString {
    return [self rangeOfString:subString].location != NSNotFound;
}

-(BOOL)validEmailAddress {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

-(BOOL)validPhoneNumber {
    // First make sure the only characters present are 0-9 ( ) - and space
    NSString *phoneRegex = @"^[0-9\\(\\)\\- ]+$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    if (![phoneTest evaluateWithObject:self]) return NO;
    
    // Make sure the number contains 10 digits
    NSMutableString *strippedString = [NSMutableString stringWithCapacity:10];
    for (int i=0; i<[self length]; i++) {
        if (isdigit([self characterAtIndex:i])) {
            [strippedString appendFormat:@"%c",[self characterAtIndex:i]];
        }
    }
    return strippedString.length == 10;
}

@end