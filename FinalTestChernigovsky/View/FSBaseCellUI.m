//
//  FSBaseCellUI.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 27.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSBaseCellUI.h"

@implementation FSBaseCellUI
@synthesize cell;

- (instancetype)initWithKeys:(NSDictionary<NSString *, id> *)keys
{
    self = [super init];
    [keys enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop)
     {
         [self setValue:obj forKey:key];
     }];
    return self;
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

@end
