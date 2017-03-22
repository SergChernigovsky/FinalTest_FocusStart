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
@property (nonatomic, strong, readwrite) FSNetworkHelper *networkHelper;
@end

@implementation FSBasePresenter

- (instancetype)initWithScreenFactory:(FSScreenUIFactory *)factory
{
    self = [super init];
    typeof(self) __weak weakSelf = self;
    self.networkHelper = [[FSNetworkHelper alloc] init];
    self.networkHelper.errorHandler = ^(NSError *error)
    {
        [weakSelf errorResponse:error];
    };
    return self;
}

- (void)errorResponse:(NSError *)error
{
    self.errorHandler(error);
}

-(void)transition
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
