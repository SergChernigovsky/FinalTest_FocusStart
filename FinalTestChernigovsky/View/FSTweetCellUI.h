//
//  FSTwitterCellUI.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 23.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PRCellUI.h"

@interface FSTweetCellUI : NSObject<PRCellUI>

@property (nonatomic, assign, readonly) BOOL retweeted_status;
@property (nonatomic, strong, readonly) NSNumber *favorite_count;
@property (nonatomic, strong, readonly) NSNumber *retweet_count;
@property (nonatomic, copy, readonly) NSString *text;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *screen_name;
@property (nonatomic, copy, readonly) NSString *created_at;
@property (nonatomic, strong, readonly) UIImage *user_image;

- (instancetype)initWithKeys:(NSDictionary<NSString *, id> *)keys NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

@end
