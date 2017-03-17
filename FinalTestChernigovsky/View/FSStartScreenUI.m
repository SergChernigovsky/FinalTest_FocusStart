//
//  FSStartScreenUI.m
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSStartScreenUI.h"
#import "FSAnimationController.h"
#import "FSColors.h"
#import "FSElementUIFactory.h"

CGFloat const buttonHeight = 30.f;
CGFloat const buttonWidth = 70.f;
CGFloat const textFieldHeight = 30.f;
CGFloat const textFieldWidth = 200.f;

@implementation FSStartScreenUI
{
    UITextField *textField;
    FSAnimationController *animationController;
}
@synthesize arrayNormalElements;
@synthesize arrayLoadingElements;

#pragma mark - init

- (instancetype)init
{
    self = [super init];
    [self makeView];
    typeof(self) __weak weakSelf = self;
    self.installUIInteractionHandler = ^(BOOL isNormal)
    {
        [weakSelf installUIInteraction:isNormal];
    };
    animationController = [[FSAnimationController alloc] init];
    return self;
}

- (void)makeView
{
    self.rootView.backgroundColor = [UIColor lightGrayColor];
    CGRect fieldRect = CGRectMake(CGRectGetMidX(self.rootView.bounds) - textFieldWidth/2,
                                  CGRectGetMidY(self.rootView.bounds) - textFieldHeight/2 - 50.f,
                                  textFieldWidth,
                                  textFieldHeight);
    CGRect buttonRect = CGRectMake(CGRectGetMidX(self.rootView.bounds) - buttonWidth/2,
                                   CGRectGetMidY(self.rootView.bounds) - buttonHeight/2,
                                   buttonWidth,
                                   buttonHeight);
    CGPoint indicatorPoint = CGPointMake(CGRectGetMidX(self.rootView.bounds),
                                         170.f);
    textField = [FSElementUIFactory makeFieldWithFrame:fieldRect
                                                  text:@"chucknorris"
                                             textColor:[UIColor blackColor]
                                            fieldColor:[UIColor whiteColor]];
    UIButton *button = [FSElementUIFactory makeButtonWithFrame:buttonRect
                                                          text:@"Search"
                                                     textColor:[UIColor whiteColor]
                                                   buttonColor:[FSColors blueTwitterColor]];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    arrayNormalElements = @[button, textField];
    arrayLoadingElements = @[[FSElementUIFactory makeIndicatorWithCenter:indicatorPoint
                                                                   style:UIActivityIndicatorViewStyleWhiteLarge]];
    [self enumerateNormalElementsWithComletion:^(UIView *elementView)
    {
        [self.rootView addSubview:elementView];
    }];
    [self installUIInteraction:NO];
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
        [self.rootView addSubview:elementView];
    }];
}

#pragma mark - UIActions

- (void)buttonClick
{
    if( nil != self.buttonClickHandler )
    {
        [self installUIInteraction:NO];
        self.buttonClickHandler(textField.text);
    }
}

#pragma mark - UIGestures

- (void)handleTap:(UITapGestureRecognizer*) tapGesture
{
    [textField resignFirstResponder];
}

#pragma mark - UIAnimationController

- (id<UIViewControllerAnimatedTransitioning>)transitionController
{
    return animationController;
}

@end
