//
//  FSDeserializerArray.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSDeserializerArray.h"
#import "FSDeserializerDictionary.h"
#import "FSBaseObject.h"

@implementation FSDeserializerArray

- (id)parseResponse:(id)json expectedClass:(Class)class
{
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
    [properties enumerateObjectsUsingBlock:^(FSDeserializeableProperty * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        FSDeserializeableProperty *property = obj;
        NSString *propertyKey = (nil != property.keyId) ? property.keyId : property.name;
        if( NO != [object isKindOfClass:[NSArray class]] )
        {
            [newObject setValue:[self parseResponse:object
                                      expectedClass:property.class]
                         forKey:propertyKey];
        }
        id<PRDeserializer> deserialiser = [FSDeserializerClasses deserializerForClass:property.class];
        id jsonValue = object[propertyKey];
        
        if ( nil == jsonValue )
        {
            [newObject setValue:nil
                         forKey:propertyKey];
        }
        else if( NO != [property.class isSubclassOfClass:[FSBaseObject class]] )
        {
            if( NO != [jsonValue isKindOfClass:[NSArray class]] )
            {
                [newObject setValue:[self parseResponse:jsonValue
                                          expectedClass:property.class]
                             forKey:propertyKey];
            }
            else if ( NO != [jsonValue isKindOfClass:[NSDictionary class]] )
            {
                [newObject setValue:[[[FSDeserializerDictionary alloc] init] parseResponse:jsonValue
                                                                             expectedClass:property.class]
                             forKey:propertyKey];
            }
        }
        else if( property.class == [NSDate class] )
        {
            [newObject setValue:[NSDate fs_dateWithTwitterString:(NSString *)jsonValue]
                         forKey:propertyKey];
        }
        else if( property.class == [NSURL class] )
        {
            [newObject setValue:[NSURL fs_URLWithString:(NSString *)jsonValue]
                         forKey:propertyKey];
        }
        else
        {
            [newObject setValue:jsonValue
                         forKey:propertyKey];
        }
    }];
    return newObject;
}

@end
