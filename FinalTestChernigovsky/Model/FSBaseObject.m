//
//  FSObject.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 18.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseObject.h"

@implementation FSBaseObject

+ (NSArray<NSString *> *)deserializeableProperties{
    return @[];
}

+ (SEL)deserializeableSelector
{
    return @selector(deserializeSelector);
}

- (instancetype)init
{
    self = [super init];
    return self;
}

- (SEL)deserializeSelector
{
    return @selector(setValue:forKey:);
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
