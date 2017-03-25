//
//  PRTableUI.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 23.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "PRTableSectionUI.h"

@protocol PRTableUI <NSObject>

@property (nonatomic, strong, readonly) UITableView *tableView;
@property (nonatomic, copy, readonly) NSArray<id<PRTableSectionUI>> *sections;

- (void)rewriteSectionsWithCells:(NSArray<NSArray *> *)sectionsWithCells;

@end
