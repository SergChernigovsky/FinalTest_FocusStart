//
//  FSDeserializerClasses.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 22.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSDeserializerClasses.h"
#import "FSDeserializerArray.h"
#import "FSDeserializerDictionary.h"
#import "FSDeserializerURL.h"
#import "FSDeserializerDate.h"

@implementation FSDeserializerClasses

+ (Class<PRDeserializer> _Nullable)deserializerForClass:(Class _Nullable)class
{
    if ( nil == class) {
        return nil;
    }
    NSDictionary *deserializers = @{@"NSURL":[[FSDeserializerURL alloc] init],
                                    @"NSDate":[[FSDeserializerDate alloc] init],
                                    @"FSTwitterAuth":[[FSDeserializerDictionary alloc] init],
                                    @"FSTwitterPost":[[FSDeserializerDictionary alloc] init],
                                    @"FSTwitterUser":[[FSDeserializerDictionary alloc] init],
                                    @"FSRetweetedStatus":[[FSDeserializerDictionary alloc] init]};
    return deserializers[NSStringFromClass(class)];
}

@end
