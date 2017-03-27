//
//  FSTweetsScreenUI.m
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTweetsScreenUI.h"
#import "FSAnimationController.h"
#import "FSElementUIFactory.h"
#import "FSTableElementFactory.h"
#import "PRTableUI.h"
#import "FSColors.h"

@implementation FSTweetsScreenUI
{
    FSAnimationController *animationController;
}

- (instancetype)init
{
    self = [super init];
    self.rootView.backgroundColor = [UIColor grayColor];
    [self makeLoadingElements];
    animationController = [[FSAnimationController alloc] init];
    self.startFinalUIHandler(NO);
    return self;
}

- (void)makeLoadingElements
{
    CGPoint indicatorPoint = CGPointMake(CGRectGetMidX(self.rootView.bounds),
                                         CGRectGetMidY(self.rootView.bounds));
    [self addLoadingElement:[FSElementUIFactory indicatorWithCenter:indicatorPoint
                                                              style:UIActivityIndicatorViewStyleWhiteLarge]];
}

- (id<PRTableUI>)tableWithSections:(NSArray<NSArray *> *)sections
{   
    assert( nil != sections);
    id<PRTableUI> table = [FSTableElementFactory tableWithFrame:self.rootView.bounds
                                              sectionsWithCells:sections];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                  0,
                                                                  CGRectGetWidth(self.rootView.bounds),
                                                                  self.topBarHeight)];
    headerView.backgroundColor = [UIColor grayColor];
    table.tableView.tableHeaderView = headerView;
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                  0,
                                                                  CGRectGetWidth(self.rootView.bounds),
                                                                  40.f)];
    footerView.backgroundColor = [UIColor grayColor];
    table.tableView.tableFooterView = footerView;
    table.tableView.backgroundColor = [UIColor grayColor];
    [self addFinalElement:table.tableView];
    return table;
}

- (id<PRCellUI>)tweetCellWithKeys:(NSDictionary<NSString *, id> *)keys
{
    return [FSTableElementFactory tweetCellWithKeys:keys];
}

#pragma mark - PRBaseScreenUI

- (id<UIViewControllerAnimatedTransitioning>)transitionController
{
    return animationController;
}

@end
