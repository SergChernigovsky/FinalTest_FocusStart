//
//  FSTwitterUrls.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 21.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTwitterUrls.h"

@interface FSTwitterUrls()
@property (nonatomic, copy, readwrite) NSString *display_url;
@property (nonatomic, strong, readwrite) NSURL *url;
@end

@implementation FSTwitterUrls

+ (NSArray<FSDeserializeableProperty *> *)deserializeableProperties
{
    
    return @[[[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(display_url))
                                                       class:[NSString class]
                                                       keyId:nil],
             [[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(url))
                                                       class:[NSURL class]
                                                       keyId:nil]];
}

@end
