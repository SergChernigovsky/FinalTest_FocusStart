//
//  FSDeserializer.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 21.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSDeserializer.h"

@implementation FSDeserializer

- (instancetype)init
{
    self = [super init];
    return self;
}

- (id)parseResponse:(id)json expectedClass:(Class)class
{
    return nil;
}

- (NSError *)parseErrors:(id)json
{
    NSArray *errors = (NSArray *)json;
    if ( nil == errors || 0 == errors.count)
    {
        return [[NSError alloc] initWithDomain:@"Unknown error."
                                          code:0
                                      userInfo:nil];
    }
    NSDictionary *error = [errors firstObject];
    NSString *message = ( nil != error[@"message"] ) ? (NSString *)error[@"message"] : @"Unknown error.";
    NSInteger code = ( nil != error[@"code"] ) ? [error[@"code"] integerValue] : 0;
    return [[NSError alloc] initWithDomain:message
                                      code:code
                                  userInfo:nil];
}

@end
