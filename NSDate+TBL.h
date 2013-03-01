//
//  NSDate+TBL.h
//  iKu
//
//  Created by Christopher Pickslay on 2/24/11.
//  Copyright 2011 Two Bit Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (TBL)

-(NSString *)timeAgo;
-(BOOL)isToday;
-(BOOL)isTomorrow;

@end
