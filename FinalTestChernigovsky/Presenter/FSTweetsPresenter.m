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
#import "PRTableUI.h"
#import "FSTweetCellUI.h"
#import "FSTweetsTableSectionUI.h"
#import "FSTwitterTableUI.h"

NSUInteger const postsLimit = 20;

@implementation FSTweetsPresenter
{
    FSTweetsScreenUI *screenUI;
    FSTwitterTableUI *tableTwitterUI;
    FSTweetsTableSectionUI *sectionTweetsUI;
    NSOperationQueue *backgroundOperations;
}

- (instancetype)initWithScreenFactory:(FSScreenUIFactory *)factory
{
    assert( nil != factory );
    self = [super initWithScreenFactory:factory];
    backgroundOperations = [[NSOperationQueue alloc] init];
    typeof(self) __weak weakSelf = self;
    screenUI = [factory makeTweetsScreenUI];
    screenUI.screenName = [NSString stringWithFormat:@"@%@", [self.networkHelper accountName]];
    [self.networkHelper userRequestWithPostsNumber:postsLimit completion:^(id data)
    {
        [weakSelf completeUserRequestWithData:data];
    }];
    return self;
}

#pragma mark - Completions

- (void)completeUserRequestWithData:(id)data
{
    NSArray<FSTwitterPost *> *twitterPosts = (NSArray<FSTwitterPost *> *)data;
    if( 0 == twitterPosts.count )
    {
        tableTwitterUI = [screenUI tableWithSections:@[]];
        [self handleFinalUI:YES];
        return;
    }
    NSArray<FSTweetCellUI *> *tweetCells = [self cellsWithPosts:twitterPosts];
    sectionTweetsUI = [self twitterSectionWithCells:tweetCells posts:twitterPosts];
    tableTwitterUI = [screenUI tableWithSections:@[sectionTweetsUI]];
    typeof(self) __weak weakSelf = self;
    tableTwitterUI.cellClickHandler = ^(id<PRCellUI> cell)
    {
        [weakSelf handleCellClick:cell];
    };
    tableTwitterUI.updateTopHandler = ^
    {
        [weakSelf handleRewriteRequest];
    };
    [self handleFinalUI:YES];
}

- (void)completeRewriteRequestWithData:(id)data
{
    assert( nil != tableTwitterUI );
    [tableTwitterUI enableTable];
    NSArray<FSTwitterPost *> *twitterPosts = (NSArray<FSTwitterPost *> *)data;
    NSArray<FSTweetCellUI *> *tweetCells = [self cellsWithPosts:twitterPosts];
    [tableTwitterUI rewriteSection:[self twitterSectionWithCells:tweetCells
                                                           posts:twitterPosts] index:sectionTweetsUI.index];
}

#pragma mark - FSTweetsTableSectionUI

- (FSTweetsTableSectionUI *)twitterSectionWithCells:(NSArray<FSTweetCellUI *> *)cells
                                              posts:(NSArray<FSTwitterPost *> *)posts
{
    FSTwitterPost *post = (FSTwitterPost *)[posts firstObject];
    FSTweetsTableSectionUI *twitterSection = [screenUI tweetSectionWithCells:cells
                                                                        keys:[self sectionDictionaryFromPost:post]];
    [backgroundOperations addOperationWithBlock:^
    {
        [twitterSection installIconWithData:[self.networkHelper dataWithUrl:post.user.profile_image_url]];
    }];
    return twitterSection;
}

- (NSDictionary *)sectionDictionaryFromPost:(FSTwitterPost *)post
{
    assert( nil != post.user.name);
    assert( nil != post.user.screen_name);
    return @{NSStringFromSelector(@selector(name)):post.user.name,
             NSStringFromSelector(@selector(screen_name)):post.user.screen_name};
}

#pragma mark - FSTweetCellUI

- (NSArray<FSTweetCellUI *> *)cellsWithPosts:(NSArray<FSTwitterPost *> *)posts
{
    NSMutableArray *cellsArray = [[NSMutableArray alloc] init];
    [posts enumerateObjectsUsingBlock:^(FSTwitterPost * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        FSTweetCellUI *tweetCellUI = [screenUI tweetCellWithKeys:[obj dictionary]];
        if( nil != obj.retweeted_status )
        {
            [backgroundOperations addOperationWithBlock:^
            {
                [tweetCellUI installIconWithData:[self.networkHelper dataWithUrl:obj.retweeted_status.user.profile_image_url]];
            }];
        }
        FSTwitterMedia *media = [obj.entities.media firstObject];
        if( nil != media.media_url_https )
        {
            [backgroundOperations addOperationWithBlock:^
            {
                [tweetCellUI installMediaWithData:[self.networkHelper dataWithUrl:media.media_url_https]];
            }];
        }
        [cellsArray addObject:tweetCellUI];
    }];
    return [cellsArray copy];
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

- (void)handleRewriteRequest
{
    [backgroundOperations cancelAllOperations];
    typeof(self) __weak weakSelf = self;
    [self.networkHelper userRequestWithPostsNumber:sectionTweetsUI.cellsNumber completion:^(id data)
    {
        [weakSelf completeRewriteRequestWithData:data];
    }];
}

- (void)handleFinalUI:(BOOL) isFinal
{
    assert( nil != screenUI.startFinalUIHandler );
    screenUI.startFinalUIHandler(isFinal);
}

- (void)handleCellClick:(id<PRCellUI>) cell
{
    FSTweetCellUI *tweetCell = (FSTweetCellUI *)cell;
    assert( nil != tweetCell.url );
    [self.networkHelper openUrlWithString:tweetCell.url screenName:sectionTweetsUI.screen_name];
}

- (void)dealloc
{
    [backgroundOperations cancelAllOperations];
}

@end
