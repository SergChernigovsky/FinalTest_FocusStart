//
//  FSRequestContext.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PRKeyEnumerator;

@interface FSRequestContext : NSObject

@property (nonatomic, strong, readonly) id<PRKeyEnumerator> keyEnumerator;
@property (nonatomic, strong, readonly) Class expectedClass;

- (instancetype)initWithKeyEnumerator:(id<PRKeyEnumerator>)keyEnumerator
                        expectedClass:(Class)class;

- (instancetype)init NS_UNAVAILABLE;

@end
