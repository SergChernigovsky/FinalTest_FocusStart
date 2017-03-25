//
//  FSTableUI.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 23.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseTableUI.h"
#import "PRTableSectionUI.h"
#import "FSBaseTableSectionUI.h"

@interface FSBaseTableUI() <UITableViewDelegate, UITableViewDataSource>
@end

@implementation FSBaseTableUI
@synthesize sections;
@synthesize tableView;

- (instancetype)initWithFrame:(CGRect)frame
            sectionsWithCells:(NSArray<NSArray *> *)sectionsWithCells
{
    self = [super init];
    assert( nil != sectionsWithCells );
    tableView = [[UITableView alloc] initWithFrame:frame];
    tableView.estimatedRowHeight = 200.f;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    NSMutableArray *mutableSections = [[NSMutableArray alloc] init];
    [sectionsWithCells enumerateObjectsUsingBlock:^(NSArray * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        id<PRTableSectionUI> section = [[FSBaseTableSectionUI alloc] initWithCells:obj];
        [mutableSections addObject:section];
    }];
    sections = [mutableSections copy];
    return self;
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
        [tableView reloadData];
    });
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id<PRTableSectionUI> sectionUI = sections[section];
    assert( nil !=  sectionUI);
    assert( NO != [sectionUI conformsToProtocol:@protocol(PRTableSectionUI)]);
    return sectionUI.cellsNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<PRTableSectionUI> sectionUI = sections[indexPath.section];
    UITableViewCell *cell = [sectionUI cellForIndex:indexPath.row];
    assert( nil != cell );
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    id<PRTableSectionUI> sectionUI = sections[indexPath.section];
//    UITableViewCell *cell = [sectionUI cellForIndex:indexPath.row];
//    return CGRectGetHeight(cell.frame);
//}

@end
