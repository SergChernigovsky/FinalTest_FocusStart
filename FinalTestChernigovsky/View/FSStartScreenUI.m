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

#pragma mark - init

- (instancetype)init
{
    self = [super init];
    self.rootView.backgroundColor = [UIColor grayColor];
    animationController = [[FSAnimationController alloc] init];
    return self;
}

#pragma mark - PRBaseScreenUI

- (NSArray *)arrayNormalElements
{
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
    UIButton *button = [FSElementUIFactory makeButtonWithFrame:buttonRect
                                                          text:@"Search"
                                                     textColor:[UIColor whiteColor]
                                                   buttonColor:[FSColors blueTwitterColor]];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    return @[button, textField];
}

- (NSArray *)arrayLoadingElements
{
    CGPoint indicatorPoint = CGPointMake(CGRectGetMidX(self.rootView.bounds),
                                         170.f);
    return @[[FSElementUIFactory makeIndicatorWithCenter:indicatorPoint
                                                   style:UIActivityIndicatorViewStyleWhiteLarge]];
}

- (id<UIViewControllerAnimatedTransitioning>)transitionController
{
    return animationController;
}

- (void)handleTap:(UITapGestureRecognizer*)tapGesture
{
    [textField resignFirstResponder];
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

@end
