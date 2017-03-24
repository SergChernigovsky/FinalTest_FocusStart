//
//  FSTweetsScreenUI.h
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseScreenUI.h"

@protocol PRTableUI;

@interface FSTweetsScreenUI : FSBaseScreenUI

- (instancetype)init NS_DESIGNATED_INITIALIZER;

- (id<PRTableUI>)tableWithSections:(NSArray<NSArray *> *)sections;

@end
