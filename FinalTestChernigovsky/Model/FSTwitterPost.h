//
//  FSTwitterPost.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PRDeserializeable.h"

@interface FSTwitterPost : NSObject<PRDeserializeable>

@property (nonatomic, strong, readonly) NSDate *created_at;
@property (nonatomic, copy, readonly) NSString *text;
@property (nonatomic, assign, readonly) NSUInteger retweet_count;
@property (nonatomic, assign, readonly) NSUInteger favorite_count;
@property (nonatomic, assign, readonly) BOOL is_retweet;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *screen_name;
@property (nonatomic, strong, readonly) NSURL *profile_image_url;
@property (nonatomic, strong, readonly) NSURL *url;
@property (nonatomic, strong, readonly) UIImage *profile_image;
- (instancetype)init NS_DESIGNATED_INITIALIZER;

@end
