//
//  BDBaseHttpTool.h
//  SuperDesigner
//
//  Created by Guo JingRui on 2017/8/2.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface BDBaseHttpTool : AFHTTPSessionManager

typedef void (^BDBaseHttpToolSuccess)(id json);
typedef void (^BDBaseHttpToolError)(NSError * error);
typedef void (^BDBaseHttpToolProgress)(NSInteger progressNum);
//上传进度
typedef void (^BDBaseHttpUploadProgress)(int64_t bytesProgress,int64_t totalBytesProgress);
//下载进度
typedef void( ^BDBaseHttpDownloadProgress)(int64_t bytesProgress,int64_t totalBytesProgress);
/*!
 *  方便管理请求任务。执行取消，暂停，继续等任务.
 *  - (void)cancel，取消任务
 *  - (void)suspend，暂停任务
 *  - (void)resume，继续任务
 */
typedef NSURLSessionTask BDBaseHttpURLSessionTask;

+(BDBaseHttpTool *)sharedInstance;


/**
 *  普通的 post 请求
 *
 *  @param url        接口地址 Url
 *  @param parameters 请求参数
 *  @param sucess     成功后的回调
 *  @param failure     失败后的回调
 */
-(void)postWithUrl:(NSString *)url parameters:(NSDictionary *)parameters sucess:(BDBaseHttpToolSuccess)sucess failure:(BDBaseHttpToolError)failure;

/**
 *  普通的 get 请求
 *
 *  @param url        接口地址 Url
 *  @param parameters 请求参数
 *  @param sucess     成功后的回调
 *  @param failure    失败后的回调
 */
-(void)getWithUrl:(NSString *)url parameters:(NSDictionary *)parameters sucess:(BDBaseHttpToolSuccess)sucess failure:(BDBaseHttpToolError)failure;


/**
 *  上传图片
 *
 *  @param images  图片数#import "URL.h"组
 *  @param sucess 成功回调
 *  @param failure 失败回调
 *
 * 
 */
-(void)postImage:(NSArray *)images parameters:(NSDictionary *)parameters url:(NSString *)url sucess:(BDBaseHttpToolSuccess)sucess failure:(BDBaseHttpToolError)failure andProgress:(BDBaseHttpToolProgress)progress;



/*!
 *  视频上传
 *
 *  @param videoPath    上传视频的本地沙河路径
 *  @param url     上传的url
 *  @param success 成功的回调
 *  @param failure 失败的回调
 *  @param progress     上传的进度
 */
- (void)uploadVideoWithVideoPath:(NSURL *)videoPath parameters:(NSDictionary *)parameters url:(NSString *)url successBlock:(BDBaseHttpToolSuccess)success failureBlock:(BDBaseHttpToolError)failure uploadProgress:(BDBaseHttpUploadProgress)progress;


/*!
 *  文件下载
 *
 *  @param savePath     下载文件保存路径
 *  @param url       请求的url
 *  @param successBlock 下载文件成功的回调
 *  @param failureBlock 下载文件失败的回调
 *  @param progress     下载文件的进度显示
 */
- (BDBaseHttpURLSessionTask *)downLoadFileWithUrlString:(NSString *)url parameters:(NSDictionary *)parameters savaPath:(NSString *)savePath successBlock:(BDBaseHttpToolSuccess)successBlock failureBlock:(BDBaseHttpToolError)failureBlock
                                 downLoadProgress:(BDBaseHttpDownloadProgress)progress;

/**
 *  删除请求
 *
 *  @param url        接口地址 Url
 *  @param parameters 请求参数
 *  @param sucess     成功后的回调
 *  @param failure   失败后的回调
 */
-(void)DeleteWithUrl:(NSString *)url parameters:(NSDictionary *)parameters sucess:(BDBaseHttpToolSuccess)sucess failure:(BDBaseHttpToolError)failure;

@end
