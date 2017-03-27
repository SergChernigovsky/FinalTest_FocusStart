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
@synthesize updateSectionHandler;
@synthesize index;

- (instancetype)initWithCells:(NSArray<id<PRCellUI>> *)cells
{
    self = [super init];
    assert( nil != cells);
    self.cellsUI = cells;
    id<PRCellUI> cellUI = [self.cellsUI firstObject];
    cellsIdentifier = cellUI.cellIdentifier;
    typeof(self) __weak weakSelf = self;
    [cells enumerateObjectsUsingBlock:^(id<PRCellUI>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        obj.cellIndex = idx;
        obj.updateCellHandler = ^(NSInteger cellIndex)
        {
            [weakSelf handleUpdateCell:cellIndex];
        };
    }];
    return self;
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

- (void)handleUpdateCell:(NSInteger)cellIndex
{
    if ( nil != self.updateSectionHandler )
    {
        self.updateSectionHandler(self.index, cellIndex);
    }
}

#pragma mark - PRTableSectionUI

- (UITableViewCell *)makeCellWithCell:(UITableViewCell *)cell
                                index:(NSUInteger)cellIndex
{
    id<PRCellUI> cellUI = self.cellsUI[cellIndex];
    return [cellUI makeCellWithCell:cell];
}

- (UITableViewCell *)cellForIndex:(NSUInteger)cellIndex
{
    id<PRCellUI> cellUI = self.cellsUI[cellIndex];
    assert( NO != [cellUI conformsToProtocol:@protocol(PRCellUI)]);
    return cellUI.cell;
}

- (NSUInteger)cellsNumber
{
    return self.cellsUI.count;
}

@end
