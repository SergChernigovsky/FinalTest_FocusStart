//
//  FSTwitterPost.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTwitterPost.h"
#import "FSTwitterEntities.h"
#import "FSRetweetedStatus.h"
#import "FSTwitterUser.h"

@interface FSTwitterPost()

@property (nonatomic, assign, readwrite) long favorite_count;
@property (nonatomic, strong, readwrite) FSTwitterEntities *entities;
@property (nonatomic, strong, readwrite) FSRetweetedStatus *retweeted_status;
@property (nonatomic, assign, readwrite) long retweet_count;
@property (nonatomic, assign, readwrite) long id;
@property (nonatomic, strong, readwrite) FSTwitterUser *user;
@property (nonatomic, copy, readwrite) NSString *text;
@property (nonatomic, strong, readwrite) NSDate *created_at;

@end

@implementation FSTwitterPost

+ (NSArray<FSDeserializeableProperty *> *)deserializeableProperties
{
    
    return @[[[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(favorite_count))
                                                       class:nil
                                                       keyId:nil],
             [[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(entities))
                                                       class:[FSTwitterEntities class]
                                                       keyId:nil],
             [[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(retweeted_status))
                                                       class:[FSRetweetedStatus class]
                                                       keyId:nil],
             [[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(retweet_count))
                                                       class:nil
                                                       keyId:nil],
             [[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(id))
                                                       class:nil
                                                       keyId:nil],
             [[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(user))
                                                       class:[FSTwitterUser class]
                                                       keyId:nil],
             [[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(text))
                                                       class:[NSString class]
                                                       keyId:nil],
             [[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(created_at))
                                                       class:[NSDate class]
                                                       keyId:nil]];
}

@end
