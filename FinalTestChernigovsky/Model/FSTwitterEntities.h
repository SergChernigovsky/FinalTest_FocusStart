//
//  FSTwitterEntities.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 21.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseObject.h"
#import "FSTwitterUrls.h"
#import "FSTwitterMedia.h"

@interface FSTwitterEntities : FSBaseObject

@property (nonatomic, copy, readonly) NSArray<FSTwitterUrls *> *urls;
@property (nonatomic, copy, readonly) NSArray<FSTwitterMedia *> *media;

@end
