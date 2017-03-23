//
//  FSTableUI.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 23.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "PRTableUI.h"

@class FSTableViewCell;

@interface FSTableUI : NSObject<PRTableUI>

- (instancetype)initWithFrame:(CGRect)frame cells:(NSArray *)cells NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

@end
