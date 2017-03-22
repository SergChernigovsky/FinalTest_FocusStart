//
//  FSDeserializerArray.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSDeserializerArray.h"

@implementation FSDeserializerArray

- (id)parseResponse:(id)json expectedClass:(Class)class
{
    if( nil == json )
    {
        return nil;
    }
    assert( NO != [json isKindOfClass:[NSArray class]] );
    assert( NO != [class conformsToProtocol:@protocol(PRDeserializeable)]);
    NSArray *jsonArray = (NSArray *)json;
    NSArray<FSDeserializeableProperty *> *properties = [class deserializeableProperties];
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    [jsonArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        [resultArray addObject:[self parseObject:obj withClass:class properties:properties]];
    }];
    return [resultArray copy];
}

- (id)parseObject:(id)object
        withClass:(Class)class
         properties:(NSArray<FSDeserializeableProperty *> *)properties
{
    id newObject = [[class alloc] init];
    [properties enumerateObjectsUsingBlock:^(FSDeserializeableProperty * _Nonnull obj,
                                             NSUInteger idx,
                                             BOOL * _Nonnull stop)
    {
        FSDeserializeableProperty *property = obj;
        NSString *propertyKey = (nil != property.keyId) ? property.keyId : property.name;
        id<PRDeserializer> deserialiser = [FSDeserializerClasses deserializerForClass:property.class];
        id jsonValue = object[propertyKey];
        if ( nil != deserialiser )
        {
            [newObject setValue:[deserialiser parseResponse:jsonValue
                                              expectedClass:property.class]
                         forKey:propertyKey];
            return;
        }
        [newObject setValue:jsonValue
                     forKey:propertyKey];
    }];
    return newObject;
}

@end
