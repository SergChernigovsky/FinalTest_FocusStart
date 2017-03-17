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
    screenUI = [factory makeStartScreenUI];
    typeof(self) __weak weakSelf = self;
    screenUI.buttonClickHandler = ^(NSString *accountName)
    {
        [weakSelf completeButtonClick:accountName];
    };
    [self makeRequestWithCompletion:^
    {
        screenUI.installUIInteractionHandler(YES);
    }];
    return self;
}

#pragma mark - FSBasePresenter

- (FSRequestContext *)requestContextWithConfigure:(FSNetworkConfigure *)aNetworkConfigure
{
    FSKeyHolder<PRKeyEnumerator> *aKeyHolder = [[FSKeyHolder alloc] init];
    [aKeyHolder addObject:[aNetworkConfigure authUrl] forKey:@"URL"];
    [aKeyHolder addObject:[aNetworkConfigure authHttpHeaders] forKey:@"allHTTPHeaderFields"];
    [aKeyHolder addObject:@"POST" forKey:@"HTTPMethod"];
    [aKeyHolder addObject:[aNetworkConfigure authHttpBody] forKey:@"HTTPBody"];
    return [[FSRequestContext alloc] initWithKeyEnumerator:aKeyHolder
                                             expectedClass:[FSTwitterAuth class]
                                          responseDataType:ResponseDataTypeDictionary];
}

- (id<PRBaseScreenUI>)screenUI
{
    return screenUI;
}

- (void)successResponseWithData:(NSData *)data
{
    twitterAuth = (FSTwitterAuth *)data;
    [self.networkConfigure saveAccessToken:twitterAuth.access_token];
    screenUI.installUIInteractionHandler(YES);
}

- (void)errorResponse:(NSError *)error
{
    [super errorResponse:error];
    screenUI.installUIInteractionHandler(YES);
}

- (void)transition
{
    screenUI.installUIInteractionHandler(YES);
}

#pragma mark - Completions

- (void)completeButtonClick:(NSString *)accountName
{
    [self.networkConfigure saveAccountName:accountName];
    if( nil != twitterAuth )
    {
        [self handlePushToTweets];
        return;
    }
    [self makeRequestWithCompletion:^
    {
        [self handlePushToTweets];
    }];
}

#pragma mark - Handlers

- (void)handlePushToTweets
{
    assert( nil != self.pushToTweetsHandler );
    self.pushToTweetsHandler();
}

- (void)handleError:(NSError *)error
{
    assert( nil != self.errorHandler );
    self.errorHandler(error);
}

@end
