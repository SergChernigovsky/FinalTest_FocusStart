//
//  FSTwitterAuth.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PRDeserializeable.h"

@interface FSTwitterAuth : NSObject<PRDeserializeable>

@property (nonatomic, copy, readonly) NSString *access_token;
@property (nonatomic, copy, readonly) NSString *token_type;
- (instancetype)init NS_DESIGNATED_INITIALIZER;

@end
