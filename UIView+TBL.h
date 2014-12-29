#import <UIKit/UIKit.h>

@interface UIView (TBL)

-(void)squareCorners;
-(void)roundCorners:(UIRectCorner)corners;
-(void)roundCorners:(UIRectCorner)corners withRadius:(CGFloat)radius;
-(void)setX:(CGFloat)newX;
-(void)setY:(CGFloat)newY;
-(void)setOrigin:(CGPoint)newOrigin;
-(void)setWidth:(CGFloat)newWidth;
-(void)setHeight:(CGFloat)newHeight;
-(void)setSize:(CGSize)newSize;

@end
