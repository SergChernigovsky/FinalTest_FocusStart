//
//  FSElementUIFactory.h
//  FinalTestChernigovsky
//
//  Created by mini on 16.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FSElementUIFactory : NSObject

+ (UIButton *) makeButtonWithFrame:(CGRect)frame
                              text:(NSString *)text
                         textColor:(UIColor *)textColor
                       buttonColor:(UIColor *)buttonColor;
+ (UITextField *) makeFieldWithFrame:(CGRect)frame
                                text:(NSString *)text
                           textColor:(UIColor *)textColor
                          fieldColor:(UIColor *)fieldColor;

@end
