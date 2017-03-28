//
//  FSTwitterCellUI.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 23.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTweetCellUI.h"
#import "FSTweetTableViewCell.h"

@interface FSTweetCellUI()
@property (nonatomic, assign, readwrite) BOOL retweeted_status;
@property (nonatomic, strong, readwrite) NSNumber *favorite_count;
@property (nonatomic, strong, readwrite) NSNumber *retweet_count;
@property (nonatomic, copy, readwrite) NSString *text;
@property (nonatomic, copy, readwrite) NSString *user_name;
@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, copy, readwrite) NSString *screen_name;
@property (nonatomic, copy, readwrite) NSString *created_at;
@property (nonatomic, copy, readwrite) NSString *display_url;
@end

@implementation FSTweetCellUI
{
    NSString *cellIdentifier;
}

- (instancetype)initWithKeys:(NSDictionary<NSString *,id> *)keys
{
    self = [super initWithKeys:keys];
    cellIdentifier = [self tweetCell].reuseIdentifier;
    return self;
}

- (FSTweetTableViewCell *)tweetCell
{
    return (FSTweetTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"FSTweetTableViewCell"
                                                                  owner:self
                                                                options:nil] lastObject];
}

- (void)installIconWithData:(NSData *)userIconData
{
    dispatch_async(dispatch_get_main_queue(), ^
    {
        self.user_icon = [UIImage imageWithData:userIconData];
    });
}

- (void)installMediaWithData:(NSData *)media
{
    dispatch_async(dispatch_get_main_queue(), ^
    {
       self.media = [UIImage imageWithData:media];
    });
}

- (void) setUser_icon:(UIImage *)userIcon
{
    _user_icon = userIcon;
    [self hanleUpdateCell];
}

- (void)setMedia:(UIImage *)media
{
    _media = media;
    [self hanleUpdateCell];
}

- (void)hanleUpdateCell
{
    if ( nil != self.updateCellHandler)
    {
        self.updateCellHandler(self.cellIndex);
    }
}

#pragma mark - PRCellUI

- (UITableViewCell *)makeCellWithCell:(UITableViewCell *)cell
{
    assert( NO != [cell isKindOfClass:[FSTweetTableViewCell class]]);
    assert( nil != self.text );
    
    FSTweetTableViewCell *tweetCell = (FSTweetTableViewCell *)cell;
    
    tweetCell.imageUserIcon.image = self.user_icon;
    if ( nil != self.user_icon)
    {
        [tweetCell.activityIndicator stopAnimating];
    }
    else
    {
        [tweetCell.activityIndicator startAnimating];
    }
    
    tweetCell.labelUrl.text = self.display_url;
    tweetCell.imageMedia.image = self.media;
    tweetCell.labelText.text = self.text;
    tweetCell.labelDate.text = self.created_at;
    tweetCell.labelName.text = self.name;
    tweetCell.labelRetweet.text = [NSString stringWithFormat:@"%@", self.retweet_count];
    tweetCell.labelLike.text = [NSString stringWithFormat:@"%@", self.favorite_count];
    tweetCell.labelScreenName.text = [NSString stringWithFormat:@"@%@", self.screen_name];
    
    if ( NO != self.retweeted_status )
    {
        tweetCell.imageRetweet.image = nil;
        tweetCell.labelRetweetUser.text = nil;
        return tweetCell;
    }
    tweetCell.imageRetweet.image = [UIImage imageNamed:@"iconRetweet"];
    tweetCell.labelRetweetUser.text = [NSString stringWithFormat:@"%@ Retweeted", self.name];
    return tweetCell;
}

- (UITableViewCell *)cell
{
    return [self makeCellWithCell:[self tweetCell]];
}

- (NSString *)cellIdentifier
{
    return cellIdentifier;
}

@end
