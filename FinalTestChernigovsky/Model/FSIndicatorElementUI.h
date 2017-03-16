//
//  FSIndicatorElementUI.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 17.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FSIndicatorElementUI : NSObject

+ (UIActivityIndicatorView *)activityIndicatorWithCenter:(CGPoint)center
                                                   style:(UIActivityIndicatorViewStyle)style;
- (instancetype)init NS_UNAVAILABLE;

@end
