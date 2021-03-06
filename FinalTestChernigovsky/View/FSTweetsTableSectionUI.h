//
//  FSTweetsTableSectionUI.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 27.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseTableSectionUI.h"

@interface FSTweetsTableSectionUI : FSBaseTableSectionUI

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *screen_name;

- (instancetype)initWithCells:(NSArray<id<PRCellUI>> *)cells
                         keys:(NSDictionary<NSString *, id> *)keys;

- (void)installIconWithData:(NSData *)userIcon;

@end
