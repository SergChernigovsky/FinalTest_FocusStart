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
    self.installUIInteractionHandler(NO);
    return self;
}

- (id<PRTableUI>)tableWithSections:(NSArray<NSArray *> *)sections
{
    assert( nil != sections);
    CGRect tableRect = CGRectMake(0, 60.f, CGRectGetWidth(self.rootView.bounds), CGRectGetHeight(self.rootView.bounds) - 60.f);
    id<PRTableUI> table = [FSTableElementFactory tableWithFrame:tableRect
                                              sectionsWithCells:sections];
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.rootView.bounds), 40.f)];
    footerView.backgroundColor = [FSColors blueTwitterColor];
    table.tableView.backgroundColor = [FSColors blueTwitterColor];
    table.tableView.tableFooterView = footerView;
    [self addFinalElement:table.tableView];
    return table;
}

- (void)makeLoadingElements
{
    CGPoint indicatorPoint = CGPointMake(CGRectGetMidX(self.rootView.bounds),
                                         CGRectGetMidY(self.rootView.bounds));
    [self addLoadingElement:[FSElementUIFactory indicatorWithCenter:indicatorPoint
                                                              style:UIActivityIndicatorViewStyleWhiteLarge]];
}

#pragma mark - PRBaseScreenUI

- (id<UIViewControllerAnimatedTransitioning>)transitionController
{
    return animationController;
}

@end
