//
//  OHNetwork.h
//  OhFlyer
//
//  Created by 向楠 on 16/8/4.
//  Copyright © 2016年 向楠. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum {
    Get = 0,
    Post,
    Put,
    Delegate,
}NetworkMethod;
/**定义请求成功的block*/
typedef void(^requestSuccess)( NSDictionary * object);

/**定义请求失败的block*/
typedef void(^requestFailure)( NSError *error);

/**定义上传进度block*/
typedef void(^uploadProgress)(float progress);

/**定义下载进度block*/
typedef void(^downloadProgress)(float progress);


@interface OHNetwork  : AFHTTPSessionManager


+ (OHNetwork *)sharedJsonClient;
/**
 *  网络请求的方法
 *
 *  @param type         get / post
 *  @param urlString    请求的地址
 *  @param paraments    请求的参数
 *  @param successBlock 请求成功的回调
 *  @param failureBlock 请求失败的回调
 *  @param progress 进度
 */
- (void)requestJsonDataWithPath:(NSString *)path
                     withParams:(NSDictionary*)params
                 withMethodType:(NetworkMethod)method
               withSuccessBlock:( requestSuccess)successBlock
               withFailureBlock:( requestFailure)failureBlock
                       progress:(downloadProgress)progress;

/**
 *  上传图片
 *
 *  @param operations   上传图片预留参数---视具体情况而定 可移除
 *  @param imageArray   上传的图片数组
 *  @parm width      图片要被压缩到的宽度
 *  @param urlString    上传的url
 *  @param successBlock 上传成功的回调
 *  @param failureBlock 上传失败的回调
 *  @param progress     上传进度
 */
//- (void)requestUploadImageWihtOperations:(NSDictionary *)operations
//                          withImageArray:(NSArray *)imageArray
//                         withTargetWidth:(CGFloat)width
//                        withSuccessBlock:(requestSuccess)successBlock
//                         withFailurBlock:(requestFailure)failureBlock
//                      withUpLoadProgress:(uploadProgress)progress;


@end
