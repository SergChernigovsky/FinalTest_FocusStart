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

CGFloat const buttonHeight = 35.f;
CGFloat const buttonWidth = 70.f;
CGFloat const textFieldHeight = 35.f;
CGFloat const textFieldWidth = 250.f;

@interface FSStartScreenUI()<UITextFieldDelegate>
@end

@implementation FSStartScreenUI
{
    UITextField *textField;
    FSAnimationController *animationController;
}

#pragma mark - init

- (instancetype)init
{
    self = [super init];
    self.rootView.backgroundColor = [UIColor grayColor];
    animationController = [[FSAnimationController alloc] init];
    textField = [self makeTextField];
    textField.delegate = self;
    [self addFinalElement:textField];
    [self addFinalElement:[self makeButtonSearch]];
    [self addLoadingElement:[self makeActivityIndicator]];
    self.startFinalUIHandler(NO);
    return self;
}
//@"chucknorris"
- (UITextField *)makeTextField
{
    CGRect textFieldRect = CGRectMake(CGRectGetMidX(self.rootView.bounds) - textFieldWidth/2,
                                  CGRectGetMidY(self.rootView.bounds) - textFieldHeight/2 - 50.f,
                                  textFieldWidth,
                                  textFieldHeight);
    UITextField *aTextField = [FSElementUIFactory fieldWithFrame:textFieldRect
                                              text:@"sergeymeza"
                                         textColor:[UIColor blackColor]
                                        fieldColor:[UIColor whiteColor]];
    return aTextField;
}

- (UIButton *)makeButtonSearch
{
    CGRect buttonRect = CGRectMake(CGRectGetMidX(self.rootView.bounds) - buttonWidth/2,
                                   CGRectGetMidY(self.rootView.bounds) - buttonHeight/2,
                                   buttonWidth,
                                   buttonHeight);
    UIButton *button = [FSElementUIFactory buttonWithFrame:buttonRect
                                                      text:@"Search"
                                                 textColor:[UIColor whiteColor]
                                               buttonColor:[FSColors blueTwitterColor]];
    [button addTarget:self action:@selector(buttonSearchClick) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (UIActivityIndicatorView *)makeActivityIndicator
{
    CGPoint indicatorPoint = CGPointMake(CGRectGetMidX(self.rootView.bounds),
                                         170.f);
    return [FSElementUIFactory indicatorWithCenter:indicatorPoint
                                             style:UIActivityIndicatorViewStyleWhiteLarge];
}

#pragma mark - PRBaseScreenUI

- (id<UIViewControllerAnimatedTransitioning>)transitionController
{
    return animationController;
}

- (void)handleTap:(UITapGestureRecognizer*)tapGesture
{
    [textField resignFirstResponder];
}

#pragma mark - UIActions

- (void)buttonSearchClick
{
    if( nil != self.buttonClickHandler )
    {
        self.startFinalUIHandler(NO);
        self.buttonClickHandler(textField.text);
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self buttonSearchClick];
    return YES;
}

@end
