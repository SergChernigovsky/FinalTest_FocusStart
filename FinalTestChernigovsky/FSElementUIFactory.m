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

@implementation FSElementUIFactory

+ (UIButton *) makeButtonWithFrame:(CGRect)frame
                              text:(NSString *)text
                         textColor:(UIColor *)textColor
                       buttonColor:(UIColor *)buttonColor
{
    return [FSButtonElementUI buttonWithFrame:frame
                                         text:text
                                    textColor:textColor
                                  buttonColor:buttonColor];
}

+ (UITextField *) makeFieldWithFrame:(CGRect)frame
                                text:(NSString *)text
                           textColor:(UIColor *)textColor
                          fieldColor:(UIColor *)fieldColor
{
    return [FSTextFieldElementUI fieldWithFrame:frame
                                           text:text
                                      textColor:textColor
                                     fieldColor:fieldColor];;
}

@end
