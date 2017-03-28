//
//  FSTwitterTableUI.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 29.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTwitterTableUI.h"
#import "FSElementUIFactory.h"

@implementation FSTwitterTableUI
{
    UIActivityIndicatorView *headerIndicator;
    UIActivityIndicatorView *footerIndicator;
}

- (instancetype)initWithFrame:(CGRect)frame
            sectionsWithCells:(NSArray<id<PRTableSectionUI>> *)sectionsWithCells
                 topBarHeight:(CGFloat)topBarHeight
{
    self = [super initWithFrame:frame sectionsWithCells:sectionsWithCells];
    self.aTableView.showsVerticalScrollIndicator = NO;
    self.aTableView.allowsMultipleSelection = NO;
    self.aTableView.backgroundColor = [UIColor grayColor];
    self.aTableView.backgroundView.backgroundColor = [UIColor grayColor];
    
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

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat currentOffsetX = scrollView.contentOffset.x;
    CGFloat currentOffsetY = scrollView.contentOffset.y;
    NSLog(@"(%f, %f)", currentOffsetX, currentOffsetY);
    if( currentOffsetY > -self.aTableView.tableHeaderView.frame.size.height )
    {
        
    }
}

@end
