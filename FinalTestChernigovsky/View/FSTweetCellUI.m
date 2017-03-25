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
@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, copy, readwrite) NSString *screen_name;
@property (nonatomic, copy, readwrite) NSString *created_at;
@property (nonatomic, strong, readwrite) UIImage *user_image;
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
    return tweetCell;
}

@end
