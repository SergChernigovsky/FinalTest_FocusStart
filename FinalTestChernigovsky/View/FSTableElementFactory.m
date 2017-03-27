//
//  FSTableElementFactory.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 24.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTableElementFactory.h"
#import "FSTweetCellUI.h"
#import "FSTweetsTableSectionUI.h"
#import "FSBaseTableUI.h"

@implementation FSTableElementFactory

+ (id<PRTableUI>)tableWithFrame:(CGRect)frame
              sectionsWithCells:(NSArray<NSArray *> *)sectionsWithCells
{
    assert( nil != sectionsWithCells );
    id<PRTableUI> table = [[FSBaseTableUI alloc] initWithFrame:frame
                                             sectionsWithCells:sectionsWithCells];
    return table;
}

+ (id<PRCellUI>)tweetCellWithKeys:(NSDictionary<NSString *, id> *)keys
{
    id<PRCellUI> cellUI = [[FSTweetCellUI alloc] initWithKeys:keys];
    return cellUI;
}

+ (id<PRTableSectionUI>)tweetsSectionWithCells:(NSArray<id<PRCellUI>> *)cellsUI
                                          keys:(NSDictionary<NSString *, id> *)keys
{
    id<PRTableSectionUI> sectionUI = [[FSTweetsTableSectionUI alloc] initWithCells:cellsUI
                                                                              keys:keys];
    return sectionUI;
}

@end
