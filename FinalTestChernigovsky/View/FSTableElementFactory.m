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
              sectionsWithCells:(NSArray<id<PRTableSectionUI>> *)sectionsWithCells
{
    assert( nil != sectionsWithCells );
    id<PRTableUI> table = [[FSBaseTableUI alloc] initWithFrame:frame
                                             sectionsWithCells:sectionsWithCells];
    return table;
}

+ (FSTweetsTableSectionUI *)tweetsSectionWithCells:(NSArray<FSTweetCellUI *> *)cellsUI
                                              keys:(NSDictionary<NSString *, id> *)keys
{
    FSTweetsTableSectionUI *tweetSectionUI = [[FSTweetsTableSectionUI alloc] initWithCells:cellsUI
                                                                                      keys:keys];
    return tweetSectionUI;
}


+ (FSTweetCellUI *)tweetCellWithKeys:(NSDictionary<NSString *, id> *)keys
{
    FSTweetCellUI *tweetCellUI = [[FSTweetCellUI alloc] initWithKeys:keys];
    return tweetCellUI;
}

@end
