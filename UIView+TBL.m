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

-(void)roundCorners:(UIRectCorner)corners{
    if (corners == UIRectCornerAllCorners) {
        self.layer.cornerRadius = 8;
    } else {
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        UIBezierPath *roundedPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                          byRoundingCorners:corners
                                                                cornerRadii:CGSizeMake(8,8)];
        maskLayer.fillColor = [[UIColor whiteColor] CGColor];
        maskLayer.backgroundColor = [[UIColor clearColor] CGColor];
        maskLayer.path = [roundedPath CGPath];
        self.layer.mask = maskLayer;
    }
}

@end
