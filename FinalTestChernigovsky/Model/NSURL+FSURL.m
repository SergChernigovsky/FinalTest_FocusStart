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
    if ( nil == string || NO != [string isKindOfClass:[NSNull class]])
    {
        return nil;
    }
    NSCharacterSet *characterSet = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString* webStringURL = [string stringByAddingPercentEncodingWithAllowedCharacters:characterSet];
    return [NSURL URLWithString:webStringURL];
}

@end
