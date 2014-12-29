#import <UIKit/UIKit.h>

@interface UIButton (TBL)

-(void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state;
-(UIColor*)backgroundColorForState:(UIControlState)state;

@end
