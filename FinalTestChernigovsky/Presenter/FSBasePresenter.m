//
//  FSBasePresenter.m
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBasePresenter.h"

@implementation FSBasePresenter

- (instancetype)initWithScreenFactory:(FSScreenUIFactory *)factory
{
    self = [super init];
    return self;
}

- (id<PRBaseScreenUI>)screenUI
{
    return nil;
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

@end
