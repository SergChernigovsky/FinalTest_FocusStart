//
//  FSAppController.m
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSAppController.h"
#import "FSScreenUIFactory.h"
#import "FSStartViewController.h"
#import <UIKit/UIKit.h>

@implementation FSAppController
{
    UIWindow *window;
    UINavigationController *navigationController;
}

- (instancetype)initWithScreenUIFactory:(FSScreenUIFactory *)factory
{
    assert( nil != factory );
    self = [super init];
    [self makeWindow];
    FSStartViewController *vc = [[FSStartViewController alloc] initWithScreenUIFactory:factory];
    navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    window.rootViewController = navigationController;
    [window makeKeyAndVisible];
    return self;
}

- (void)makeWindow{
    window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

@end
