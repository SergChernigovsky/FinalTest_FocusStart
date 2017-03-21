//
//  FSDeserializer.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 21.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PRDeserializer.h"
#import "PRDeserializeable.h"
#import "FSDeserializeableProperty.h"

@interface FSDeserializer : NSObject<PRDeserializer>

- (instancetype)init;

@end
