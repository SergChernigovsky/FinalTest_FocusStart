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

@implementation FSTweetsScreenUI
{
    UILabel *label;
    FSAnimationController *animationController;
    NSArray *arrayNormalElements;
    NSArray *arrayLoadingElements;
}

- (instancetype)init
{
    self = [super init];
    [self makeView];
    animationController = [[FSAnimationController alloc] init];
    return self;
}

- (void)makeView
{
    self.rootView.backgroundColor = [UIColor lightGrayColor];
    CGPoint indicatorPoint = CGPointMake(CGRectGetMidX(self.rootView.bounds),
                                         170.f);
    arrayLoadingElements = @[[FSElementUIFactory makeIndicatorWithCenter:indicatorPoint
                                                                   style:UIActivityIndicatorViewStyleWhiteLarge]];
}

- (id<UIViewControllerAnimatedTransitioning>)transitionController
{
    return animationController;
}

@end
