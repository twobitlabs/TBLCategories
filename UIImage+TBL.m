//
//  UIImage+TBL.m
//  TeamStream
//
//  Created by Todd Huss on 3/27/13.
//  Copyright (c) 2013 Two Bit Labs. All rights reserved.
//

#import "UIImage+TBL.h"

@implementation UIImage (TBL)

+(UIImage *)imageNamed:(NSString *)name ofType:(NSString *)type shouldCache:(BOOL)cache {
    if (cache) return [self imageNamed:name];
    UIImage *image = nil;
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:type];
    if (path != nil) {
        image = [UIImage imageWithContentsOfFile:path];
    }
    return image;
}

@end
