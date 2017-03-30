//
//  FSTwitterTableUI.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 29.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseTableUI.h"

@interface FSTwitterTableUI : FSBaseTableUI

@property (nonatomic, copy, readwrite) void(^sinceIDHander)(NSNumber *sinceID);

- (instancetype)initWithFrame:(CGRect)frame
            sectionsWithCells:(NSArray<id<PRTableSectionUI>> *)sectionsWithCells
                 topBarHeight:(CGFloat)topBarHeight;

- (void)enableTable;

@end
