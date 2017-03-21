//
//  FSTwitterAuth.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTwitterAuth.h"

@interface FSTwitterAuth()
@property (nonatomic, copy, readwrite) NSString *access_token;
@property (nonatomic, copy, readwrite) NSString *token_type;
@end

@implementation FSTwitterAuth

+ (NSArray<FSDeserializeableProperty *> *)deserializeableProperties
{
    return @[[[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(access_token))
                                                       class:[NSString class]
                                                       keyId:nil],
             [[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(token_type))
                                                       class:[NSString class]
                                                       keyId:nil],];
}

@end
