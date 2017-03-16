//
//  FSTweetsPresenter.h
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBasePresenter.h"

@interface FSTweetsPresenter : FSBasePresenter

@property (nonatomic, copy) void (^buttonClickHandler)(void);

- (instancetype)initWithScreenFactory:(FSScreenUIFactory *)factory;

@end
