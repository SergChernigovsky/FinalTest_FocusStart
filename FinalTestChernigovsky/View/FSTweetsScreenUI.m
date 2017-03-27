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
    self.rootView.backgroundColor = [FSColors blueTwitterColor];
    [self addLoadingElement:[self makeActivityIndicator]];
    animationController = [[FSAnimationController alloc] init];
    self.startFinalUIHandler(NO);
    return self;
}

- (UIActivityIndicatorView *)makeActivityIndicator
{
    CGPoint indicatorPoint = CGPointMake(CGRectGetMidX(self.rootView.bounds),
                                         CGRectGetMidY(self.rootView.bounds));
    return [FSElementUIFactory indicatorWithCenter:indicatorPoint
                                             style:UIActivityIndicatorViewStyleWhiteLarge];
}

- (id<PRTableUI>)makeTableWithSections:(NSArray<id<PRTableSectionUI>> *)sections
{
    assert( nil != sections);
    id<PRTableUI> table = [FSTableElementFactory tableWithFrame:self.rootView.bounds
                                              sectionsWithCells:sections];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                  0,
                                                                  CGRectGetWidth(self.rootView.bounds),
                                                                  self.topBarHeight)];
    headerView.backgroundColor = [UIColor grayColor];
    table.aTableView.tableHeaderView = headerView;
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                  0,
                                                                  CGRectGetWidth(self.rootView.bounds),
                                                                  40.f)];
    footerView.backgroundColor = [UIColor grayColor];
    table.aTableView.tableFooterView = footerView;
    table.aTableView.backgroundColor = [UIColor grayColor];
    return table;
}

- (id<PRTableUI>)tableWithSections:(NSArray<id<PRTableSectionUI>> *)sections
{   
    id<PRTableUI> table = [self makeTableWithSections:sections];
    [self addFinalElement:table.aTableView];
    return table;
}

- (FSTweetsTableSectionUI *)tweetSectionWithCells:(NSArray<FSTweetCellUI *> *)cells
                                             keys:(NSDictionary<NSString *,id> *)keys
{
    return [FSTableElementFactory tweetsSectionWithCells:cells keys:keys];
}

- (FSTweetCellUI *)tweetCellWithKeys:(NSDictionary<NSString *, id> *)keys
{
    return [FSTableElementFactory tweetCellWithKeys:keys];
}

#pragma mark - PRBaseScreenUI

- (id<UIViewControllerAnimatedTransitioning>)transitionController
{
    return animationController;
}

@end
