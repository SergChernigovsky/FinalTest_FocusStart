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

@property (nonatomic, strong, readwrite) id<PRBaseScreenUI> screenUI;
@property (nonatomic, copy, readwrite) void (^errorHandler)(NSError *errorr);
@property (nonatomic, strong, readonly) FSNetwork *network;
@property (nonatomic, strong, readonly) FSNetworkConfigure *networkConfigure;

- (instancetype)initWithScreenFactory:(FSScreenUIFactory *)factory NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;
- (void)makeRequestWithCompletion:(void(^)(void))completion;
- (FSRequestContext *)requestContextWithConfigure:(FSNetworkConfigure *)aNetworkConfigure;
- (void)successResponseWithData:(NSData *)data;
- (void)errorResponse:(NSError *)error;
- (void)transition;

@end
