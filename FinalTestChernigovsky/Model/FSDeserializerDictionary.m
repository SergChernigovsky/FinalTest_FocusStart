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
    if( nil == json )
    {
        return nil;
    }
    id newObject = [[class alloc] init];
    assert( NO != [newObject conformsToProtocol:@protocol(PRDeserializeable)] );
    NSArray<FSDeserializeableProperty *> *properties = [class deserializeableProperties];
    [properties enumerateObjectsUsingBlock:^(FSDeserializeableProperty * _Nonnull obj,
                                             NSUInteger idx,
                                             BOOL * _Nonnull stop)
    {
        FSDeserializeableProperty *property = obj;
        NSString *propertyKey = (nil != property.keyId) ? property.keyId : property.name;
        id jsonValue = json[propertyKey];
        id<PRDeserializer> deserialiser = [FSDeserializerClasses deserializerForClass:property.class];
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
