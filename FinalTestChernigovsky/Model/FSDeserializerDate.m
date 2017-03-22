//
//  FSDeserializerDate.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 22.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSDeserializerDate.h"

@implementation FSDeserializerDate

-(id)parseResponse:(id)json expectedClass:(Class)class
{
    return [NSDate fs_dateWithTwitterString:(NSString *)json];
}

@end
