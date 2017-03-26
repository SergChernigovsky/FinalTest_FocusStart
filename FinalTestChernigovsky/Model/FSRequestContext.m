//
//  FSRequestContext.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSRequestContext.h"

@interface FSRequestContext()
@property (nonatomic, strong, readwrite) id<PRKeyEnumerator> keyEnumerator;
@property (nonatomic, strong, readwrite) Class expectedClass;
@end

@implementation FSRequestContext

- (instancetype)initWithKeyEnumerator:(id<PRKeyEnumerator>)keyEnumerator
                        expectedClass:(Class)class
{
    self = [super init];
    self.keyEnumerator = keyEnumerator;
    self.expectedClass = class;
    return self;
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

@end
