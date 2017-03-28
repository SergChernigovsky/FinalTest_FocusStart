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

+ (FSTwitterTableUI *)twitterTableWithFrame:(CGRect)frame
                          sectionsWithCells:(NSArray<id<PRTableSectionUI>> *)sectionsWithCells
                               topBarHeight:(CGFloat)topBarHeight
{
    assert( nil != sectionsWithCells );
    return [[FSTwitterTableUI alloc] initWithFrame:frame
                                 sectionsWithCells:sectionsWithCells
                                      topBarHeight:topBarHeight];
}

+ (FSTweetsTableSectionUI *)tweetsSectionWithCells:(NSArray<FSTweetCellUI *> *)cellsUI
                                              keys:(NSDictionary<NSString *, id> *)keys
{
    return [[FSTweetsTableSectionUI alloc] initWithCells:cellsUI
                                                    keys:keys];
}


+ (FSTweetCellUI *)tweetCellWithKeys:(NSDictionary<NSString *, id> *)keys
{
    return [[FSTweetCellUI alloc] initWithKeys:keys];
}

@end
