//
//  FSBaseScreenUI.h
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PRBaseScreenUI.h"

@interface FSBaseScreenUI : NSObject<PRBaseScreenUI>

@property (nonatomic, copy, readonly) NSArray *arrayNormalElements;
@property (nonatomic, copy, readonly) NSArray *arrayLoadingElements;
-(instancetype)init NS_DESIGNATED_INITIALIZER;

@end
