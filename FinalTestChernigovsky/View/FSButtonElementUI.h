//
//  FSButtonElementUI.h
//  FinalTestChernigovsky
//
//  Created by mini on 16.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FSButtonElementUI : NSObject

+ (UIButton *) buttonWithFrame:(CGRect)frame
                          text:(NSString *)text
                     textColor:(UIColor *)textColor
                   buttonColor:(UIColor *)buttonColor;
- (instancetype) init NS_UNAVAILABLE;

@end
