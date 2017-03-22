//
//  FSDeserializerClasses.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 22.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PRDeserializer;

@interface FSDeserializerClasses : NSObject

+ (Class<PRDeserializer> _Nullable)deserializerForClass:(Class _Nullable)class;

@end
