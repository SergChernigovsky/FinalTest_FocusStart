//
//  FSStartPresenter.m
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSStartPresenter.h"
#import "FSStartScreenUI.h"
#import "FSNetwork.h"
#import "FSTwitterAuth.h"
#import "FSNetworkConfigure.h"
#import "FSRequestContext.h"
#import "FSKeyHolder.h"

@implementation FSStartPresenter
{
    FSStartScreenUI *screenUI;
    
    FSNetwork *network;
    FSNetworkConfigure *networkConfigure;
    FSRequestContext *requestContext;
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
    network = [[FSNetwork alloc] init];
    networkConfigure = [[FSNetworkConfigure alloc] init];
    requestContext = [self makeRequestContextWithConfigure:networkConfigure];
    [network requestWithContext:requestContext completion:^(NSError *error, id data)
    {
        [weakSelf completeNetworkWithData:data error:error];
    }];
    return self;
}

- (FSRequestContext *)makeRequestContextWithConfigure:(FSNetworkConfigure *)aNetworkConfigure
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

#pragma mark - Completions

- (void)completeButtonClick:(NSString *)accountName
{
    [networkConfigure saveAccountName:accountName];
    if( nil != twitterAuth )
    {
        screenUI.installUIInteractionHandler(YES);
        [self handlePushToTweets];
        return;
    }
    typeof(self) __weak weakSelf = self;
    [network requestWithContext:requestContext completion:^(NSError *error, id data)
    {
        if( [weakSelf completeNetworkWithData:data error:error] )
        {
            [weakSelf handlePushToTweets];
        }
    }];
}

- (BOOL)completeNetworkWithData:(NSData *)data
                          error:(NSError *)error
{
    screenUI.installUIInteractionHandler(YES);
    if( nil != error )
    {
        [self handleError:error];
        return NO;
    }
    twitterAuth = (FSTwitterAuth *)data;
    NSLog(@"%@", twitterAuth.description);
    [networkConfigure saveAccessToken:twitterAuth.access_token];
    return YES;
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
