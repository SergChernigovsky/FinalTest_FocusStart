//
//  PRTableSectionUI.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 23.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "PRCellUI.h"

@protocol PRTableSectionUI <NSObject>

@property (nonatomic, assign, readonly) NSUInteger cellsNumber;

- (UITableViewCell *)cellForIndex:(NSUInteger)index;

@end
