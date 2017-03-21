//
//  NSDate+FSDate.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 21.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "NSDate+FSDate.h"

@implementation NSDate (FSDate)

+ (NSDate *)fs_dateWithTwitterString:(NSString *)string
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"E MM dd HH:mm:ss ZZZ yyyy";
    return [dateFormatter dateFromString:string];
}

@end
