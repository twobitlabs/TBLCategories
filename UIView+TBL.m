//
//  UIView+TBL.m
//  TeamStream
//
//  Created by Susan Detwiler on 5/21/12.
//  Copyright (c) 2012 Bleacher Report. All rights reserved.
//

#import "UIView+TBL.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (TBL)

-(void)roundCorners:(UIRectCorner)corners withRadius:(CGFloat)radius {
    if (corners == UIRectCornerAllCorners) {
        self.layer.cornerRadius = radius;
    } else {
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        UIBezierPath *roundedPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                          byRoundingCorners:corners
                                                                cornerRadii:CGSizeMake(radius, radius)];
        maskLayer.fillColor = [[UIColor whiteColor] CGColor];
        maskLayer.backgroundColor = [[UIColor clearColor] CGColor];
        maskLayer.path = [roundedPath CGPath];
        self.layer.mask = maskLayer;
    }
}

-(void)roundCorners:(UIRectCorner)corners {
    [self roundCorners:corners withRadius:8];
}

-(void)setX:(CGFloat)newX {
    CGRect frame = self.frame;
    self.frame = CGRectMake(newX, frame.origin.y, frame.size.width, frame.size.height);
}

-(void)setY:(CGFloat)newY {
    CGRect frame = self.frame;
    self.frame = CGRectMake(frame.origin.x, newY, frame.size.width, frame.size.height);
}

-(void)setWidth:(CGFloat)newWidth {
    CGRect frame = self.frame;
    self.frame = CGRectMake(frame.origin.x, frame.origin.y, newWidth, frame.size.height);
}

-(void)setHeight:(CGFloat)newHeight {
    CGRect frame = self.frame;
    self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, newHeight);
}

@end