//
//  FSTwitterPost.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseObject.h"

@class FSRetweetedStatus;
@class FSTwitterUser;
@class FSTwitterEntities;

@interface FSTwitterPost : FSBaseObject

@property (nonatomic, strong, readonly) NSNumber *favorite_count;
@property (nonatomic, strong, readonly) FSRetweetedStatus *retweeted_status;
//@property (nonatomic, strong, readonly, nullable) FSTwitterEntities *entities;
@property (nonatomic, strong, readonly) NSNumber *retweet_count;
@property (nonatomic, strong, readonly) NSNumber *id;
@property (nonatomic, strong, readonly) FSTwitterUser *user;
@property (nonatomic, copy, readonly) NSString *text;
@property (nonatomic, strong, readonly) NSDate *created_at;

@end
