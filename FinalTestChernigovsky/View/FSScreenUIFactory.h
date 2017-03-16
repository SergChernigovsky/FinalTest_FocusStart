//
//  FSScreenUIFactory.h
//  04.03
//
//  Created by Student on 04.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FSStartScreenUI;
@class FSTweetsScreenUI;

@interface FSScreenUIFactory : NSObject

- (instancetype) init NS_DESIGNATED_INITIALIZER;
- (FSStartScreenUI *) makeStartScreenUI;
- (FSTweetsScreenUI *) makeTweetsScreenUI;

@end
