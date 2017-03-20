//
//  FSTwitterAuth.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSBaseObject.h"

@interface FSTwitterAuth : FSBaseObject

@property (nonatomic, copy, readonly) NSString *access_token;
@property (nonatomic, copy, readonly) NSString *token_type;

@end
