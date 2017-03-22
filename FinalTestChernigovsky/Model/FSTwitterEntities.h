//
//  FSTwitterEntities.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 21.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseObject.h"

@class FSTwitterUrls;

@interface FSTwitterEntities : FSBaseObject

@property (nonatomic, strong, readonly) NSArray<FSTwitterUrls *> *urls;

@end
