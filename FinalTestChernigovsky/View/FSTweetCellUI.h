//
//  FSTwitterCellUI.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 23.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseCellUI.h"

@interface FSTweetCellUI : FSBaseCellUI

@property (nonatomic, assign, readonly) BOOL retweetedStatus;
@property (nonatomic, strong, readonly) NSNumber *favoriteCount;
@property (nonatomic, strong, readonly) NSNumber *retweetCount;
@property (nonatomic, copy, readonly) NSString *text;
@property (nonatomic, copy, readonly) NSString *userName;
@property (nonatomic, copy, readonly) NSString *tweetUserName;
@property (nonatomic, copy, readonly) NSString *tweetUserScreenName;
@property (nonatomic, copy, readonly) NSString *createdAt;
@property (nonatomic, strong, readwrite) UIImage *userIcon;

- (void)installIconWithData:(NSData *)userIcon;

@end
