//
//  FSDeserializeableProperty.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 20.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSDeserializeableProperty.h"

@interface FSDeserializeableProperty()
@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, strong, readwrite) Class class;
@property (nonatomic, strong, readwrite) NSString *keyId;
@end

@implementation FSDeserializeableProperty

- (instancetype)initWithName:(NSString *)name
                       class:(Class)class
                       keyId:(NSString *)keyId
{
    self = [super init];
    self.name = name;
    self.class = class;
    self.keyId = keyId;
    return self;
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

@end
