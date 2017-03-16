//
//  FSAppController.h
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FSScreenUIFactory;

@interface FSAppController : NSObject

- (instancetype)initWithScreenUIFactory:(FSScreenUIFactory *)factory;
- (instancetype)init NS_UNAVAILABLE;

@end
