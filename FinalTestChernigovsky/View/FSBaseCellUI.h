//
//  FSBaseCellUI.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 27.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PRCellUI.h"

@interface FSBaseCellUI : NSObject<PRCellUI>

- (instancetype)initWithKeys:(NSDictionary<NSString *, id> *)keys NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

@end
