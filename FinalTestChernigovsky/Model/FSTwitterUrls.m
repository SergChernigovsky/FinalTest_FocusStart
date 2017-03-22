//
//  FSTwitterUrls.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 21.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTwitterUrls.h"
#import "FSTwitterUrl.h"

@interface FSTwitterUrls()
@property (nonatomic, strong, readwrite) FSTwitterUrl *twitterUrls;
@end

@implementation FSTwitterUrls

+ (NSArray<FSDeserializeableProperty *> *)deserializeableProperties
{
    
    return @[[[FSDeserializeableProperty alloc] initWithName:NSStringFromSelector(@selector(twitterUrls))
                                                       class:[FSTwitterUrl class]
                                                       keyId:nil]];
}

@end
