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
@property (nonatomic, strong, readwrite) UIImage *userIcon;
@end

@implementation FSTweetCellUI

- (UITableViewCell *)cell
{
    FSTweetTableViewCell *tweetCell;
    tweetCell = (FSTweetTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"FSTweetTableViewCell"
                                                                       owner:self
                                                                     options:nil] lastObject];
    assert( nil != self.text );
    tweetCell.labelText.text = self.text;
    tweetCell.labelDate.text = self.createdAt;
    tweetCell.labelName.text = self.tweetUserName;
    tweetCell.labelRetweet.text = [NSString stringWithFormat:@"%@", self.retweetCount];
    tweetCell.labelLike.text = [NSString stringWithFormat:@"%@", self.favoriteCount];
    tweetCell.labelScreenName.text = [NSString stringWithFormat:@"@%@", self.tweetUserScreenName];
    
    if ( NO != self.retweetedStatus )
    {
        tweetCell.imageRetweet.image = nil;
        return tweetCell;
    }
    tweetCell.labelRetweetUser.text = [NSString stringWithFormat:@"%@ Retweeted", self.userName];
    return tweetCell;
}

@end
