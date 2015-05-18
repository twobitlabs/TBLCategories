#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (TBL)

-(NSString *)stringByTruncatingStringWithFont_tbl:(UIFont *)font forSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;
-(BOOL)containsString:(NSString *)subString;
-(BOOL)validEmailAddress;
-(BOOL)validPhoneNumber;

@end