//
//  PRTableUI.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 23.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "PRTableSectionUI.h"

@protocol PRTableUI <NSObject>

@property (nonatomic, strong, readonly) UITableView *aTableView;
@property (nonatomic, copy, readonly) NSArray<id<PRTableSectionUI>> *sections;
@property (nonatomic, copy, readwrite) void(^cellClickHandler)(id<PRCellUI> cell);

- (void)rewriteSectionsWithCells:(NSArray<NSArray *> *)sectionsWithCells;

@end
