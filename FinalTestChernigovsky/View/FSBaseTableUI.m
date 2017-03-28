//
//  FSTableUI.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 23.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseTableUI.h"
#import "PRTableSectionUI.h"
#import "PRCellUI.h"
#import "FSBaseTableSectionUI.h"

@interface FSBaseTableUI() <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@end

@implementation FSBaseTableUI
@synthesize sections;
@synthesize aTableView;
@synthesize cellClickHandler;

- (instancetype)initWithFrame:(CGRect)frame
            sectionsWithCells:(NSArray<id<PRTableSectionUI>> *)sectionsWithCells
{
    self = [super init];
    assert( nil != sectionsWithCells );
    sections = sectionsWithCells;
    typeof(self) __weak weakSelf = self;
    [sections enumerateObjectsUsingBlock:^(id<PRTableSectionUI>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        obj.index = idx;
        obj.updateSectionHandler = ^(NSInteger sectionIndex, NSInteger cellIndex)
        {
            [weakSelf reloadCell:cellIndex inSection:sectionIndex];
        };
    }];
    aTableView = [[UITableView alloc] initWithFrame:frame];
    aTableView.delegate = self;
    aTableView.dataSource = self;
    return self;
}

- (void)reloadCell:(NSInteger)cellIndex inSection:(NSInteger)sectionIndex
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:cellIndex inSection:sectionIndex];
    if( NO != [[aTableView indexPathsForVisibleRows] containsObject:indexPath] )
    {
        [aTableView beginUpdates];
        [aTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        [aTableView endUpdates];
    }
}

- (void)rewriteSectionsWithCells:(NSArray<NSArray *> *)sectionsWithCells
{
    NSMutableArray *mutableSections = [[NSMutableArray alloc] init];
    [sectionsWithCells enumerateObjectsUsingBlock:^(NSArray * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
     {
         id<PRTableSectionUI> section = [[FSBaseTableSectionUI alloc] initWithCells:obj];
         [mutableSections addObject:section];
     }];
    sections = [mutableSections copy];
    dispatch_async(dispatch_get_main_queue(), ^
    {
        [aTableView reloadData];
    });
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( nil != self.cellClickHandler)
    {
        id<PRTableSectionUI> sectionUI = sections[indexPath.section];
        self.cellClickHandler(sectionUI.cellsUI[indexPath.row]);
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id<PRTableSectionUI> sectionUI = sections[section];
    assert( nil != sectionUI);
    assert( NO != [sectionUI conformsToProtocol:@protocol(PRTableSectionUI)]);
    return sectionUI.cellsNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<PRTableSectionUI> sectionUI = sections[indexPath.section];
    UITableViewCell *reusableCell = [tableView dequeueReusableCellWithIdentifier:sectionUI.cellsIdentifier];
    UITableViewCell *cell;
    if ( nil == reusableCell )
    {
        cell = [sectionUI cellForIndex:indexPath.row];
        assert( nil != cell);
        return cell;
    }
    cell = [sectionUI makeCellWithCell:reusableCell index:indexPath.row];
    assert( nil != cell);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<PRTableSectionUI> sectionUI = sections[indexPath.section];
    UITableViewCell *cell = [sectionUI cellForIndex:indexPath.row];
    return CGRectGetHeight(cell.frame);
}

@end
