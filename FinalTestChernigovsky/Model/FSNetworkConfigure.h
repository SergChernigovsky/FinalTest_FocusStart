//
//  FSNetworkConfigure.h
//  FinalTestChernigovsky
//
//  Created by mini on 14.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FSNetworkConfigure : NSObject

- (instancetype)init NS_DESIGNATED_INITIALIZER;

- (NSURL *)authUrl;

- (NSDictionary *)authHttpHeaders;

- (NSData *)authHttpBody;

- (NSURL *)contentUrlWithNumberPosts:(NSUInteger)numberPosts;

- (NSDictionary *)contentHttpHeaders;

- (void)saveAccessToken:(NSString *)string;

- (void)saveAccountName:(NSString *)name;

@end
