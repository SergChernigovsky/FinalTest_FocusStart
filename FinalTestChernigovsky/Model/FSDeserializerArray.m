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
//    assert( NO != [class conformsToProtocol:@protocol(PRDeserializeable)]);
//    NSArray<NSDictionary *> *jsonArray = (NSArray *)json;
//    NSArray<NSString *> *properies = [class deserializeableProperties];
//    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
//    
//    [jsonArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSDictionary *dictionaryObject = obj;
//        id object = [[class alloc] init];
//        [properies enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
//        {
//            NSString *propertyKey = obj;
//            id value = dictionaryObject[propertyKey];
//            assert( nil != value );
//            
//        }];
//    }];
    return json;
}



@end
