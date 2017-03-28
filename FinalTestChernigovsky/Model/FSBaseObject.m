//
//  FSObject.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 18.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseObject.h"

@implementation FSBaseObject

+ (NSArray<FSDeserializeableProperty *> *)deserializeableProperties{
    return @[];
}

- (instancetype)init
{
    self = [super init];
    return self;
}

- (NSString *)description
{
    NSArray<FSDeserializeableProperty *> *keys = [[self class] deserializeableProperties];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [keys enumerateObjectsUsingBlock:^(FSDeserializeableProperty * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [dictionary setObject:[self valueForKey:obj.name] forKey:obj.name];
    }];
    return dictionary.description;
}

- (NSDictionary *)dictionary
{
    return nil;
}

@end
