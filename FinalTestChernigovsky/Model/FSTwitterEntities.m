//
//  FSTwitterEntities.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 21.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTwitterEntities.h"
#import "FSTwitterUrls.h"

@interface FSTwitterEntities()
@property (nonatomic, strong, readwrite) FSTwitterUrls *urls;
@end

@implementation FSTwitterEntities

+ (NSArray<FSDeserializeableProperty *> *)deserializeableProperties
{
    
    return @[[[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(urls))
                                                       class:[FSTwitterUrls class]
                                                       keyId:nil]];
}

@end
