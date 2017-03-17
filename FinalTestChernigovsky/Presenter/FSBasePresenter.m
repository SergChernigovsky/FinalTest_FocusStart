//
//  FSBasePresenter.m
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBasePresenter.h"
#import "FSBaseScreenUI.h"

@interface FSBasePresenter()
@property (nonatomic, strong, readwrite) FSNetwork *network;
@property (nonatomic, strong, readwrite) FSNetworkConfigure *networkConfigure;
@end

@implementation FSBasePresenter

- (instancetype)initWithScreenFactory:(FSScreenUIFactory *)factory
{
    self = [super init];
    self.network = [[FSNetwork alloc] init];
    self.networkConfigure = [[FSNetworkConfigure alloc] init];
    return self;
}

- (void)makeRequestWithCompletion:(void(^)(void))completion{
    typeof(self) __weak weakSelf = self;
    FSRequestContext *requestContext = [self requestContextWithConfigure:self.networkConfigure];
    [self.network requestWithContext:requestContext
                          completion:^(NSError *error, id data)
    {
        if( nil != error )
        {
            [weakSelf errorResponse:error];
            return;
        }
        [weakSelf successResponseWithData:data];
        completion();
    }];
}

- (nullable FSRequestContext *)requestContextWithConfigure:(FSNetworkConfigure *)aNetworkConfigure
{
    return nil;
}

- (void)errorResponse:(NSError *)error
{
    self.errorHandler(error);
}

- (void)successResponseWithData:(NSData *)data
{
    return;
}

- (id<PRBaseScreenUI>)screenUI
{
    return nil;
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

@end
