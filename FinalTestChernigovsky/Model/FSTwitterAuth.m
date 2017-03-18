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

- (NSString *)description
{
    NSArray<NSString *> *keys = [[self class] deserializeableProperties];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [keys enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [dictionary setObject:[self valueForKey:obj] forKey:obj];
    }];
    return dictionary.description;
}

@end
