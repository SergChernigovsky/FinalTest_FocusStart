//
//  FSNetworkConfigure.m
//  FinalTestChernigovsky
//
//  Created by mini on 14.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSNetworkConfigure.h"
#import "FSObjectArchiver.h"
#import "NSURL+FSURL.h"

@interface FSNetworkConfigure()
//Plist keys
@property (nonatomic, copy, readwrite, nonnull) NSString *consumerKey;
@property (nonatomic, copy, readwrite, nonnull) NSString *consumerSecret;
@property (nonatomic, copy, readwrite, nonnull) NSString *baseUrl;
@property (nonatomic, copy, readwrite, nonnull) NSString *authorizationUrl;
@property (nonatomic, copy, readwrite, nonnull) NSString *authorizationHttpBody;
@property (nonatomic, copy, readwrite, nonnull) NSString *userUrl;
@property (nonatomic, copy, readwrite, nonnull) NSString *headerKey;
@property (nonatomic, copy, readwrite, nonnull) NSString *accessTokenKey;
@property (nonatomic, copy, readwrite, nonnull) NSString *accountNameKey;
@end

@implementation FSNetworkConfigure
{
    NSDictionary<NSString *, NSString *> *configure;
    NSString *authTokenBase64;
}

- (instancetype)init
{
    self = [super init];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"NetworkСonfigure"
                                                     ofType:@"plist"];
    assert( nil != path );
    configure = [[NSDictionary alloc] initWithContentsOfFile:path];
    [configure enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSString * _Nonnull obj, BOOL * _Nonnull stop)
    {
        assert( NO == [obj isEqualToString:@""] );
        assert( NO != [self respondsToSelector:NSSelectorFromString(key)]);
        [self setValue:obj forKey:key];
    }];
    authTokenBase64 = [self tokenBase64WithKey:self.consumerKey
                                        secret:self.consumerSecret];
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
    NSString *stringUrl = [NSString stringWithFormat:@"%@%@%@", self.baseUrl, self.authorizationUrl, authTokenBase64];
    NSURL *url = [NSURL URLWithString:stringUrl];
    assert( nil != url );
    return url;
}

- (NSDictionary *)authHttpHeaders
{
    return @{self.headerKey : [NSString stringWithFormat:@"Basic %@", authTokenBase64]};
}

- (NSData *)authHttpBody
{
    return [self.authorizationHttpBody dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSURL *)contentUrlWithNumberPosts:(NSUInteger)numberPosts
{
    assert( 0 != numberPosts );
    NSString *params = [NSString stringWithFormat:@"count=%ld&screen_name=%@", (unsigned long)numberPosts, [FSObjectArchiver stringForKey:self.accountNameKey]];
    NSString *stringUrl = [NSString stringWithFormat:@"%@%@%@", self.baseUrl, self.userUrl, params];
    NSURL *url = [NSURL fs_URLWithString:stringUrl];
    assert( nil != url );
    return url;
}

- (NSDictionary *)contentHttpHeaders
{
    NSString *accessToken = [FSObjectArchiver stringForKey:self.accessTokenKey];
    return @{self.headerKey : [NSString stringWithFormat:@"Bearer %@", accessToken]};
}

- (void)saveAccessToken:(NSString *)string
{
    [FSObjectArchiver archiveString:string forKey:self.accessTokenKey];
}

- (void)saveAccountName:(NSString *)name
{
    [FSObjectArchiver archiveString:name forKey:self.accountNameKey];
}

- (NSString *)accountName
{
    return [FSObjectArchiver stringForKey:self.accountNameKey];
}

@end
