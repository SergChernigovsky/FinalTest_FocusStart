//
//  FSTableElementFactory.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 24.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FSTweetCellUI.h"
#import "FSTweetsTableSectionUI.h"

@protocol PRTableUI;

@interface FSTableElementFactory : NSObject

+ (id<PRTableUI>)tableWithFrame:(CGRect)frame
              sectionsWithCells:(NSArray<id<PRTableSectionUI>> *)sectionsWithCells;

+ (FSTweetsTableSectionUI *)tweetsSectionWithCells:(NSArray<id<PRCellUI>> *)cellsUI
                                              keys:(NSDictionary<NSString *, id> *)keys;

+ (FSTweetCellUI *)tweetCellWithKeys:(NSDictionary<NSString *, id> *)keys;

@end
