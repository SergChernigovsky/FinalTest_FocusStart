//
//  FSTwitterPost.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseObject.h"

@class FSTwitterEntities;
@class FSRetweetedStatus;
@class FSTwitterUser;

@interface FSTwitterPost : FSBaseObject

@property (nonatomic, assign, readonly) long favorite_count;
@property (nonatomic, strong, readonly) FSTwitterEntities *entities;
@property (nonatomic, strong, readonly) FSRetweetedStatus *retweeted_status;
@property (nonatomic, assign, readonly) long retweet_count;
@property (nonatomic, assign, readonly) long id;
@property (nonatomic, strong, readonly) FSTwitterUser *user;
@property (nonatomic, copy, readonly) NSString *text;
@property (nonatomic, strong, readonly) NSDate *created_at;

@end
