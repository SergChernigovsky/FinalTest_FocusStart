//
//  FSObjectArchiver.h
//  FinalTestChernigovsky
//
//  Created by mini on 15.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FSObjectArchiver : NSObject

+ (void)archiveString:(NSString *)string forKey:(NSString *)key;

+ (NSString *)stringForKey:(NSString *)key;

- (instancetype)init NS_UNAVAILABLE;

@end
