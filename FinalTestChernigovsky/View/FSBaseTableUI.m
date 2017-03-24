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
    tableView.delegate = self;
    tableView.dataSource = self;
    NSMutableArray *mutableSections = [[NSMutableArray alloc] init];
    [sectionsWithCells enumerateObjectsUsingBlock:^(NSArray * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        id<PRTableSectionUI> section = [[FSBaseTableSectionUI alloc] initWithCells:obj];
        [mutableSections addObject:section];
    }];
    sections = [mutableSections copy];
    return self;
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

- (instancetype)init
{
    assert( NO );
    return nil;
}

@end