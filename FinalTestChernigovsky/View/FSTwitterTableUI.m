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

@implementation FSTwitterTableUI
{
    UIActivityIndicatorView *headerIndicator;
    UIActivityIndicatorView *footerIndicator;
    CGFloat topBarHeight;
}

- (instancetype)initWithFrame:(CGRect)frame
            sectionsWithCells:(NSArray<id<PRTableSectionUI>> *)sectionsWithCells
                 topBarHeight:(CGFloat)aTopBarHeight
{
    self = [super initWithFrame:frame sectionsWithCells:sectionsWithCells];
    self.aTableView.showsVerticalScrollIndicator = NO;
    self.aTableView.allowsMultipleSelection = NO;
    self.aTableView.backgroundColor = [UIColor grayColor];
    self.aTableView.backgroundView.backgroundColor = [UIColor grayColor];
    
    topBarHeight = aTopBarHeight;
    UIView *headerView = [self makeHeaderViewWithHeight:topBarHeight];
    UIView *footerView = [self makeFooterViewWithHeight:40.f];
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

#pragma mark - Handlers

- (void)handleTopTweets
{
    FSTweetsTableSectionUI __block *sectionUI;
    [self.sections enumerateObjectsUsingBlock:^(id<PRTableSectionUI>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        if ( NO != [obj isKindOfClass:[FSTweetsTableSectionUI class]]) {
            sectionUI = (FSTweetsTableSectionUI *)obj;
        }
    }];
    assert( nil != sectionUI );
    FSTweetCellUI *cellUI = sectionUI.cellsUI[1];
    if( nil != self.sinceIDHander )
    {
        self.sinceIDHander(cellUI.id);
    }
}

- (void)enableTable
{
    self.aTableView.userInteractionEnabled = YES;
    self.aTableView.scrollEnabled = YES;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat currentOffsetX = scrollView.contentOffset.x;
    CGFloat currentOffsetY = scrollView.contentOffset.y;
    if( currentOffsetY < -topBarHeight )
    {
        dispatch_async(dispatch_get_main_queue(), ^
        {
//            headerIndicator.alpha = currentOffsetY/-topBarHeight;
//            self.aTableView.userInteractionEnabled = NO;
//            self.aTableView.scrollEnabled = NO;
//            scrollView.contentOffset = CGPointMake(currentOffsetX, -topBarHeight);
//            [self handleTopTweets];
        });
    }
}

@end
