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

@property (nonatomic, assign, readwrite) long favorite_count;
@property (nonatomic, assign, readwrite) long retweet_count;
@property (nonatomic, strong, readwrite) FSTwitterUser *user;
@property (nonatomic, copy, readwrite) NSString *text;

@end

@implementation FSRetweetedStatus

@end
