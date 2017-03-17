//
//  FSBasePresenter.h
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSScreenUIFactory.h"
#import "FSNetwork.h"
#import "FSNetworkConfigure.h"
#import "FSRequestContext.h"
#import "FSKeyHolder.h"

@protocol PRBaseScreenUI;

@interface FSBasePresenter : NSObject

@property (nonatomic, strong, readonly) id<PRBaseScreenUI> screenUI;

- (instancetype)initWithScreenFactory:(FSScreenUIFactory *)factory NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

@end
