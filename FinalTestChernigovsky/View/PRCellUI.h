//
//  PRCellUI.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 23.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol PRCellUI <NSObject>

@property (nonatomic, strong, readonly) UITableViewCell *cell;
@property (nonatomic, copy, readonly) NSString *cellIdentifier;

- (UITableViewCell *)makeCellWithCell:(UITableViewCell *)cell;

@end
