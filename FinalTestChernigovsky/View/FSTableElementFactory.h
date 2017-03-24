//
//  FSTableElementFactory.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 24.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseTableUI.h"

@interface FSTableElementFactory : NSObject

+ (id<PRTableUI>)tableWithFrame:(CGRect)frame
              sectionsWithCells:(NSArray<NSArray *> *)sectionsWithCells;

+ (id<PRCellUI>)twittCellWithKeys:(NSDictionary<NSString *, id> *)keys;

@end
