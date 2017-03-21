//
//  PRDeserializeable.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FSDeserializeableProperty;

@protocol PRDeserializeable <NSObject>

+ (NSArray<FSDeserializeableProperty *> *)deserializeableProperties;

@end
