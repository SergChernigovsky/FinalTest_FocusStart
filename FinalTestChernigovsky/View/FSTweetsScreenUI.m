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
    self.rootView.gestureRecognizers = @[];
    return self;
}

- (UIActivityIndicatorView *)makeActivityIndicator
{
    CGPoint indicatorPoint = CGPointMake(CGRectGetMidX(self.rootView.bounds),
                                         CGRectGetMidY(self.rootView.bounds));
    return [FSElementUIFactory indicatorWithCenter:indicatorPoint
                                             style:UIActivityIndicatorViewStyleWhiteLarge];
}

- (FSTwitterTableUI *)tableWithSections:(NSArray<id<PRTableSectionUI>> *)sections
{   
    assert( nil != sections);
    FSTwitterTableUI *table = [FSTableElementFactory twitterTableWithFrame:self.rootView.bounds
                                                     sectionsWithCells:sections
                                                              topBarHeight:self.topBarHeight];
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
