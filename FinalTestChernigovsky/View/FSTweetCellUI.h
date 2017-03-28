//
//  FSTwitterCellUI.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 23.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseCellUI.h"

@interface FSTweetCellUI : FSBaseCellUI

@property (nonatomic, assign, readonly) BOOL retweeted_status;
@property (nonatomic, strong, readonly) NSNumber *favorite_count;
@property (nonatomic, strong, readonly) NSNumber *retweet_count;
@property (nonatomic, strong, readonly) NSNumber *id;
@property (nonatomic, copy, readonly) NSString *text;
@property (nonatomic, copy, readonly) NSString *user_name;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *screen_name;
@property (nonatomic, copy, readonly) NSString *created_at;
@property (nonatomic, copy, readonly) NSString *display_url;
@property (nonatomic, strong, readonly) NSURL *url;
@property (nonatomic, strong, readwrite) UIImage *user_icon;
@property (nonatomic, strong, readwrite) UIImage *media;

- (void)installIconWithData:(NSData *)userIcon;

- (void)installMediaWithData:(NSData *)media;

@end
