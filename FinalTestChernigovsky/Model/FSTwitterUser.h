//
//  FSTwitterUser.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 21.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseObject.h"

@interface FSTwitterUser : FSBaseObject

@property (nonatomic, strong, readonly) NSURL *profile_image_url;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *screen_name;

@end
