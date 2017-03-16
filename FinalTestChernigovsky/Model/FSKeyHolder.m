//
//  FSKeyHolder.m
//  FinalTestChernigovsky
//
//  Created by mini on 14.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSKeyHolder.h"

@implementation FSKeyHolder
{
    NSMutableDictionary<NSString *, id> *dictionary;
}

- (instancetype)init
{
    self = [super init];
    dictionary = [[NSMutableDictionary alloc] init];
    return self;
}

- (void) addObject:(id)object forKey:(NSString *)key
{
    assert( nil != object );
    assert( nil != key );
    [dictionary setObject:object forKey:key];
}

- (void)enumerateUsingBlock:(void(^)(id key, id object))block
{
    assert( nil != dictionary );
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop)
    {
        block(key, obj);
    }];
}

@end
