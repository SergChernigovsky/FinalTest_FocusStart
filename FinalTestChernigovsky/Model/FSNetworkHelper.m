//
//  FSNetworkHelper.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 22.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSNetworkHelper.h"
#import "FSNetwork.h"
#import "FSNetworkConfigure.h"
#import "FSRequestContext.h"
#import "FSKeyHolder.h"
#import "FSTwitterAuth.h"
#import "FSTwitterPost.h"

@implementation FSNetworkHelper
{
    FSNetwork *network;
    FSNetworkConfigure *networkConfigure;
}

- (instancetype)init
{
    self = [super init];
    network = [[FSNetwork alloc] init];
    networkConfigure = [[FSNetworkConfigure alloc] init];
    return self;
}

- (void)handleError:(NSError *)error
{
    self.errorHandler(error);
}

- (NSData *)dataWithUrl:(NSURL *)url
{
    assert( nil != url);
    return [NSData dataWithContentsOfURL:url];
}

- (void)saveAccessToken:(NSString *)string
{
    [networkConfigure saveAccessToken:string];
}

- (void)saveAccountName:(NSString *)name
{
    [networkConfigure saveAccountName:name];
}

- (NSString *)accountName
{
    return [networkConfigure accountName];
}

- (void)authRequestWithCompletion:(void(^)(id data))completion
{
    typeof(self) __weak weakSelf = self;
    FSRequestContext *requestContext = [self authRequestContextWithConfigure:networkConfigure];
    [network requestWithContext:requestContext
                     completion:^(NSError *error, id data)
     {
         if( nil != error )
         {
             [weakSelf handleError:error];
             return;
         }
         completion(data);
     }];
}

- (void)userRequestWithCompletion:(void(^)(id data))completion
{
    typeof(self) __weak weakSelf = self;
    FSRequestContext *requestContext = [self userRequestContextWithConfigure:networkConfigure];
    [network requestWithContext:requestContext
                     completion:^(NSError *error, id data)
     {
         if( nil != error )
         {
             [weakSelf handleError:error];
             return;
         }
         completion(data);
     }];
}

- (FSRequestContext *)authRequestContextWithConfigure:(FSNetworkConfigure *)aNetworkConfigure
{
    FSKeyHolder<PRKeyEnumerator> *aKeyHolder = [[FSKeyHolder alloc] init];
    [aKeyHolder addObject:[aNetworkConfigure authUrl] forKey:@"URL"];
    [aKeyHolder addObject:[aNetworkConfigure authHttpHeaders] forKey:@"allHTTPHeaderFields"];
    [aKeyHolder addObject:@"POST" forKey:@"HTTPMethod"];
    [aKeyHolder addObject:[aNetworkConfigure authHttpBody] forKey:@"HTTPBody"];
    return [[FSRequestContext alloc] initWithKeyEnumerator:aKeyHolder
                                             expectedClass:[FSTwitterAuth class]];
}

- (FSRequestContext *)userRequestContextWithConfigure:(FSNetworkConfigure *)aNetworkConfigure
{
    FSKeyHolder<PRKeyEnumerator> *aKeyHolder = [[FSKeyHolder alloc] init];
    [aKeyHolder addObject:[aNetworkConfigure contentUrlWithNumberPosts:20] forKey:@"URL"];
    [aKeyHolder addObject:[aNetworkConfigure contentHttpHeaders] forKey:@"allHTTPHeaderFields"];
    [aKeyHolder addObject:@"GET" forKey:@"HTTPMethod"];
    return [[FSRequestContext alloc] initWithKeyEnumerator:aKeyHolder
                                             expectedClass:[FSTwitterPost class]];
}

@end
