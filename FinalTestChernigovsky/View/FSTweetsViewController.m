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
    FSTweetsPresenter *presenter = [[FSTweetsPresenter alloc]initWithScreenFactory:factory];
    self.screenPresenter = presenter;
    return self;
}

- (void)completePushToStart
{
    dispatch_async(dispatch_get_main_queue(), ^(void)
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
    });
}

#pragma mark - FSBaseViewController

- (void)completeError:(NSError *)error
{
    typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^(void)
    {
       UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error"
                                                                                message:error.localizedDescription
                                                                         preferredStyle:UIAlertControllerStyleAlert];
       [alertController addAction:[UIAlertAction actionWithTitle:@"Back"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction *action)
        {
            [weakSelf completePushToStart];
        }]];
       [self presentViewController:alertController animated:YES completion:nil];
    });
}

@end
