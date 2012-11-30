@interface NSString (TBL)

-(NSString *)stringByTruncatingStringWithFont_tbl:(UIFont *)font forSize:(CGSize)size lineBreakMode:(UILineBreakMode)lineBreakMode;
-(BOOL)containsString:(NSString *)subString;
-(BOOL)validEmailAddress;
-(BOOL)validPhoneNumber;

@end