//
//  FSTweetsPresenter.m
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTweetsPresenter.h"
#import "FSTweetsScreenUI.h"
#import "FSTwitterPost.h"
#import "NSDate+FSDate.h"

@implementation FSTweetsPresenter
{
    FSTweetsScreenUI *screenUI;
    NSArray<FSTwitterPost *> *twitterPosts;
}

- (instancetype)initWithScreenFactory:(FSScreenUIFactory *)factory
{
    assert( nil != factory );
    self = [super initWithScreenFactory:factory];
    typeof(self) __weak weakSelf = self;
    screenUI = [factory makeTweetsScreenUI];
    [self.networkHelper userRequestWithCompletion:^(id data) {
        [weakSelf successResponseWithData:data];
    }];
    return self;
}

- (void)successResponseWithData:(id)data
{
    screenUI.installUIInteractionHandler(YES);
}

#pragma mark - FSBasePresenter

- (void)errorResponse:(NSError *)error
{
    [super errorResponse:error];
    screenUI.installUIInteractionHandler(YES);
}

- (id<PRBaseScreenUI>)screenUI
{
    return screenUI;
}

#pragma mark - Completions

#pragma mark - Handlers

@end
