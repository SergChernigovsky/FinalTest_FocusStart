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
#import "FSTwitterTableUI.h"

@protocol PRTableUI;

@interface FSTableElementFactory : NSObject

+ (FSTwitterTableUI *)twitterTableWithFrame:(CGRect)frame
                          sectionsWithCells:(NSArray<id<PRTableSectionUI>> *)sectionsWithCells
                               topBarHeight:(CGFloat)topBarHeight;

+ (FSTweetsTableSectionUI *)tweetsSectionWithCells:(NSArray<id<PRCellUI>> *)cellsUI
                                              keys:(NSDictionary<NSString *, id> *)keys;

+ (FSTweetCellUI *)tweetCellWithKeys:(NSDictionary<NSString *, id> *)keys;

@end
