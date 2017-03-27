//
//  FSTweetsScreenUI.h
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseScreenUI.h"

@class FSTweetCellUI;
@class FSTweetsTableSectionUI;

@protocol PRTableUI;
@protocol PRTableSectionUI;

@interface FSTweetsScreenUI : FSBaseScreenUI

- (instancetype)init NS_DESIGNATED_INITIALIZER;

- (id<PRTableUI>)tableWithSections:(NSArray<id<PRTableSectionUI>> *)sections;

- (FSTweetCellUI *)tweetCellWithKeys:(NSDictionary<NSString *, id> *)keys;

- (FSTweetsTableSectionUI *)tweetSectionWithCells:(NSArray<FSTweetCellUI *> *)cells
                                             keys:(NSDictionary<NSString *,id> *)keys;

@end
