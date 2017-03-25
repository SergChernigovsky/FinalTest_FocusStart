//
//  FSStartPresenter.m
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSStartPresenter.h"
#import "FSStartScreenUI.h"
#import "FSTwitterAuth.h"

@implementation FSStartPresenter
{
    FSStartScreenUI *screenUI;
    FSTwitterAuth *twitterAuth;
}

- (instancetype)initWithScreenFactory:(FSScreenUIFactory *)factory
{
    assert( nil != factory );
    self = [super initWithScreenFactory:factory];
    typeof(self) __weak weakSelf = self;
    screenUI = [factory makeStartScreenUI];
    screenUI.buttonClickHandler = ^(NSString *accountName)
    {
        [weakSelf completeButtonClick:accountName];
    };
    [self.networkHelper authRequestWithCompletion:^(id data) {
        [weakSelf successResponseWithData:data];
    }];
    return self;
}

- (void)successResponseWithData:(id)data
{
    twitterAuth = (FSTwitterAuth *)data;
    NSLog(@"%@", twitterAuth.description);
    [self.networkHelper saveAccessToken:twitterAuth.access_token];
    screenUI.installFinalUIHandler(YES);
}

#pragma mark - FSBasePresenter

- (id<PRBaseScreenUI>)screenUI
{
    return screenUI;
}

- (void)errorResponse:(NSError *)error
{
    [super errorResponse:error];
    screenUI.installFinalUIHandler(YES);
}

- (void)transition
{
    screenUI.installFinalUIHandler(YES);
}

#pragma mark - Completions

- (void)completeButtonClick:(NSString *)accountName
{
    [self.networkHelper saveAccountName:accountName];
    if( nil != twitterAuth )
    {
        [self handlePushToTweets];
        return;
    }
    typeof(self) __weak weakSelf = self;
    [self.networkHelper authRequestWithCompletion:^(id data)
    {
        [weakSelf successResponseWithData:data];
        [self handlePushToTweets];
    }];
}

#pragma mark - Handlers

- (void)handlePushToTweets
{
    assert( nil != self.pushToTweetsHandler );
    self.pushToTweetsHandler();
}

@end
