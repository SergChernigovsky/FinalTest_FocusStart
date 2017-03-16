//
//  FSDeserializerDictionary.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSDeserializerDictionary.h"
#import "PRDeserializeable.h"

@implementation FSDeserializerDictionary

- (instancetype)init
{
    self = [super init];
    return self;
}

-(id)parseResponse:(id)json expectedClass:(Class)class
{
    id result = [[class alloc] init];
    if( NO == [result conformsToProtocol:@protocol(PRDeserializeable)] )
    {
        assert( NO );
        return nil;
    }
    NSArray<NSString *> *properies = [class deserializeableProperties];
    [properies enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        NSString *proretyKey = obj;
        id value = json[proretyKey];
        assert( nil != value );
        [result setValue:value forKey:proretyKey];
    }];
    return result;
}

@end
