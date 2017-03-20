//
//  FSObject.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 18.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PRDeserializeable.h"

@interface FSBaseObject : NSObject<PRDeserializeable>

- (instancetype)init NS_DESIGNATED_INITIALIZER;
- (SEL)deserializeSelector;

@end
