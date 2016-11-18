//
//  OHNetwork.m
//  OhFlyer
//
//  Created by 向楠 on 16/8/4.
//  Copyright © 2016年 向楠. All rights reserved.
//

#define BaseURL @"http://apis.baidu.com/apistore"
/**国内天气预报融合版－－－－－apikey*/

#define apikey  @"82428a4618b6aa313be6914d727cb9b7"

#import "OHNetwork.h"


@implementation OHNetwork

static OHNetwork *_sharedClient = nil;
//static OHNetwork *_sharedClients = nil;

static dispatch_once_t onceToken;
//static dispatch_once_t onceTokens;


+ (OHNetwork *)sharedJsonClient
{
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc]initWithBaseURL:[NSURL URLWithString:BaseURL]];
    });
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
//设置请求超时时间
    
    self.requestSerializer.timeoutInterval = 5;
    
//设置相应的缓存策略
    
    self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringCacheData;
    
//分别设置请求以及相应的序列化器
    
    self.requestSerializer = [AFHTTPRequestSerializer serializer];
    AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
    response.removesKeysWithNullValues = YES;
    self.responseSerializer = response;
    
//复杂的参数类型 需要使用json传值-设置请求内容的类型
    
    [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    /**设置apikey ------类似于自己应用中的tokken---此处仅仅作为测试使用*/
    
    [self.requestSerializer setValue:apikey forHTTPHeaderField:@"apikey"];
    
//设置接受的类型
    
    [self.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/plain",@"application/json",@"text/json",@"text/javascript",@"text/html", nil]];
    
    return self;
    
}

- (void)requestJsonDataWithPath:(NSString *)path
                     withParams:(NSDictionary*)params
                 withMethodType:(NetworkMethod)method
               withSuccessBlock:( requestSuccess)successBlock
               withFailureBlock:( requestFailure)failureBlock
                       progress:(downloadProgress)progress
{
//    if (!path || path.length <= 0) {
//        return;
//    }
//    path = [path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    switch (method) {
        case Get:{
            [self GET:path parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
                progress(downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                successBlock(responseObject);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                failureBlock(error);
                
            }];
            
            break;
        }
        case Post:{
            [self POST:path parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
                
                progress(uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
                
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                successBlock(responseObject);
                
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                failureBlock(error);
                
            }];
        }
        default:
            break;
    }
}

- (void)requestUploadImageWihtPath:(NSString *)path
                        Operations:(NSDictionary *)operations
                          withImageArray:(NSArray *)imageArray
                         withTargetWidth:(CGFloat)width
                        withSuccessBlock:(requestSuccess)successBlock
                         withFailurBlock:(requestFailure)failureBlock
                      withUpLoadProgress:(uploadProgress)progress

{
    //1.创建管理者对象
    
    
    [self POST:path parameters:operations constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSUInteger i = 0 ;
        
        /**出于性能考虑,将上传图片进行压缩*/
        for (UIImage * image in imageArray) {
            
            //image的分类方法
            UIImage *  resizedImage =  [UIImage IMGCompressed:image targetWidth:width];
            
            NSData * imgData = UIImageJPEGRepresentation(resizedImage, .5);
            
            //拼接data
            [formData appendPartWithFileData:imgData name:[NSString stringWithFormat:@"picflie%ld",(long)i] fileName:@"image.png" mimeType:@" image/jpeg"];
            
            i++;
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        progress(uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        
        successBlock(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failureBlock(error);
        
    }];
}




















@end
