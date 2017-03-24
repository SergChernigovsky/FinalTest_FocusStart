//
//  FSNetwork.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSRequestContext.h"
#import "PRDeserializer.h"

typedef void (^NetworkHandler)(NSError *error, id data);

@interface FSNetwork : NSObject

-(instancetype)init NS_DESIGNATED_INITIALIZER;

-(void)requestWithContext:(FSRequestContext *)context completion:(NetworkHandler)completion;

@end
