//
//  FSRetweetedStatus.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 21.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSRetweetedStatus.h"
#import "FSTwitterUser.h"

@interface FSRetweetedStatus()

@property (nonatomic, strong, readwrite) NSNumber *favorite_count;
@property (nonatomic, strong, readwrite) NSNumber *retweet_count;
@property (nonatomic, strong, readwrite) FSTwitterUser *user;
@property (nonatomic, copy, readwrite) NSString *text;

@end

@implementation FSRetweetedStatus

+ (NSArray<FSDeserializeableProperty *> *)deserializeableProperties
{
    return @[[[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(favorite_count))
                                                       class:[NSNumber class]
                                                       keyId:nil],
             [[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(retweet_count))
                                                       class:[NSNumber class]
                                                       keyId:nil],
             [[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(user))
                                                       class:[FSTwitterUser class]
                                                       keyId:nil],
             [[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(text))
                                                       class:[NSString class]
                                                       keyId:nil]];
}

@end
