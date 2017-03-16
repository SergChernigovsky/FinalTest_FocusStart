//
//  FSTransitionDelegate.m
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTransitionDelegate.h"

@implementation FSTransitionDelegate
{
    id<UIViewControllerAnimatedTransitioning> animationController;
}

- (instancetype)initWithController:(id<UIViewControllerAnimatedTransitioning>)controller
{
    assert( nil != controller );
    self = [super init];
    animationController = controller;
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return animationController;
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

@end
