//
//  PRDeserializeable.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PRDeserializeable <NSObject>

+ (NSArray<NSString *> *)deserializeableProperties;
+ (SEL)deserializeableSelector;

@end
