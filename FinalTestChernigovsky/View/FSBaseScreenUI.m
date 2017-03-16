//
//  FSBaseScreenUI.m
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseScreenUI.h"

@implementation FSBaseScreenUI
{
    UIView *view;
}

- (instancetype)init
{
    self = [super init];
    [self makeRootView];
    return self;
}

- (void) makeRootView
{
    view = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    view.backgroundColor = [UIColor whiteColor];
}

- (UIView *) rootView
{
    return view;
}

- (id<UIViewControllerAnimatedTransitioning>)transitionController
{
    return nil;
}

@end
