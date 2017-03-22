//
//  FSRetweetedStatus.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 21.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseObject.h"

@class FSTwitterUser;

@interface FSRetweetedStatus : FSBaseObject

@property (nonatomic, strong, readonly) NSNumber *favorite_count;
@property (nonatomic, strong, readonly) NSNumber *retweet_count;
@property (nonatomic, strong, readonly) FSTwitterUser *user;
@property (nonatomic, copy, readonly) NSString *text;

@end
