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
@property (nonatomic, assign, readwrite) BOOL retweetedStatus;
@property (nonatomic, strong, readwrite) NSNumber *favoriteCount;
@property (nonatomic, strong, readwrite) NSNumber *retweetCount;
@property (nonatomic, copy, readwrite) NSString *text;
@property (nonatomic, copy, readwrite) NSString *userName;
@property (nonatomic, copy, readwrite) NSString *tweetUserName;
@property (nonatomic, copy, readwrite) NSString *tweetUserScreenName;
@property (nonatomic, copy, readwrite) NSString *createdAt;
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

- (void)installIconWithData:(NSData *)userIcon
{
    dispatch_async(dispatch_get_main_queue(), ^
    {
        self.userIcon = [UIImage imageWithData:userIcon];
        
    });
}

- (void) setUserIcon:(UIImage *)userIcon
{
    _userIcon = userIcon;
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
    
    tweetCell.imageUserIcon.image = self.userIcon;
    if ( nil != self.userIcon)
    {
        [tweetCell.activityIndicator stopAnimating];
    }
    else
    {
        [tweetCell.activityIndicator startAnimating];
    }
    
    tweetCell.labelText.text = self.text;
    tweetCell.labelDate.text = self.createdAt;
    tweetCell.labelName.text = self.tweetUserName;
    tweetCell.labelRetweet.text = [NSString stringWithFormat:@"%@", self.retweetCount];
    tweetCell.labelLike.text = [NSString stringWithFormat:@"%@", self.favoriteCount];
    tweetCell.labelScreenName.text = [NSString stringWithFormat:@"@%@", self.tweetUserScreenName];
    
    if ( NO != self.retweetedStatus )
    {
        tweetCell.imageRetweet.image = nil;
        tweetCell.labelRetweetUser.text = nil;
        return tweetCell;
    }
    tweetCell.imageRetweet.image = [UIImage imageNamed:@"iconRetweet"];
    tweetCell.labelRetweetUser.text = [NSString stringWithFormat:@"%@ Retweeted", self.userName];
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
