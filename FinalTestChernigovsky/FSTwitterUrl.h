//
//  FSTwitterUrl.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 22.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseObject.h"

@interface FSTwitterUrl : FSBaseObject
@property (nonatomic, copy, readonly) NSString *display_url;
@property (nonatomic, strong, readonly) NSURL *url;
@end
