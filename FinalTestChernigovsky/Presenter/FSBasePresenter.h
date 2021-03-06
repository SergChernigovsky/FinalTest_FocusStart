//
//  FSBasePresenter.h
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSScreenUIFactory.h"
#import "FSNetworkHelper.h"
#import "PRBaseScreenUI.h"

@protocol PRBaseScreenUI;

@interface FSBasePresenter : NSObject

@property (nonatomic, strong, readwrite) id<PRBaseScreenUI> screenUI;
@property (nonatomic, strong, readonly) FSNetworkHelper *networkHelper;
@property (nonatomic, copy, readwrite) void(^errorHandler)(NSError *error);

- (instancetype)initWithScreenFactory:(FSScreenUIFactory *)factory NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

- (void)errorResponse:(NSError *)error;

- (void)transition;

@end
