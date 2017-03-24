//
//  FSKeyHolder.h
//  FinalTestChernigovsky
//
//  Created by mini on 14.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PRKeyEnumerator.h"

@interface FSKeyHolder : NSObject<PRKeyEnumerator>

- (instancetype)init NS_DESIGNATED_INITIALIZER;

- (void) addObject:(id)object forKey:(NSString *)key;

@end
