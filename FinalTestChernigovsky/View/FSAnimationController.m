//
//  FSAnimationController.m
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSAnimationController.h"

@implementation FSAnimationController

- (instancetype)init
{
    self = [super init];
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    toView.alpha = 0.0f;
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformScale(transform, 0.001f, 0.001f);
    toView.transform = transform;
    [transitionContext.containerView addSubview:toView];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^
     {
         fromView.alpha = 0.0f;
         toView.alpha = 1.0f;
         toView.transform = CGAffineTransformIdentity;
     } completion:^(BOOL finished)
     {
         [transitionContext completeTransition:finished];
     }];
}

@end
