//
//  FSBaseTableSectionUI.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 23.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseTableSectionUI.h"

@interface FSBaseTableSectionUI()
@property (nonatomic, copy, readwrite) NSArray<id<PRCellUI>> *cellsUI;
@end

@implementation FSBaseTableSectionUI
@synthesize cellsNumber;
@synthesize cellsIdentifier;

- (instancetype)initWithCells:(NSArray<id<PRCellUI>> *)cells
{
    self = [super init];
    assert( nil != cells);
    self.cellsUI = cells;
    id<PRCellUI> cellUI = [self.cellsUI firstObject];
    cellsIdentifier = cellUI.cellIdentifier;
    return self;
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

#pragma mark - PRTableSectionUI

- (UITableViewCell *)makeCellWithCell:(UITableViewCell *)cell
                                index:(NSUInteger)index
{
    id<PRCellUI> cellUI = self.cellsUI[index];
    return [cellUI makeCellWithCell:cell];
}

- (UITableViewCell *)cellForIndex:(NSUInteger)index
{
    id<PRCellUI> cellUI = self.cellsUI[index];
    assert( NO != [cellUI conformsToProtocol:@protocol(PRCellUI)]);
    return cellUI.cell;
}

- (NSUInteger)cellsNumber
{
    return self.cellsUI.count;
}

@end
