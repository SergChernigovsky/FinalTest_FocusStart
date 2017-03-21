//
//  FSTweetsPresenter.m
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTweetsPresenter.h"
#import "FSTweetsScreenUI.h"
#import "FSTwitterPost.h"
#import "NSDate+FSDate.h"

@implementation FSTweetsPresenter
{
    FSTweetsScreenUI *screenUI;
    NSArray<FSTwitterPost *> *twitterPosts;
}

- (instancetype)initWithScreenFactory:(FSScreenUIFactory *)factory
{
    assert( nil != factory );
    self = [super initWithScreenFactory:factory];
    screenUI = [factory makeTweetsScreenUI];
    [self makeRequestWithCompletion:^{}];
    return self;
}

#pragma mark - FSBasePresenter

- (FSRequestContext *)requestContextWithConfigure:(FSNetworkConfigure *)aNetworkConfigure
{
    FSKeyHolder<PRKeyEnumerator> *aKeyHolder = [[FSKeyHolder alloc] init];
    [aKeyHolder addObject:[aNetworkConfigure contentUrlWithNumberPosts:20] forKey:@"URL"];
    [aKeyHolder addObject:[aNetworkConfigure contentHttpHeaders] forKey:@"allHTTPHeaderFields"];
    [aKeyHolder addObject:@"GET" forKey:@"HTTPMethod"];
    return [[FSRequestContext alloc] initWithKeyEnumerator:aKeyHolder
                                             expectedClass:[FSTwitterPost class]
                                          responseDataType:ResponseDataTypeArray];
}

- (void)successResponseWithData:(NSData *)data
{
    NSLog(@"%@", (NSArray *)data);
    screenUI.installUIInteractionHandler(YES);
}

- (id<PRBaseScreenUI>)screenUI
{
    return screenUI;
}

#pragma mark - Completions

#pragma mark - Handlers

- (void)handleError:(NSError *)error
{
    assert( nil != self.errorHandler );
    self.errorHandler(error);
}

@end
