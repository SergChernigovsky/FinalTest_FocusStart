//
//  FSTweetsPresenter.m
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTweetsPresenter.h"
#import "FSTweetsScreenUI.h"

@implementation FSTweetsPresenter
{
    FSTweetsScreenUI *screenUI;
}

- (instancetype)initWithScreenFactory:(FSScreenUIFactory *)factory
{
    assert( nil != factory );
    self = [super initWithScreenFactory:factory];
    screenUI = [factory makeTweetsScreenUI];
    return self;
}

- (id<PRBaseScreenUI>)screenUI
{
    return screenUI;
}

@end
