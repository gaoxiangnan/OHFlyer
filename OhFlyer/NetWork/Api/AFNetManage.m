//
//  AFNetManage.m
//  FlyShare
//
//  Created by zzxcc on 15/11/2.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#define kNetworkMethodName @[@"Get", @"Post", @"Put", @"Delete"]

#import "AFNetManage.h"
#import "NSObject+Common.h"

@implementation AFNetManage

static AFNetManage *_sharedClient = nil;
static AFNetManage *_sharedClientt = nil;

static dispatch_once_t onceToken;
static dispatch_once_t onceTokenn;


+ (AFNetManage *)sharedJsonClient{
    dispatch_once(&onceToken, ^{
//        _sharedClient = [[AFNetManage alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrl_Formal]];
        _sharedClient = [[AFNetManage alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrl_Test]];
    });
    return _sharedClient;
}

+ (id)changJsonClient{
    _sharedClient = [[AFNetManage alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrl_Test]];
    return _sharedClient;
}

+ (AFNetManage *)testPayJsonClient{

//    _sharedClientt = [[AFNetManage alloc] initWithBaseURL:[NSURL URLWithString:payUrl_Formal]];
    _sharedClientt = [[AFNetManage alloc] initWithBaseURL:[NSURL URLWithString:payUrl]];

    return _sharedClientt;
}

- (id)initWithBaseURL:(NSURL *)url{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    //设置返回类型json,防止返回nsinlinedate
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    self.responseSerializer = [AFJSONResponseSerializer serializer];
 
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
    //设置最大连接时间
    self.requestSerializer.timeoutInterval = 15;
    
    //设置请求头head
    [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    

    [self.requestSerializer setValue:head_platform forHTTPHeaderField:@"platform"];
    [self.requestSerializer setValue:head_Version forHTTPHeaderField:@"version"];
    [self.requestSerializer setValue:head_deviceId forHTTPHeaderField:@"deviceId"];
    //long timeNum = time(NULL);

    [self.requestSerializer setValue:head_timestamp forHTTPHeaderField:@"timestamp"];
    
    
    self.securityPolicy.allowInvalidCertificates = YES;
    
    return self;
}

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(NetworkMethod)method
                       andBlock:(void (^)(id data, NSError *error))block{
    [self requestJsonDataWithPath:aPath withParams:params withMethodType:method autoShowError:YES andBlock:block];
}

- (void)requestJsonDataWithPath:(NSString *)aPath
                       withParams:(NSDictionary *)params
                   withMethodType:(NetworkMethod)method
                    autoShowError:(BOOL)autoShowError
                         andBlock:(void (^)(id data, NSError *error))block{
    if (!aPath || aPath.length <= 0) {
        return;
    }
    aPath = [aPath stringByAddingPercentEncodingWithAllowedCharacters: [NSCharacterSet URLQueryAllowedCharacterSet]];
    
   
    //log请求数据
    DebugLog(@"\n===========request===========\n%@\n%@:\n%@", kNetworkMethodName[method], aPath, params);
    
    
    switch (method) {
        case Get:{
//            //get请求增加缓存机制
//            NSMutableString *localPath = [aPath mutableCopy];
//            if (params) {
//                [localPath appendString:params.description];
//            }
            
            [self GET:aPath parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                id error = [self handleResponse:responseObject autoShowError:autoShowError];
                if (error) {
                    block(nil, error);
                }else{
                    block(responseObject, nil);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                !autoShowError || [NSObject showError:error];
                block(nil, error);
            }];
            
            break;}
            
        case Post:{
            
            [self POST:aPath parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                id error = [self handleResponse:[responseObject valueForKeyPath:@"head"] autoShowError:autoShowError];
                if (error) {
                    block(nil, error);
                }else{
                    block(responseObject, nil);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                !autoShowError || [NSObject showError:error];
                block(nil, error);
            }];
            
            break;}
        default:
            break;
    }
    
}



@end
