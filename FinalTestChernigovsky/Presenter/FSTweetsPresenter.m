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

@implementation FSTweetsPresenter
{
    FSTweetsScreenUI *screenUI;
    FSTwitterTableUI *tableUI;
    FSTweetsTableSectionUI *sectionUI;
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
    /*
    [self.networkHelper userRequestWithSinceID:846440414773219328 Completion:^(id data)
    {
        [weakSelf completeUserRequestWithData:data];
    }];
     */
    return self;
}

#pragma mark - Completions

- (void)completeUserRequestWithData:(id)data
{
    NSArray<FSTwitterPost *> *twitterPosts = (NSArray<FSTwitterPost *> *)data;
    if ( 0 == twitterPosts.count )
    {
        tableUI = [screenUI tableWithSections:@[]];
        [self handleFinalUI:YES];
        return;
    }
    NSArray<FSTweetCellUI *> *tweetCells = [self cellsWithPosts:twitterPosts];
    sectionUI = [self twitterSectionWithCells:tweetCells posts:twitterPosts];
    tableUI = [screenUI tableWithSections:@[sectionUI]];
    typeof(self) __weak weakSelf = self;
    tableUI.cellClickHandler = ^(id<PRCellUI> cell)
    {
        [weakSelf handleCellClick:cell];
    };
    [self handleFinalUI:YES];
}

#pragma mark - FSTweetsTableSectionUI

- (FSTweetsTableSectionUI *)twitterSectionWithCells:(NSArray<FSTweetCellUI *> *)cells
                                              posts:(NSArray<FSTwitterPost *> *)posts
{
    FSTwitterPost *post = (FSTwitterPost *)[posts firstObject];
    FSTweetsTableSectionUI *twitterSection = [screenUI tweetSectionWithCells:cells
                                                                        keys:[self sectionDictionaryFromPost:post]];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void)
    {
        [twitterSection installIconWithData:[self.networkHelper dataWithUrl:post.user.profile_image_url]];
    });
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
        if ( nil != obj.retweeted_status ) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void)
            {
               [tweetCellUI installIconWithData:[self.networkHelper dataWithUrl:obj.retweeted_status.user.profile_image_url]];
            });
        }
        FSTwitterMedia *media = [obj.entities.media firstObject];
        if ( nil != media.media_url_https ) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void)
            {
                [tweetCellUI installMediaWithData:[self.networkHelper dataWithUrl:media.media_url_https]];
            });
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

- (void)handleFinalUI:(BOOL) isFinal
{
    assert( nil != screenUI.startFinalUIHandler );
    screenUI.startFinalUIHandler(isFinal);
}

- (void)handleCellClick:(id<PRCellUI>) cell
{
    FSTweetCellUI *tweetCell = (FSTweetCellUI *)cell;
    assert( nil != tweetCell.url );
    [self.networkHelper openUrlWithString:tweetCell.url screenName:sectionUI.screen_name];
}

@end
