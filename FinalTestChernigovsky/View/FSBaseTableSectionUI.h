//
//  FSBaseTableSectionUI.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 23.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "PRTableSectionUI.h"

@interface FSBaseTableSectionUI : NSObject<PRTableSectionUI>

@property (nonatomic, copy, readonly) NSArray<id<PRCellUI>> *cellsUI;

- (instancetype)initWithCells:(NSArray<id<PRCellUI>> *)cells NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

@end
