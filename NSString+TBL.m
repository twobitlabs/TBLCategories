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

@end