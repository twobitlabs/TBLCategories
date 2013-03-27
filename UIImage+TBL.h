//
//  UIImage+TBL.h
//  TeamStream
//
//  Created by Todd Huss on 3/27/13.
//  Copyright (c) 2013 Two Bit Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TBL)

+(UIImage *)imageNamed:(NSString *)name ofType:(NSString *)type shouldCache:(BOOL)cache;

@end
