//
//  FSDeserializerURL.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 22.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSDeserializerURL.h"

@implementation FSDeserializerURL

-(id)parseResponse:(id)json expectedClass:(Class)class
{
    return [NSURL fs_URLWithString:(NSString *)json];
}

@end
