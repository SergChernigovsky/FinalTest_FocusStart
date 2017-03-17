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
    NSArray *arrayNormalElements;
    NSArray *arrayLoadingElements;
}

#pragma mark - init

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
    
    self.installUIInteractionHandler(NO);
}

#pragma mark - UIActions

- (void)buttonClick
{
    if( nil != self.buttonClickHandler )
    {
        self.installUIInteractionHandler(NO);
        self.buttonClickHandler(textField.text);
    }
}

#pragma mark - UIGestures

- (void)handleTap:(UITapGestureRecognizer*) tapGesture
{
    [textField resignFirstResponder];
}

#pragma mark - FSBaseScreenUI

- (id<UIViewControllerAnimatedTransitioning>)transitionController
{
    return animationController;
}

@end
