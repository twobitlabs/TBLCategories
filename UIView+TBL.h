//
//  UIView+TBL.h
//  TeamStream
//
//  Created by Susan Detwiler on 5/21/12.
//  Copyright (c) 2012 Bleacher Report. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TBL)

-(void)roundCorners:(UIRectCorner)corners;
-(void)roundCorners:(UIRectCorner)corners withRadius:(CGFloat)radius;
-(void)setX:(CGFloat)newX;
-(void)setY:(CGFloat)newY;
-(void)setWidth:(CGFloat)newWidth;
-(void)setHeight:(CGFloat)newHeight;

@end
