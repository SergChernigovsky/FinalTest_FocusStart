//
//  FSNetworkConfigure.m
//  FinalTestChernigovsky
//
//  Created by mini on 14.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSNetworkConfigure.h"
#import "FSObjectArchiver.h"
#import "FSDeserializerDictionary.h"

@implementation FSNetworkConfigure
{
    NSDictionary *configure;
    NSString *authTokenBase64;
    
    //Plist keys
    NSString *consumerKey;
    NSString *consumerSecret;
    NSString *baseUrl;
    NSString *authUrl;
    NSString *authHttpBody;
    NSString *userUrl;
    NSString *headerKey;
    NSString *accessTokenKey;
    NSString *accountNameKey;
}

- (instancetype)init
{
    self = [super init];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"NetworkСonfigure"
                                                     ofType:@"plist"];
    assert( nil != path );
    configure = [[NSDictionary alloc] initWithContentsOfFile:path];
    [configure enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [self setValue:obj forKey:key];
    }];
    assert( nil != consumerKey );
    assert( nil != consumerSecret );
    assert( nil != baseUrl );
    assert( nil != authUrl );
    assert( nil != authHttpBody );
    assert( nil != userUrl );
    assert( nil != headerKey );
    assert( nil != accessTokenKey );
    assert( nil != accountNameKey );
    authTokenBase64 = [self tokenBase64WithKey:consumerKey
                                        secret:consumerSecret];
    return self;
}

-(NSString *)tokenBase64WithKey:(NSString *)key
                         secret:(NSString *)secret
{
    NSString *consumerToken = [NSString stringWithFormat:@"%@:%@", key, secret];
    NSData *dataUTF8 = [consumerToken dataUsingEncoding:NSUTF8StringEncoding];
    NSString *stringUTF8 = [dataUTF8 base64EncodedStringWithOptions:0];
    assert( nil != stringUTF8);
    return stringUTF8;
}

- (NSURL *)authUrl
{
    NSString *stringUrl = [NSString stringWithFormat:@"%@%@%@", baseUrl, authUrl, authTokenBase64];
    NSURL *url = [NSURL URLWithString:stringUrl];
    assert( nil != url );
    return url;
}

- (NSDictionary *)authHttpHeaders
{
    return @{headerKey : [NSString stringWithFormat:@"Basic %@", authTokenBase64]};
}

- (NSData *)authHttpBody
{
    return [authHttpBody dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSURL *)contentUrlWithNumberPosts:(NSUInteger)numberPosts
{
    assert( 0 != numberPosts );
    NSString *params = [NSString stringWithFormat:@"count=%ld&screen_name=%@", (unsigned long)numberPosts, [FSObjectArchiver stringForKey:accountNameKey]];
    NSString *stringUrl = [NSString stringWithFormat:@"%@%@%@", baseUrl, userUrl, params];
    NSURL *url = [NSURL URLWithString:stringUrl];
    assert( nil != url );
    return url;
}

- (NSDictionary *)contentHttpHeaders
{
    NSString *accessToken = [FSObjectArchiver stringForKey:accessTokenKey];
    return @{headerKey : [NSString stringWithFormat:@"Bearer %@", accessToken]};
}

- (void)saveAccessToken:(NSString *)string
{
    [FSObjectArchiver archiveString:string forKey:accessTokenKey];
}

- (void)saveAccountName:(NSString *)name
{
    [FSObjectArchiver archiveString:name forKey:accountNameKey];
}

@end
