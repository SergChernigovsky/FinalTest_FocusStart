//
//  NSURL+FSURL.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 21.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "NSURL+FSURL.h"

@implementation NSURL (FSURL)

+ (NSURL *)fs_URLWithString:(NSString *)string
{
    NSCharacterSet *characterSet = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString* webStringURL = [string stringByAddingPercentEncodingWithAllowedCharacters:characterSet];
    return [NSURL URLWithString:webStringURL];
}

@end
