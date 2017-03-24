//
//  FSDeserializeableProperty.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 20.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FSDeserializeableProperty : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, strong, readonly) Class class;
@property (nonatomic, strong, readonly) NSString *keyId;

- (instancetype)initWithName:(NSString *)name
                       class:(Class)class
                       keyId:(NSString *)keyId NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

@end
