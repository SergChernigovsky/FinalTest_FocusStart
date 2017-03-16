//
//  FSObjectArchiver.m
//  FinalTestChernigovsky
//
//  Created by mini on 15.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSObjectArchiver.h"

@implementation FSObjectArchiver

#pragma mark - NSString

+ (void)archiveString:(NSString *)string forKey:(NSString *)key
{
    assert( nil != string );
    assert( nil != key );
    [[NSUserDefaults standardUserDefaults] setValue:string forKey:key];
}

+ (NSString *)stringForKey:(NSString *)key
{
    assert( nil != key );
    NSString *result = (NSString *)[[NSUserDefaults standardUserDefaults] valueForKey:key];
    assert( nil != result );
    return result;
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

@end
