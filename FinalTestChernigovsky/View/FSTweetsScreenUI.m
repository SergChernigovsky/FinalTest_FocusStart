//
//  FSTweetsScreenUI.m
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTweetsScreenUI.h"
#import "FSAnimationController.h"

@implementation FSTweetsScreenUI
{
    UILabel *label;
    FSAnimationController *animationController;
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
    self.rootView.backgroundColor = [UIColor whiteColor];
}

- (id<UIViewControllerAnimatedTransitioning>)transitionController
{
    return animationController;
}

@end
