//
//  PRKeyEnumerator.h
//  FinalTestChernigovsky
//
//  Created by mini on 14.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PRKeyEnumerator <NSObject>

- (void)enumerateUsingBlock:(void(^)(id key, id object))block;

@end
