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
    NSArray *arrayNormalElements;
    NSArray *arrayLoadingElements;
    UIView *view;
}
@synthesize installUIInteractionHandler;

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
    installUIInteractionHandler = ^(BOOL isNormal){
        [weakSelf installUIInteraction:isNormal];
    };
    [self enumerateNormalElementsWithComletion:^(UIView *elementView)
    {
        [view addSubview:elementView];
    }];
}

- (void)enumerateNormalElementsWithComletion:(void(^)(UIView *elementView))comletionNormalElements
{
    dispatch_async(dispatch_get_main_queue(), ^(void)
   {
       assert( arrayNormalElements );
       [arrayNormalElements enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
        {
            comletionNormalElements((UIView *)obj);
        }];
   });
}

- (void)enumerateLoadingElementsComletion:(void(^)(UIView *elementView))comletionLoadingElements
{
    dispatch_async(dispatch_get_main_queue(), ^(void)
    {
       assert( arrayLoadingElements );
       [arrayLoadingElements enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
       {
           comletionLoadingElements((UIView *)obj);
       }];
    });
}

- (void)installUIInteraction:(BOOL)isNormal
{
    
    [self enumerateNormalElementsWithComletion:^(UIView *elementView)
    {
         elementView.userInteractionEnabled = ( NO != isNormal );
    }];
    [self enumerateLoadingElementsComletion:^(UIView *elementView)
    {
        if( NO != isNormal )
        {
            [elementView removeFromSuperview];
            return;
        }
        [view addSubview:elementView];
    }];
}

- (void)handleTap:(UITapGestureRecognizer*) tapGesture
{
    return;
}

- (NSArray *)arrayNormalElements
{
    return nil;
}

- (NSArray *)arrayLoadingElements
{
    return nil;
}

- (id<PRBaseScreenUI>)rootView
{
    return view;
}


@end
