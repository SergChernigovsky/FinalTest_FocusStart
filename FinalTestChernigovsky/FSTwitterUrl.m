//
//  FSTwitterUrl.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 22.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTwitterUrl.h"

@interface FSTwitterUrl()
@property (nonatomic, copy, readwrite) NSString *display_url;
@property (nonatomic, strong, readwrite) NSURL *url;
@end

@implementation FSTwitterUrl

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
