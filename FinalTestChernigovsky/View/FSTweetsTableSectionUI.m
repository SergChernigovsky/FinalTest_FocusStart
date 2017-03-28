//
//  FSTweetsTableSectionUI.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 27.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTweetsTableSectionUI.h"
#import "FSTweetCellUI.h"

@interface FSTweetsTableSectionUI()
@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, copy, readwrite) NSString *screen_name;
@end

@implementation FSTweetsTableSectionUI

- (instancetype)initWithCells:(NSArray<FSTweetCellUI *> *)cells
                         keys:(NSDictionary<NSString *, id> *)keys
{
    self = [super initWithCells:cells];
    [keys enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop)
    {
        [self setValue:obj forKey:key];
    }];
    [self.cellsUI enumerateObjectsUsingBlock:^(id<PRCellUI>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        FSTweetCellUI *tweetCell = (FSTweetCellUI *)obj;
        assert( nil != self.name );
        if ( NO != tweetCell.retweeted_status )
        {
            [tweetCell setValue:self.name forKey:NSStringFromSelector(@selector(user_name))];
        }
    }];
    return self;
}

- (void)installIconWithData:(NSData *)userIcon
{
    dispatch_async(dispatch_get_main_queue(), ^
    {
        UIImage *icon = [UIImage imageWithData:userIcon];
        [self.cellsUI enumerateObjectsUsingBlock:^(id<PRCellUI>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
        {
            assert( NO != [obj isKindOfClass:[FSTweetCellUI class]]);
            FSTweetCellUI *tweetCell = (FSTweetCellUI *)obj;
            if ( NO == tweetCell.retweeted_status )
            {
                [tweetCell setValue:icon forKey:NSStringFromSelector(@selector(user_icon))];
            }
        }];
    });
}

@end
