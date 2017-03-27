//
//  FSElementUIFactory.m
//  FinalTestChernigovsky
//
//  Created by mini on 16.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSElementUIFactory.h"
#import "FSButtonElementUI.h"
#import "FSTextFieldElementUI.h"
#import "FSIndicatorElementUI.h"

@implementation FSElementUIFactory

+ (UIButton *)buttonWithFrame:(CGRect)frame
                             text:(NSString *)text
                        textColor:(UIColor *)textColor
                      buttonColor:(UIColor *)buttonColor
{
    return [FSButtonElementUI buttonWithFrame:frame
                                         text:text
                                    textColor:textColor
                                  buttonColor:buttonColor];
}

+ (UITextField *)fieldWithFrame:(CGRect)frame
                               text:(NSString *)text
                          textColor:(UIColor *)textColor
                         fieldColor:(UIColor *)fieldColor
{
    return [FSTextFieldElementUI fieldWithFrame:frame
                                           text:text
                                      textColor:textColor
                                     fieldColor:fieldColor];;
}

+ (UIActivityIndicatorView *)indicatorWithCenter:(CGPoint)center
                                  style:(UIActivityIndicatorViewStyle)style
{
    return [FSIndicatorElementUI activityIndicatorWithCenter:(CGPoint)center
                                                       style:(UIActivityIndicatorViewStyle)style];
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

@end
