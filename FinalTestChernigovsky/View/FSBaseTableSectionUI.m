//
//  FSBaseTableSectionUI.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 23.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseTableSectionUI.h"

@implementation FSBaseTableSectionUI
{
    NSArray<id<PRCellUI>> *cellsUI;
}
@synthesize cellsNumber;

- (instancetype)initWithCells:(NSArray<id<PRCellUI>> *)cells
{
    self = [super init];
    assert( nil != cells);
    cellsUI = [cells copy];
    return self;
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

#pragma mark - PRTableSectionUI

- (UITableViewCell *)cellForIndex:(NSUInteger)index{
    id<PRCellUI> cellUI = cellsUI[index];
    return cellUI.cell;
}

- (NSUInteger)cellsNumber
{
    return cellsUI.count;
}

@end
