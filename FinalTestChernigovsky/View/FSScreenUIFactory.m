//
//  FSScreenUIFactory.m
//  04.03
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSScreenUIFactory.h"
#import "FSStartScreenUI.h"
#import "FSTweetsScreenUI.h"

@implementation FSScreenUIFactory

- (FSStartScreenUI *) makeStartScreenUI
{
    return [[FSStartScreenUI alloc] init];
}

- (FSTweetsScreenUI *) makeTweetsScreenUI
{
    return [[FSTweetsScreenUI alloc] init];
}

- (instancetype)init
{
    self = [super init];
    return self;
}

@end
