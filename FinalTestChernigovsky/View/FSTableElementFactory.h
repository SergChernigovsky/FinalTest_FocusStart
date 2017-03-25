//
//  FSTableElementFactory.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 24.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol PRCellUI;
@protocol PRTableUI;

@interface FSTableElementFactory : NSObject

+ (id<PRTableUI>)tableWithFrame:(CGRect)frame
              sectionsWithCells:(NSArray<NSArray *> *)sectionsWithCells;

+ (id<PRCellUI>)tweetCellWithKeys:(NSDictionary<NSString *, id> *)keys;

@end
