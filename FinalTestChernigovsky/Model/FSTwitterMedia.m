//
//  FSTwitterMedia.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 28.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTwitterMedia.h"

@interface FSTwitterMedia()
@property (nonatomic, strong, readwrite) NSURL *media_url_https;
@property (nonatomic, strong, readwrite) NSURL *url;
@end

@implementation FSTwitterMedia

+ (NSArray<FSDeserializeableProperty *> *)deserializeableProperties
{
    
    return @[[[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(media_url_https))
                                                       class:[NSURL class]
                                                       keyId:nil],
             [[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(url))
                                                       class:[NSURL class]
                                                       keyId:nil]];
}

@end
