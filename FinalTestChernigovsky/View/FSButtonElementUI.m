//
//  FSButtonElementUI.m
//  FinalTestChernigovsky
//
//  Created by mini on 16.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSButtonElementUI.h"

@implementation FSButtonElementUI

+ (UIButton *) buttonWithFrame:(CGRect)frame
                          text:(NSString *)text
                     textColor:(UIColor *)textColor
                   buttonColor:(UIColor *)buttonColor
{
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitle:text forState:UIControlStateHighlighted];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    button.backgroundColor = buttonColor;
    button.layer.cornerRadius = 4.f;
    return button;
}

@end
