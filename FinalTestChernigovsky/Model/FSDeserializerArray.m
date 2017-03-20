//
//  FSDeserializerArray.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSDeserializerArray.h"
#import "PRDeserializeable.h"

@implementation FSDeserializerArray

- (instancetype)init
{
    self = [super init];
    return self;
}

-(id)parseResponse:(id)json expectedClass:(Class)class
{
    assert( NO != [class conformsToProtocol:@protocol(PRDeserializeable)]);
    NSArray<NSDictionary *> *jsonArray = (NSArray *)json;
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    [jsonArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *dictionaryObject = obj;
        id object = [[class alloc] init];
        [dictionaryObject enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [object setValue:<#(nullable id)#> forKey:<#(nonnull NSString *)#>];
        }];
    }];
    return [resultArray copy];
}

@end
