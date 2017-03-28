//
//  PRTableSectionUI.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 23.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "PRCellUI.h"

@protocol PRTableSectionUI <NSObject>

@property (nonatomic, copy, readonly) NSArray<id<PRCellUI>> *cellsUI;
@property (nonatomic, assign, readwrite) NSUInteger index;
@property (nonatomic, assign, readonly) NSUInteger cellsNumber;
@property (nonatomic, copy, readonly) NSString *cellsIdentifier;
@property (nonatomic, copy, readwrite) void(^updateSectionHandler)(NSInteger sectionIndex, NSInteger cellIndex);

- (UITableViewCell *)cellForIndex:(NSUInteger)index;

- (UITableViewCell *)makeCellWithCell:(UITableViewCell *)cell index:(NSUInteger)index;

@end
