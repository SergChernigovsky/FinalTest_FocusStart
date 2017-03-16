//
//  FSTweetsViewController.m
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTweetsViewController.h"
#import "FSTweetsPresenter.h"

@implementation FSTweetsViewController
{
    FSScreenUIFactory *factory;
}

- (instancetype)initWithScreenUIFactory:(FSScreenUIFactory *)screenFactory
{
    assert( nil != screenFactory );
    self = [super initWithScreenUIFactory:screenFactory];
    factory = screenFactory;
    FSTweetsPresenter *presenter = [[FSTweetsPresenter alloc]  initWithScreenFactory:factory];
    self.screenPresenter = presenter;
    return self;
}

@end
