//
//  FSElementUIFactory.h
//  FinalTestChernigovsky
//
//  Created by mini on 16.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FSElementUIFactory : NSObject

+ (UIButton *)buttonWithFrame:(CGRect)frame
                         text:(NSString *)text
                    textColor:(UIColor *)textColor
                  buttonColor:(UIColor *)buttonColor;

+ (UITextField *)fieldWithFrame:(CGRect)frame
                           text:(NSString *)text
                      textColor:(UIColor *)textColor
                     fieldColor:(UIColor *)fieldColor;

+ (UIActivityIndicatorView *)indicatorWithCenter:(CGPoint)center
                                           style:(UIActivityIndicatorViewStyle)style;

- (instancetype)init NS_UNAVAILABLE;

@end
