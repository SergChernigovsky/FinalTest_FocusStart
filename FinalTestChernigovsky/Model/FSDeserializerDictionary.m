//
//  FSDeserializerDictionary.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSDeserializerDictionary.h"
#import "FSBaseObject.h"
#import "FSDeserializerArray.h"

@implementation FSDeserializerDictionary

-(id)parseResponse:(id)json expectedClass:(Class)class
{
    id newObject = [[class alloc] init];
    assert( NO != [json isKindOfClass:[NSDictionary class]] );
    assert( NO != [newObject conformsToProtocol:@protocol(PRDeserializeable)] );
    NSArray<FSDeserializeableProperty *> *properties = [class deserializeableProperties];
    [properties enumerateObjectsUsingBlock:^(FSDeserializeableProperty * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
         FSDeserializeableProperty *property = obj;
         NSString *propertyKey = (nil != property.keyId) ? property.keyId : property.name;
         
         id jsonValue = json[propertyKey];
         if ( nil == jsonValue )
         {
             [newObject setValue:nil
                          forKey:propertyKey];
         }
         else if( NO != [property.class isSubclassOfClass:[FSBaseObject class]] )
         {
             if( NO != [jsonValue isKindOfClass:[NSArray class]] )
             {
                 [newObject setValue:[[[FSDeserializerArray alloc] init] parseResponse:jsonValue
                                                                         expectedClass:property.class]
                              forKey:propertyKey];
             }
             else if ( NO != [jsonValue isKindOfClass:[NSDictionary class]] )
             {
                 [newObject setValue:[self parseResponse:jsonValue
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
