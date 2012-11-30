#import "NSString+TBL.h"

@implementation NSString (TBL)

-(NSString *)stringByTruncatingStringWithFont_tbl:(UIFont *)font forSize:(CGSize)size lineBreakMode:(UILineBreakMode)lineBreakMode {
	NSString *ellipsis = @"…";
	
#if __has_feature(objc_arc)
    NSMutableString *resultString = [self mutableCopy];
#else
    NSMutableString *resultString = [[self mutableCopy] autorelease];
#endif

    NSRange range = NSMakeRange(resultString.length - 1, 1);

    CGSize fixedWidth = CGSizeMake(size.width, CGFLOAT_MAX);
    while ([resultString sizeWithFont:font constrainedToSize:fixedWidth lineBreakMode:lineBreakMode].height > size.height) {
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
    NSString *phoneRegex = @"[235689][0-9]{6}([0-9]{3})?";
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [test evaluateWithObject:self];
}

@end