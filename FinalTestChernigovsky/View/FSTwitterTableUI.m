//
//  FSTwitterTableUI.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 29.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTwitterTableUI.h"
#import "FSElementUIFactory.h"
#import "FSTweetCellUI.h"
#import "FSTweetsTableSectionUI.h"

CGFloat const footerHeight = 40.f;

@interface FSTwitterTableUI()<UITableViewDelegate, UIScrollViewDelegate>
@end

@implementation FSTwitterTableUI
{
    UIActivityIndicatorView *headerIndicator;
    UIActivityIndicatorView *footerIndicator;
    CGFloat topBarHeight;
    NSOperationQueue *backgroundQueue;
}

- (instancetype)initWithFrame:(CGRect)frame
            sectionsWithCells:(NSArray<id<PRTableSectionUI>> *)sectionsWithCells
                 topBarHeight:(CGFloat)aTopBarHeight
{
    self = [super initWithFrame:frame sectionsWithCells:sectionsWithCells];
    backgroundQueue = [[NSOperationQueue alloc] init];
    self.aTableView.showsVerticalScrollIndicator = NO;
    self.aTableView.allowsMultipleSelection = NO;
    self.aTableView.backgroundColor = [UIColor grayColor];
    self.aTableView.backgroundView.backgroundColor = [UIColor grayColor];
    
    topBarHeight = aTopBarHeight;
    UIView *headerView = [self makeHeaderViewWithHeight:topBarHeight];
    UIView *footerView = [self makeFooterViewWithHeight:footerHeight];
    headerIndicator = [self makeIndicatorWithRect:headerView.bounds alpha:1.f];
    footerIndicator = [self makeIndicatorWithRect:footerView.bounds alpha:1.f];
    [headerView addSubview:headerIndicator];
    [footerView addSubview:footerIndicator];
    self.aTableView.tableHeaderView = headerView;
    self.aTableView.tableFooterView = footerView;
    return self;
}

#pragma mark - UI

- (UIActivityIndicatorView *)makeIndicatorWithRect:(CGRect)rect alpha:(CGFloat)alpha
{
    CGPoint centerPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    UIActivityIndicatorView *indicator = [FSElementUIFactory indicatorWithCenter:centerPoint
                                                                           style:UIActivityIndicatorViewStyleWhite];
    indicator.alpha = alpha;
    [indicator startAnimating];
    return indicator;
}

- (UIView *)makeHeaderViewWithHeight:(CGFloat)height
{
    CGRect headerRect = CGRectMake(0, 0, CGRectGetWidth(self.aTableView.bounds), height);
    UIView *headerView = [[UIView alloc] initWithFrame:headerRect];
    headerView.backgroundColor = [UIColor grayColor];
    return headerView;
}

- (UIView *)makeFooterViewWithHeight:(CGFloat)height
{
    CGRect footerRect = CGRectMake(0, 0, CGRectGetWidth(self.aTableView.bounds), height);
    UIView *footerView = [[UIView alloc] initWithFrame:footerRect];
    footerView.backgroundColor = [UIColor grayColor];
    return footerView;
}

- (void)enableTable
{
    dispatch_async(dispatch_get_main_queue(), ^
    {
        self.aTableView.userInteractionEnabled = YES;
        self.aTableView.scrollEnabled = YES;
    });
}

#pragma mark - Handlers

- (void)handleTopTweets
{
    if( nil != self.updateTopHandler )
    {
        self.updateTopHandler();
    }
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section
{
    
}

- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section
{
    
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat currentOffsetX = scrollView.contentOffset.x;
    CGFloat currentOffsetY = scrollView.contentOffset.y;
    if( currentOffsetY < -topBarHeight )
    {
        [backgroundQueue cancelAllOperations];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^
        {
            headerIndicator.alpha = currentOffsetY/-topBarHeight;
            self.aTableView.userInteractionEnabled = NO;
            self.aTableView.scrollEnabled = NO;
            scrollView.contentOffset = CGPointMake(currentOffsetX, -topBarHeight);
            [backgroundQueue addOperationWithBlock:^
            {
                [self handleTopTweets];
            }];
        }];
    }
}

@end
