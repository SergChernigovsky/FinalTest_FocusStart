//
//  FSTransitionDelegate.h
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FSTransitionDelegate : NSObject <UIViewControllerTransitioningDelegate>

- (instancetype)initWithController:(id<UIViewControllerAnimatedTransitioning>)controller NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

@end
