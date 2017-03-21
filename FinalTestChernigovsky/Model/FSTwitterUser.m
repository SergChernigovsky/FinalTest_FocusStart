//
//  FSTwitterUser.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 21.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTwitterUser.h"

@interface FSTwitterUser()
@property (nonatomic, strong, readwrite) NSURL *profile_image_url;
@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, copy, readwrite) NSString *screen_name;
@end

@implementation FSTwitterUser

+ (NSArray<FSDeserializeableProperty *> *)deserializeableProperties
{
    return @[[[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(profile_image_url))
                                                       class:[NSURL class]
                                                       keyId:nil],
             [[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(name))
                                                       class:[NSString class]
                                                       keyId:nil],
             [[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(screen_name))
                                                       class:[NSString class]
                                                       keyId:nil]];
}

@end
