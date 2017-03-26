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
#import "FSTwitterUser.h"
#import "NSDate+FSDate.h"
#import "PRTableUI.h"

@implementation FSTweetsPresenter
{
    FSTweetsScreenUI *screenUI;
    NSArray<FSTwitterPost *> *twitterPosts;
    id<PRTableUI> tableUI;
}

- (instancetype)initWithScreenFactory:(FSScreenUIFactory *)factory
{
    assert( nil != factory );
    self = [super initWithScreenFactory:factory];
    typeof(self) __weak weakSelf = self;
    screenUI = [factory makeTweetsScreenUI];
    [self.networkHelper userRequestWithCompletion:^(id data)
    {
        [weakSelf successResponseWithData:data];
    }];
    return self;
}

- (void)successResponseWithData:(id)data
{
    twitterPosts = (NSArray<FSTwitterPost *> *)data;
    NSMutableArray *section = [[NSMutableArray alloc] init];
    [twitterPosts enumerateObjectsUsingBlock:^(FSTwitterPost * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        id<PRCellUI> cellUI = [screenUI tweetCellWithKeys:[self dictionaryFromPost:obj]];
        [section addObject:cellUI];
    }];
    tableUI = [screenUI tableWithSections:[NSArray arrayWithObject:[section copy]]];
    screenUI.installFinalUIHandler(YES);
}

- (NSDictionary *)dictionaryFromPost:(FSTwitterPost *)post
{
    FSTwitterUser *tweetUser = ( nil != post.retweeted_status ) ? post.retweeted_status.user : post.user;
    NSString *text = ( nil != post.retweeted_status ) ? post.retweeted_status.text : post.text;
    NSNumber *favoriteCount = ( nil != post.retweeted_status ) ? post.retweeted_status.favorite_count : post.favorite_count;
    return @{@"retweetedUserName" : post.user.name,
             @"tweetUserName" : tweetUser.name,
             @"tweetUserScreenName" : tweetUser.screen_name,
             @"retweetedStatus" : @( nil == post.retweeted_status),
             @"retweetCount" : post.retweet_count,
             @"favoriteCount" : favoriteCount,
             @"text" : text,
             @"createdAt" : [NSDate fs_stringFromDate:post.created_at]};
}

#pragma mark - FSBasePresenter

- (void)errorResponse:(NSError *)error
{
    [super errorResponse:error];
    screenUI.installFinalUIHandler(YES);
}

- (id<PRBaseScreenUI>)screenUI
{
    return screenUI;
}

#pragma mark - Completions

#pragma mark - Handlers

@end
