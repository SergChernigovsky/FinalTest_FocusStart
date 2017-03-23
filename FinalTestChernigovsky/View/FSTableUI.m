//
//  FSTableUI.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 23.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTableUI.h"
#import "FSTableViewCell.h"

@interface FSTableUI() <UITableViewDelegate, UITableViewDataSource>
@end

@implementation FSTableUI
{
    NSArray *cellsArray;
}
@synthesize tableView;

- (instancetype)initWithFrame:(CGRect)frame cells:(NSArray *)cells
{
    self = [super init];
    assert( nil != cells );
    tableView = [[UITableView alloc] initWithFrame:frame];
    cellsArray = cells;
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return cellsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    assert( nil != cellsArray[indexPath.row] );
    return cellsArray[indexPath.row];
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

@end
