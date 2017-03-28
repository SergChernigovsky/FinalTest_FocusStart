//
//  FSTwitterMedia.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 28.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseObject.h"

@interface FSTwitterMedia : FSBaseObject

@property (nonatomic, strong, readonly) NSURL *media_url_https;
@property (nonatomic, strong, readonly) NSURL *url;

@end
