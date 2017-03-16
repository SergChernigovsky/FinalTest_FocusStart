//
//  FSIndicatorElementUI.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 17.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSIndicatorElementUI.h"

@implementation FSIndicatorElementUI

+ (UIActivityIndicatorView *)activityIndicatorWithCenter:(CGPoint)center
                                                  style:(UIActivityIndicatorViewStyle)style
{
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
    indicator.center = CGPointMake(center.x, center.y);
    [indicator startAnimating];
    return indicator;
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

@end
