//
//  FSTwitterEntities.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 21.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTwitterEntities.h"
#import "FSTwitterUrls.h"
#import "FSTwitterMedia.h"

@interface FSTwitterEntities()
@property (nonatomic, copy, readwrite) NSArray<FSTwitterUrls *> *urls;
@property (nonatomic, copy, readwrite) NSArray<FSTwitterMedia *> *media;
@end

@implementation FSTwitterEntities

+ (NSArray<FSDeserializeableProperty *> *)deserializeableProperties
{
    
    return @[[[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(urls))
                                                       class:[FSTwitterUrls class]
                                                       keyId:nil],
             [[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(media))
                                                       class:[FSTwitterMedia class]
                                                       keyId:nil]];
}

@end
