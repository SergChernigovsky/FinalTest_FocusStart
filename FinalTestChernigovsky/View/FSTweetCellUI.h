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

@property (nonatomic, assign, readonly) BOOL retweetedStatus;
@property (nonatomic, strong, readonly) NSNumber *favoriteCount;
@property (nonatomic, strong, readonly) NSNumber *retweetCount;
@property (nonatomic, copy, readonly) NSString *text;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *screenName;
@property (nonatomic, copy, readonly) NSString *createdAt;
@property (nonatomic, strong, readonly) UIImage *userImage;

- (instancetype)initWithKeys:(NSDictionary<NSString *, id> *)keys NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

@end
