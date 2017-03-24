//
//  FSTableElementFactory.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 24.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTableElementFactory.h"
#import "FSTweetCellUI.h"

@implementation FSTableElementFactory

+ (id<PRTableUI>)tableWithFrame:(CGRect)frame
              sectionsWithCells:(NSArray<NSArray *> *)sectionsWithCells
{
    id<PRTableUI> table = [[FSBaseTableUI alloc] initWithFrame:frame
                                             sectionsWithCells:sectionsWithCells];
    assert( nil != sectionsWithCells );
    return table;
}

+ (id<PRCellUI>)twittCellWithKeys:(NSDictionary<NSString *, id> *)keys
{
    id<PRCellUI> cellUI = [[FSTweetCellUI alloc] initWithKeys:keys];
    return cellUI;
}

@end
