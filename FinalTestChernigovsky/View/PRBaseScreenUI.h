//
//  PRBaseScreenUI.h
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol PRBaseScreenUI <NSObject>

@property (nonatomic, strong, readonly, nonnull) UIView *rootView;
@property (nonatomic, strong, readonly, nullable) id<UIViewControllerAnimatedTransitioning> transitionController;
@property (nonatomic, copy, readonly, nonnull) void (^installFinalUIHandler)(BOOL isNormal);

@end
