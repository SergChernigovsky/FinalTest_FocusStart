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

+ (NSArray<NSString *> *)deserializeableProperties
{
    return @[NSStringFromSelector(@selector(access_token)),
             NSStringFromSelector(@selector(token_type))];
}

- (instancetype)init
{
    self = [super init];
    return self;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"access_token=%@, token_type=%@", _access_token, _token_type];
}

@end
