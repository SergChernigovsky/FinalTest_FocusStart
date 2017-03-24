//
//  FSRequestContext.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ResponseDataType)
{
    ResponseDataTypeDictionary = 1,
    ResponseDataTypeArray,
    ResponseDataTypeNil = 0
};

@protocol PRKeyEnumerator;

@interface FSRequestContext : NSObject

@property (nonatomic, strong, readonly) id<PRKeyEnumerator> keyEnumerator;
@property (nonatomic, strong, readonly) Class expectedClass;
@property (nonatomic, assign, readonly) ResponseDataType responseDataType;

- (instancetype)initWithKeyEnumerator:(id<PRKeyEnumerator>)keyEnumerator
                        expectedClass:(Class)class
                     responseDataType:(ResponseDataType)responseDataType;

- (instancetype)init NS_UNAVAILABLE;

@end
