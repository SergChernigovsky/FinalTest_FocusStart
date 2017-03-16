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
    UIButton *button;
    UITextField *textField;
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
    CGRect fieldRect = CGRectMake(CGRectGetMidX(self.rootView.bounds) - textFieldWidth/2,
                                  CGRectGetMidY(self.rootView.bounds) - textFieldHeight/2 - 50.f,
                                  textFieldWidth,
                                  textFieldHeight);
    CGRect buttonRect = CGRectMake(CGRectGetMidX(self.rootView.bounds) - buttonWidth/2,
                                   CGRectGetMidY(self.rootView.bounds) - buttonHeight/2,
                                   buttonWidth,
                                   buttonHeight);
    textField = [FSElementUIFactory makeFieldWithFrame:fieldRect
                                                  text:@"chucknorris"
                                             textColor:[UIColor blackColor]
                                            fieldColor:[UIColor whiteColor]];
    button = [FSElementUIFactory makeButtonWithFrame:buttonRect
                                                text:@"Search"
                                           textColor:[UIColor whiteColor]
                                         buttonColor:[FSColors blueTwitterColor]];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    arrayNormalElements = @[button, textField];
    arrayLoadingElements = @[];
    [self enumerateNormalElementsWithComletion:^(UIView *elementView)
    {
        
    }
    LoadingElementsComletion:^(UIView *elementView)
    {
        
    }];
}


- (void)enumerateNormalElementsWithComletion:(void(^)(UIView *elementView))comletionNormalElements
                    LoadingElementsComletion:(void(^)(UIView *elementView))comletionLoadingElements{
    assert( arrayNormalElements );
    assert( arrayLoadingElements );
    [arrayNormalElements enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        comletionNormalElements((UIView *)obj);
    }];
    [arrayLoadingElements enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        comletionLoadingElements((UIView *)obj);
    }];
}

- (void)stateIsNormal:(BOOL)normal
{
    BOOL __block normalState = normal;
    [self enumerateElements:arrayNormalElements comletion:^(id element) {
        UIView *view = (UIView *)element;
        view.hidden = normalState;
    }];
    [self enumerateElements:arrayLoadingElements comletion:^(id element) {
        UIView *view = (UIView *)element;
        view.hidden = normalState;
    }];
}

- (void)buttonClick
{
    if( nil != self.buttonClickHandler )
    {
        [self]
        self.buttonClickHandler(textField.text);
    }
}

- (id<UIViewControllerAnimatedTransitioning>)transitionController
{
    return animationController;
}

@end
