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
    if ( nil == string || NO != [string isKindOfClass:[NSNull class]])
    {
        return nil;
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en"];
    dateFormatter.dateFormat = @"E MM dd HH:mm:ss ZZZ yyyy";
    dateFormatter.timeZone = [NSTimeZone systemTimeZone];
    return [dateFormatter dateFromString:string];
}

+ (NSString *)fs_stringFromDate:(NSDate *)date
{
    if ( nil == date || NO != [date isKindOfClass:[NSNull class]])
    {
        return nil;
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en"];
    dateFormatter.dateFormat = @"dd.MM.yy";
    dateFormatter.timeZone = [NSTimeZone systemTimeZone];
    return [dateFormatter stringFromDate:date];
}

@end
