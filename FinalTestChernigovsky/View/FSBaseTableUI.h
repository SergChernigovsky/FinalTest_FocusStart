//
//  FSTableUI.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 23.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "PRTableUI.h"

@interface FSBaseTableUI : NSObject<PRTableUI>

- (instancetype)initWithFrame:(CGRect)frame
            sectionsWithCells:(NSArray<id<PRTableSectionUI>> *)sectionsWithCells NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

@end
