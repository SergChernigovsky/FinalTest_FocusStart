//
//  FSTwitterPost.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTwitterPost.h"
#import "NSDate+FSDate.h"

@interface FSTwitterPost()

@property (nonatomic, strong, readwrite) NSNumber *favorite_count;
@property (nonatomic, strong, readwrite) FSRetweetedStatus *retweeted_status;
@property (nonatomic, strong, readwrite) FSTwitterEntities *entities;
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
             [[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(entities))
                                                       class:[FSTwitterEntities class]
                                                       keyId:nil],
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

- (NSDictionary *)dictionary
{
    FSTwitterUser *tweetUser = ( nil != self.retweeted_status ) ? self.retweeted_status.user : self.user;
    NSString *text = ( nil != self.retweeted_status ) ? self.retweeted_status.text : self.text;
    NSNumber *favorite_count = ( nil != self.retweeted_status ) ? self.retweeted_status.favorite_count : self.favorite_count;
    FSTwitterUrls *urls = [self.entities.urls firstObject];
    NSString *display_url = ( nil != urls ) ? urls.display_url : @"";
    NSURL *url = ( nil != urls ) ? urls.url : [[NSURL alloc] init];
    return @{NSStringFromSelector(@selector(name)) : tweetUser.name,
             NSStringFromSelector(@selector(screen_name)) : tweetUser.screen_name,
             NSStringFromSelector(@selector(display_url)) :  display_url,
             NSStringFromSelector(@selector(url)) :  url,
             NSStringFromSelector(@selector(retweeted_status)) : @( nil != self.retweeted_status),
             NSStringFromSelector(@selector(retweet_count)) : self.retweet_count,
             NSStringFromSelector(@selector(favorite_count)) : favorite_count,
             NSStringFromSelector(@selector(text)) : text,
             NSStringFromSelector(@selector(created_at)) : [NSDate fs_stringFromDate:self.created_at]
             };
}

@end
