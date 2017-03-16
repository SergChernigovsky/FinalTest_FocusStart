//
//  Tweets.m
//  AnimationTransitionMVP
//
//  Created by  user on 12.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "Tweets.h"
#import "Network.h"
#import "RequestContext.h"
#import "Post.h"

@implementation Tweets
{
    Network *network;
    
    NSString *resultURL;
    NSString *tokenBase64;
    NSDictionary *httpHeader;
    NSData *httpBodyBase64;
    
    NSString *account;
    NSUInteger count;
}

const NSUInteger COUNT = 10;
NSString *const AUTH = @"Authorization";

NSString *const CONSUMER_KEY = @"kcTSCPcKHoUqC7Sn1BCCS4YjE";
NSString *const CONSUMER_SECRET = @"2zsSuDJDRmcSC8dTjne7p54JJitPbwm9o7bXhA5Os6HnGwGFC3";
NSString *const ACCESS_TOKEN = @"840403549863436288-IWnbh83z7buxVwMDUgbapqusv2zYugw";
NSString *const ACCESS_TOKEN_SECRET = @"F9r5QFGC3GCfZbZf2f5b5FnyNrelMkzx66ogO5SkcTCcU";

NSString *const BASE_URL = @"https://api.twitter.com";

NSString *const AUTH_TOKEN = @"/oauth2/token?oauth_token=";
NSString *const HTTP_BODY = @"grant_type=client_credentials";

NSString *const USER_URL = @"/1.1/statuses/user_timeline.json?";
NSString *const REQUEST_COUNT = @"count=";
NSString *const REQUEST_ACCOUNT = @"&screen_name=";

- (instancetype)init
{
    self = [super init];
    return self;
}

- (void)loadTweetsFromAccount:(NSString *)accountName
{
    if( NO == accountName.length )
    {
        accountName = @"chucknorris";
    }
    account = accountName;
    count = COUNT;
    
    [self makeAuthHTTPRequest];
    
    [self authRequest];
}

- (void)makeAuthHTTPRequest
{
    [self makeToken];
    
    resultURL = [NSString stringWithFormat:@"%@%@%@", BASE_URL, AUTH_TOKEN, tokenBase64];
    httpHeader = @{AUTH : [NSString stringWithFormat:@"Basic %@", tokenBase64]};
    httpBodyBase64 = [HTTP_BODY dataUsingEncoding:NSUTF8StringEncoding];
}

- (void)makeToken
{
    NSString *consumerToken = [NSString stringWithFormat:@"%@:%@", CONSUMER_KEY, CONSUMER_SECRET];
    [self encodeToken:consumerToken];
}

- (void)encodeToken:(NSString *)token
{
    NSData *data = [token dataUsingEncoding:NSUTF8StringEncoding];
    tokenBase64 = [data base64EncodedStringWithOptions:0];
}

- (void)authRequest
{
    network = [[Network alloc] init];
    RequestContext *context = [[RequestContext alloc] initWithURL:resultURL method:@"POST" header:httpHeader body:httpBodyBase64 result:ResultTypeObject expectedClass:[Post class]];
    
    typeof(self) __weak weakSelf = self;
    
    [network requestWithContext:context completion:^(NSError *error, id data)
     {
         // check for error is not nil
         [weakSelf handleAuthData:data];
     }];
}

- (void)handleAuthData:(id)data
{
    NSLog(@"%@", data);
    tokenBase64 = data;
    
    if( tokenBase64.length )
    {
        [self makeContentHTTPRequest];
        [self contentRequest];
    }
}

- (void)makeContentHTTPRequest
{
    NSString *requestParam = [NSString stringWithFormat:@"%@%ld%@%@", REQUEST_COUNT, count, REQUEST_ACCOUNT, account];
    resultURL = [NSString stringWithFormat:@"%@%@%@", BASE_URL, USER_URL, requestParam];
    httpHeader = @{AUTH : [NSString stringWithFormat:@"Bearer %@", tokenBase64]};
}

- (void)contentRequest
{
    RequestContext *context = [[RequestContext alloc] initWithURL:resultURL method:@"GET" header:httpHeader body:nil result:ResultTypeArray expectedClass:[Post class]];
    
    typeof(self) __weak weakSelf = self;
    
    [network requestWithContext:context completion:^(NSError *error, id data)
     {
         // check for error is not nil
         [weakSelf handleContent:data];
     }];
}

- (void)handleContent:(id)data
{
    
}

@end
