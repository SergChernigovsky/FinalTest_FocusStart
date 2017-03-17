//
//  FSStartViewController.m
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSStartViewController.h"
#import "FSScreenUIFactory.h"
#import "FSTweetsViewController.h"
#import "FSStartPresenter.h"

@interface FSStartViewController ()

@end

@implementation FSStartViewController
{
    FSScreenUIFactory *factory;
}

- (instancetype)initWithScreenUIFactory:(FSScreenUIFactory *)screenFactory
{
    assert( nil != screenFactory );
    self = [super initWithScreenUIFactory:screenFactory];
    factory = screenFactory;
    
    FSStartPresenter *presenter = [[FSStartPresenter alloc]initWithScreenFactory:factory];
    typeof(self) __weak weakSelf = self;
    presenter.pushToTweetsHandler = ^
    {
        [weakSelf completePushToTweets];
    };
    self.screenPresenter = presenter;
    return self;
}

- (void)completePushToTweets
{
    dispatch_async(dispatch_get_main_queue(), ^(void)
    {
        FSTweetsViewController *secondViewController = [[FSTweetsViewController alloc] initWithScreenUIFactory:factory];
        [self.navigationController pushViewController:secondViewController
                                             animated:YES];
    });
}

#pragma mark - FSBaseViewController

- (void)completeError:(NSError *)error
{
    dispatch_async(dispatch_get_main_queue(), ^(void)
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error"
                                                                                 message:error.localizedDescription
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleCancel
                                                          handler:^(UIAlertAction *action){}]];
        [self presentViewController:alertController animated:YES completion:nil];
    });
}

@end
