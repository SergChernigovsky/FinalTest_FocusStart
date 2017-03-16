//
//  FSBaseViewController.m
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseViewController.h"
#import "FSBasePresenter.h"
#import "PRBaseScreenUI.h"
#import "FSBaseScreenUI.h"
#import "FSTransitionDelegate.h"

@interface FSBaseViewController ()<UINavigationControllerDelegate>

@end

@implementation FSBaseViewController

- (instancetype)initWithScreenUIFactory:(FSScreenUIFactory *)screenFactory
{
    self = [super initWithNibName:nil bundle:nil];
    return self;
}

- (void) loadView
{
    assert( nil != self.screenPresenter );
    self.view = self.screenPresenter.screenUI.rootView;
}

- (void)didMoveToParentViewController:(UIViewController *)parent
{
    self.navigationController.delegate = self;
}

- (void)setScreenPresenter:(FSBasePresenter *)screenPresenter
{
    assert( nil != screenPresenter );
    _screenPresenter = screenPresenter;
}

- (id<UIViewControllerTransitioningDelegate>)transitioningDelegate
{
    id<UIViewControllerAnimatedTransitioning> transitionController = self.screenPresenter.screenUI.transitionController;
    if ( nil != transitionController )
    {
        FSTransitionDelegate *delegate = [[FSTransitionDelegate alloc] initWithController:transitionController];
        return delegate;
    }
    return nil;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    return self.screenPresenter.screenUI.transitionController;
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

@end
