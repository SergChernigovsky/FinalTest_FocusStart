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
#import "FSTweetCellUI.h"
#import "FSTweetsTableSectionUI.h"

@implementation FSTweetsPresenter
{
    FSTweetsScreenUI *screenUI;
    id<PRTableUI> tableUI;
}

- (instancetype)initWithScreenFactory:(FSScreenUIFactory *)factory
{
    assert( nil != factory );
    self = [super initWithScreenFactory:factory];
    typeof(self) __weak weakSelf = self;
    screenUI = [factory makeTweetsScreenUI];
    screenUI.screenName = [NSString stringWithFormat:@"@%@", [self.networkHelper accountName]];
    [self.networkHelper userRequestWithCompletion:^(id data)
    {
        [weakSelf completeUserRequestWithData:data];
    }];
    return self;
}

#pragma mark - Completions

- (void)completeUserRequestWithData:(id)data
{
    NSArray<FSTwitterPost *> *twitterPosts = (NSArray<FSTwitterPost *> *)data;
    NSArray<FSTweetCellUI *> *tweetCells = [self cellsWithPosts:twitterPosts];
    FSTweetsTableSectionUI *twitterSection = [self twitterSectionWithCells:tweetCells posts:twitterPosts];
    tableUI = [screenUI tableWithSections:@[twitterSection]];
    [self handleFinalUI:YES];
}

#pragma mark - FSTweetsTableSectionUI

- (FSTweetsTableSectionUI *)twitterSectionWithCells:(NSArray<FSTweetCellUI *> *)cells
                                              posts:(NSArray<FSTwitterPost *> *)posts
{
    return [screenUI tweetSectionWithCells:cells
                                      keys:[self sectionDictionaryFromPosts:posts]];
}

- (NSDictionary *)sectionDictionaryFromPosts:(NSArray<FSTwitterPost *> *)posts
{
    FSTwitterPost *post = (FSTwitterPost *)[posts firstObject];
    assert( nil != post.user.name);
    assert( nil != post.user.screen_name);
    return @{@"userName":post.user.name,
             @"userScreenName":post.user.screen_name};
}

#pragma mark - FSTweetCellUI

- (NSArray<FSTweetCellUI *> *)cellsWithPosts:(NSArray<FSTwitterPost *> *)posts
{
    NSMutableArray *cellsArray = [[NSMutableArray alloc] init];
    [posts enumerateObjectsUsingBlock:^(FSTwitterPost * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        FSTweetCellUI *tweetCellUI = [screenUI tweetCellWithKeys:[self cellDictionaryFromPost:obj]];
        [cellsArray addObject:tweetCellUI];
    }];
    return [cellsArray copy];
}

- (NSDictionary *)cellDictionaryFromPost:(FSTwitterPost *)post
{
    FSTwitterUser *tweetUser = ( nil != post.retweeted_status ) ? post.retweeted_status.user : post.user;
    NSString *text = ( nil != post.retweeted_status ) ? post.retweeted_status.text : post.text;
    NSNumber *favoriteCount = ( nil != post.retweeted_status ) ? post.retweeted_status.favorite_count : post.favorite_count;
    return @{@"tweetUserName" : tweetUser.name,
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
    [self handleFinalUI:YES];
}

- (id<PRBaseScreenUI>)screenUI
{
    return screenUI;
}

#pragma mark - Handlers

- (void)handleFinalUI:(BOOL) isFinal
{
    assert( nil != screenUI.startFinalUIHandler );
    screenUI.startFinalUIHandler(isFinal);
}

@end
