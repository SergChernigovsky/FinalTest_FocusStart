//
//  FSStartScreenUI.h
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseScreenUI.h"

@interface FSStartScreenUI : FSBaseScreenUI

@property (nonatomic, copy, readwrite) void (^buttonClickHandler)(NSString* accountName);

- (instancetype)init NS_DESIGNATED_INITIALIZER;

@end
