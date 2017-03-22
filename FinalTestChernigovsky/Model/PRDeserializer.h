//
//  PRDeserializer.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSDeserializerClasses.h"

@protocol PRDeserializer <NSObject>

-(id)parseResponse:(id)json expectedClass:(Class)class;

@end
