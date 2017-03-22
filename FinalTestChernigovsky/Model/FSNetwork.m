//
//  FSNetwork.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 13.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSNetwork.h"
#import "FSDeserializerArray.h"
#import "FSDeserializerDictionary.h"
#import "PRKeyEnumerator.h"

@interface FSNetwork()
@end

@implementation FSNetwork
{
    NSURLSession *session;
    Class expectedClass;
}

- (instancetype)init
{
    self = [super init];
    return self;
}

-(void)requestWithContext:(FSRequestContext *)context
               completion:(NetworkHandler)completion
{
    switch( context.responseDataType )
    {
        case ResponseDataTypeDictionary:
            _responseParser = [[FSDeserializerDictionary alloc] init];
            break;
        case ResponseDataTypeArray:
            _responseParser = [[FSDeserializerArray alloc] init];
            break;
        default:
            assert( NO );
            break;
    }
    
    assert( nil != context.expectedClass );
    expectedClass = context.expectedClass;
    
    assert( nil != context.keyEnumerator );
    NSMutableURLRequest *request = [self urlRequestWithEnumerator:context.keyEnumerator];

    typeof(self) __weak weakSelf = self;
    NSURLSessionTask *task;
    session = [NSURLSession sharedSession];
    task = [session dataTaskWithRequest:request
                      completionHandler:^(NSData * _Nullable data,
                                          NSURLResponse * _Nullable response,
                                          NSError * _Nullable error)
    {
        if( nil != error)
        {
            completion(error,nil);
            return;
        }
        [weakSelf parseData:data completion:completion];
    }];
    [task resume];
}

- (void)parseData:(NSData *)data
       completion:(NetworkHandler)completion
{
    NSError *error = nil;
    id json = [NSJSONSerialization JSONObjectWithData:data
                                              options:0
                                                error:&error];
    if ( nil != error ) {
        completion(error, nil);
        return;
    }
    if ( NO != [json isKindOfClass:[NSDictionary class]] )
    {
        if ( nil != json[@"error"] ) {
            completion([[NSError alloc] initWithDomain:json[@"error"]
                                                  code:0
                                              userInfo:nil], nil);
            return;
        }
        else if( nil != json[@"errors"] )
        {
            completion([[NSError alloc] initWithDomain:json[@"errors"][0][@"message"]
                                                  code:[json[@"errors"][0][@"code"] integerValue]
                                              userInfo:nil], nil);
            return;
        }
    }
    completion(nil, [_responseParser parseResponse:json expectedClass:expectedClass]);
}

- (NSMutableURLRequest *)urlRequestWithEnumerator:(id<PRKeyEnumerator>)keyEnumerator
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [keyEnumerator enumerateUsingBlock:^(id key, id object)
    {
        [request setValue:object forKey:key];
    }];
    assert( nil != request.URL );
    return request;
}

@end
