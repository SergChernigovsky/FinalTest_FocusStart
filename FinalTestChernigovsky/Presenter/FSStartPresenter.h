//
//  FSStartPresenter.h
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBasePresenter.h"

@interface FSStartPresenter : FSBasePresenter

@property (nonatomic, copy, readwrite) void (^pushToTweetsHandler)(void);

- (instancetype)initWithScreenFactory:(FSScreenUIFactory *)factory;

@end
