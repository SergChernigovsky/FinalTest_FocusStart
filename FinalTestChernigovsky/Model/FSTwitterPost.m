//
//  FSTwitterPost.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTwitterPost.h"

@interface FSTwitterPost()
@property (nonatomic, strong, readwrite) NSDate *created_at;
@property (nonatomic, copy, readwrite) NSString *text;
@property (nonatomic, assign, readwrite) NSUInteger retweet_count;
@property (nonatomic, assign, readwrite) NSUInteger favorite_count;
@property (nonatomic, assign, readwrite) BOOL is_retweet;
@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, copy, readwrite) NSString *screen_name;
@property (nonatomic, strong, readwrite) NSURL *profile_image_url;
@property (nonatomic, strong, readwrite) NSURL *url;
@property (nonatomic, strong, readwrite) UIImage *profile_image;
@end

@implementation FSTwitterPost

+ (NSArray<NSString *> *)deserializeableProperties
{
    return @[NSStringFromSelector(@selector(created_at)),
             NSStringFromSelector(@selector(text)),
             NSStringFromSelector(@selector(retweet_count)),
             NSStringFromSelector(@selector(favorite_count)),
             NSStringFromSelector(@selector(is_retweet)),
             NSStringFromSelector(@selector(name)),
             NSStringFromSelector(@selector(screen_name)),
             NSStringFromSelector(@selector(profile_image_url)),
             NSStringFromSelector(@selector(url)),
             NSStringFromSelector(@selector(profile_image))];
}

- (SEL)deserializeSelector
{
    return @selector(setVal:forKey:);
}

- (void)setVal:(id)value forKey:(NSString *)key
{
    
}

@end
