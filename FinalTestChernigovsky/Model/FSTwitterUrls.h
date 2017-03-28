//
//  FSTwitterUrls.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 21.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseObject.h"

@class FSTwitterUrl;

@interface FSTwitterUrls : FSBaseObject

@property (nonatomic, copy, readonly) NSString *display_url;
@property (nonatomic, strong, readonly) NSURL *url;

@end
