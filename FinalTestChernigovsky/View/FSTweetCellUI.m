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
@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, copy, readwrite) NSString *screenName;
@property (nonatomic, copy, readwrite) NSString *createdAt;
@property (nonatomic, strong, readwrite) UIImage *userImage;
@end

@implementation FSTweetCellUI
@synthesize cell;

- (instancetype)initWithKeys:(NSDictionary<NSString *, id> *)keys
{
    self = [super init];
    [keys enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop)
    {
        [self setValue:obj forKey:key];
    }];
    return self;
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

- (UITableViewCell *)cell
{
    FSTweetTableViewCell *tweetCell;
    tweetCell = (FSTweetTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"FSTweetTableViewCell"
                                                                       owner:self
                                                                     options:nil] lastObject];
    assert( nil != self.text );
    tweetCell.labelText.text = self.text;
    tweetCell.labelDate.text = self.createdAt;
    tweetCell.labelName.text = self.name;
    tweetCell.labelRetweet.text = [NSString stringWithFormat:@"%@", self.retweetCount];
    tweetCell.labelLike.text = [NSString stringWithFormat:@"%@", self.favoriteCount];
    tweetCell.labelScreenName.text = [NSString stringWithFormat:@"@%@", self.screenName];
    if ( YES == self.retweetedStatus) {
        tweetCell.viewRetweet.frame = CGRectMake(0, 0, CGRectGetWidth(tweetCell.viewRetweet.frame), 0);
    }
    return tweetCell;
}

@end
