//
//  FSNetworkHelper.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 22.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FSNetworkHelper : NSObject

@property (nonatomic, copy, readwrite) void (^errorHandler)(NSError *errorr);

-(instancetype)init NS_DESIGNATED_INITIALIZER;

- (void)saveAccessToken:(NSString *)string;

- (void)saveAccountName:(NSString *)name;

- (NSString *)accountName;

- (void)authRequestWithCompletion:(void(^)(id data))completion;

- (void)userRequestWithCompletion:(void(^)(id data))completion;

@end
