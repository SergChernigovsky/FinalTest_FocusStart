//
//  FSDeserializerDictionary.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSDeserializerDictionary.h"

@implementation FSDeserializerDictionary

-(id)parseResponse:(id)json expectedClass:(Class)class
{
    id result = [[class alloc] init];
    assert( NO != [result conformsToProtocol:@protocol(PRDeserializeable)] );
    NSArray<FSDeserializeableProperty *> *properies = [class deserializeableProperties];
    [properies enumerateObjectsUsingBlock:^(FSDeserializeableProperty * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        FSDeserializeableProperty *prorety = obj;
        id value = (nil != prorety.key) ? json[prorety.key] : json[prorety.name];
        assert( nil != value );
        [result setValue:value forKey:prorety.name];
    }];
    return result;
}

@end
