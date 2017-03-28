//
//  FSTwitterTableUI.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 29.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseTableUI.h"

@interface FSTwitterTableUI : FSBaseTableUI

- (instancetype)initWithFrame:(CGRect)frame
            sectionsWithCells:(NSArray<id<PRTableSectionUI>> *)sectionsWithCells
                 topBarHeight:(CGFloat)topBarHeight;

@end
