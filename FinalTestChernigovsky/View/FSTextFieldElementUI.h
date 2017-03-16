//
//  FSTextFieldElementUI.h
//  FinalTestChernigovsky
//
//  Created by mini on 16.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FSTextFieldElementUI : NSObject

+ (UITextField *) fieldWithFrame:(CGRect)frame
                            text:(NSString *)text
                       textColor:(UIColor *)textColor
                      fieldColor:(UIColor *)fieldColor;
- (instancetype) init NS_UNAVAILABLE;

@end
