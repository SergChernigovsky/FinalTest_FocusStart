//
//  FSTwitterPost.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTwitterPost.h"
#import "FSTwitterEntities.h"

@interface FSTwitterPost()

@property (nonatomic, strong, readwrite) NSNumber *favorite_count;
@property (nonatomic, strong, readwrite) FSRetweetedStatus *retweeted_status;
//@property (nonatomic, strong, readwrite, nullable) FSTwitterEntities *entities;
@property (nonatomic, strong, readwrite) NSNumber *retweet_count;
@property (nonatomic, strong, readwrite) NSNumber *id;
@property (nonatomic, strong, readwrite) FSTwitterUser *user;
@property (nonatomic, copy, readwrite) NSString *text;
@property (nonatomic, strong, readwrite) NSDate *created_at;

@end

@implementation FSTwitterPost

+ (NSArray<FSDeserializeableProperty *> *)deserializeableProperties
{
    
    return @[[[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(favorite_count))
                                                       class:[NSNumber class]
                                                       keyId:nil],
             [[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(retweeted_status))
                                                       class:[FSRetweetedStatus class]
                                                       keyId:nil],
//             [[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(entities))
//                                                       class:[FSTwitterEntities class]
//                                                       keyId:nil],
             [[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(retweet_count))
                                                       class:[NSNumber class]
                                                       keyId:nil],
             [[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(id))
                                                       class:[NSNumber class]
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

- (NSDictionary *)dictionary{
    FSTwitterUser *user = ( nil != self.retweeted_status ) ? self.retweeted_status.user : self.user;
    return @{@"name" : user.name,
             @"screen_name" : user.screen_name,
             @"retweet_count" : self.retweet_count,
             @"favorite_count" : self.favorite_count,
             @"text" : self.text,
             @"created_at" : self.created_at};
}

@end
