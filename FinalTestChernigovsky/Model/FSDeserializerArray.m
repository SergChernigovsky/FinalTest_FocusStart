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
    id result = [[class alloc] init];
    if( NO == [result conformsToProtocol:@protocol(PRDeserializeable)] )
    {
        assert( NO );
        return nil;
    }
//    NSArray<NSString *> *properies = [class deserializeableProperties];
    
    return json;
}

@end
