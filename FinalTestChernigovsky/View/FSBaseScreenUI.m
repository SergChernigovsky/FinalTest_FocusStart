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
    NSArray *arrayFinalElements;
    NSArray *arrayLoadingElements;
    UIView *view;
}
@synthesize startFinalUIHandler;
@synthesize topBarHeight;

#pragma mark - init

- (instancetype)init
{
    self = [super init];
    [self makeRootView];
    return self;
}

- (void)makeRootView
{
    view = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    view.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [view addGestureRecognizer:tapGesture];
    typeof(self) __weak weakSelf = self;
    startFinalUIHandler = ^(BOOL isFinal)
    {
        [weakSelf installUIInteraction:isFinal];
    };
    arrayFinalElements = [[NSArray alloc] init];
    arrayLoadingElements = [[NSArray alloc] init];
}

#pragma mark - UIStates

- (void)enumerateFinalElementsWithComletion:(void(^)(UIView *elementView))comletionNormalElements
{
    assert( arrayFinalElements );
    [arrayFinalElements enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        comletionNormalElements((UIView *)obj);
    }];
}

- (void)enumerateLoadingElementsComletion:(void(^)(UIView *elementView))comletionLoadingElements
{
    assert( arrayLoadingElements );
    [arrayLoadingElements enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        comletionLoadingElements((UIView *)obj);
    }];
}

- (void)installUIInteraction:(BOOL)isFinal
{
    [self enumerateFinalElementsWithComletion:^(UIView *elementView)
    {
        dispatch_async(dispatch_get_main_queue(), ^
        {
            elementView.userInteractionEnabled = ( NO != isFinal );
        });
    }];
    [self enumerateLoadingElementsComletion:^(UIView *elementView)
    {
        dispatch_async(dispatch_get_main_queue(), ^
        {
            if( NO != isFinal )
            {
                [elementView removeFromSuperview];
                return;
            }
            [view addSubview:elementView];
        });
    }];
}

- (void)addFinalElement:(UIView *)element
{
    dispatch_async(dispatch_get_main_queue(), ^
    {
        [view addSubview:element];
    });
    NSMutableArray *mutableElements = [arrayFinalElements mutableCopy];
    [mutableElements addObject:element];
    arrayFinalElements = [mutableElements copy];
}

- (void)addLoadingElement:(UIView *)element
{
    NSMutableArray *mutableElements = [arrayLoadingElements mutableCopy];
    [mutableElements addObject:element];
    arrayLoadingElements = [mutableElements copy];
}

- (UIView *)rootView
{
    return view;
}

- (id<UIViewControllerAnimatedTransitioning>)transitionController
{
    return nil;
}

#pragma mark - Gestures

- (void)handleTap:(UITapGestureRecognizer*) tapGesture
{
    return;
}

@end
