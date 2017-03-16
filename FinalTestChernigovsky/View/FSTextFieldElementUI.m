//
//  FSTextFieldElementUI.m
//  FinalTestChernigovsky
//
//  Created by mini on 16.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTextFieldElementUI.h"

@implementation FSTextFieldElementUI

+ (UITextField *) fieldWithFrame:(CGRect)frame
                            text:(NSString *)text
                       textColor:(UIColor *)textColor
                      fieldColor:(UIColor *)fieldColor
{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.text = text;
    textField.textColor = textColor;
    textField.backgroundColor = fieldColor;
    textField.layer.cornerRadius = 4.f;
    textField.textAlignment = NSTextAlignmentCenter;
    return textField;
}

@end
