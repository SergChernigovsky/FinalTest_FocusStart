//
//  FSNetworkHelper.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 22.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FSNetworkHelper : NSObject

@property (nonatomic, copy, readwrite) void (^errorHandler)(NSError *errorr);

-(instancetype)init NS_DESIGNATED_INITIALIZER;

- (void)openUrlWithString:(NSURL *)url
               screenName:(NSString *)screenName;

- (NSData *)dataWithUrl:(NSURL *)url;

- (void)saveAccessToken:(NSString *)string;

- (void)saveAccountName:(NSString *)name;

- (NSString *)accountName;

- (void)authRequestWithCompletion:(void(^)(id data))completion;

- (void)userRequestWithCompletion:(void(^)(id data))completion;

- (void)userRequestWithSinceID:(NSNumber *)sinceID Completion:(void(^)(id data))completion;

@end
