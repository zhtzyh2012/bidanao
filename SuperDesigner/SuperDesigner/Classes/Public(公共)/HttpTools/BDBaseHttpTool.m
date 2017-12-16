//
//  BDBaseHttpTool.m
//  SuperDesigner
//
//  Created by Guo JingRui on 2017/8/2.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDBaseHttpTool.h"
#import <AVFoundation/AVFoundation.h>
//static NSMutableArray *tasks;
@interface BDBaseHttpTool()
@property(nonatomic,strong)NSMutableArray * tasks;
@end
@implementation BDBaseHttpTool

- (NSMutableArray *)tasks
{
    
    static NSMutableArray * tasks;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"创建数组");
        tasks = [[NSMutableArray alloc] init];
    });
    return tasks;
}
+(BDBaseHttpTool *)sharedInstance{
    static BDBaseHttpTool * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]initWithBaseURL:[NSURL URLWithString:BaseURL]];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html" ,nil];
        
        //instance.responseSerializer = [AFHTTPResponseSerializer serializer];
        instance.requestSerializer = [AFJSONRequestSerializer serializer];
        instance.requestSerializer.timeoutInterval = 300;
    });
    return instance;
}
/**
 *  普通的 get 请求
 *
 *  @param url        接口地址 Url
 *  @param parameters 请求参数
 *  @param sucess     成功后的回调
 *  @param failure     失败后的回调
 */
-(void)getWithUrl:(NSString *)url parameters:(NSDictionary *)parameters sucess:(BDBaseHttpToolSuccess)sucess failure:(BDBaseHttpToolError)failure{
    [self GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (sucess) {
            sucess(responseObject);
            NSLog(@"参数--->%@", responseObject);
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
        
    }];
}
/**
 *  普通的 post 请求
 *
 *  @param url        接口地址 Url
 *  @param parameters 请求参数
 *  @param sucess     成功后的回调
 *  @param failure     失败后的回调
 */
-(void)postWithUrl:(NSString *)url parameters:(NSDictionary *)parameters sucess:(BDBaseHttpToolSuccess)sucess failure:(BDBaseHttpToolError)failure{
    
    [self POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (sucess) {
            sucess(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}
/**
 *  上传图片
 *
 *  @param images  图片数#import "URL.h"组
 *  @param sucess 成功回调
 *  @param failure 失败回调
 *
 */
-(void)postImage:(NSArray *)images parameters:(NSDictionary *)parameters url:(NSString *)url sucess:(BDBaseHttpToolSuccess)sucess failure:(BDBaseHttpToolError)failure andProgress:(BDBaseHttpToolProgress)progress{
    [self POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (NSDictionary *tempDic in images) {
            NSData *imgdata = UIImageJPEGRepresentation(tempDic[@"image"], 0.5);
            NSString *Iname = tempDic[@"name"];
            NSString *fileName = [NSString stringWithFormat:@"%@.jpeg",Iname];
            if (imgdata != nil)
            {   // 图片数据不为空才传递
                [formData appendPartWithFileData:imgdata name:Iname fileName:fileName mimeType:@"jpeg"];
            }
            
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        if (sucess) {
            sucess(responseObject);
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}
/*!
 *  视频上传
 *
 *  @param parameters   上传视频预留参数---视具体情况而定 可移除
 *  @param videoPath    上传视频的本地沙河路径
 *  @param url     上传的url
 *  @param success 成功的回调
 *  @param failure 失败的回调
 *  @param progress     上传的进度
 */
-(void)uploadVideoWithVideoPath:(NSURL *)videoPath parameters:(NSDictionary *)parameters url:(NSString *)url successBlock:(BDBaseHttpToolSuccess)success failureBlock:(BDBaseHttpToolError)failure uploadProgress:(BDBaseHttpUploadProgress)progress{
    
    /*! 获得视频资源 */
    AVURLAsset *avAsset = [AVURLAsset URLAssetWithURL:videoPath options:nil];
    
    /*! 压缩 */
    
    //    NSString *const AVAssetExportPreset640x480;
    //    NSString *const AVAssetExportPreset960x540;
    //    NSString *const AVAssetExportPreset1280x720;
    //    NSString *const AVAssetExportPreset1920x1080;
    //    NSString *const AVAssetExportPreset3840x2160;
    
    /*! 创建日期格式化器 */
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"yyyy-MM-dd-HHmmss"];
    
    /*! 转化后直接写入Library---caches */
    NSString *videoWritePath = [NSString stringWithFormat:@"output-%@.mp4",[formatter stringFromDate:[NSDate date]]];
    NSString *outfilePath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", videoWritePath];
    
    
    //    presetName：输出质量
    AVAssetExportSession *avAssetExport = [[AVAssetExportSession alloc] initWithAsset:avAsset presetName:AVAssetExportPreset960x540];
    // 码率和帧率设置
    NSDictionary *compressionProperties = @{ AVVideoAverageBitRateKey : @(60),
                                             AVVideoExpectedSourceFrameRateKey : @(30),
                                             AVVideoMaxKeyFrameIntervalKey : @(30),
                                             AVVideoProfileLevelKey : AVVideoProfileLevelH264BaselineAutoLevel};
    avAssetExport.outputURL = [NSURL fileURLWithPath:outfilePath];
    avAssetExport.outputFileType =  AVFileTypeMPEG4;
    NSLog(@"11--- >>%@",avAssetExport);
    NSLog(@"22--->>%@",parameters);
    
    [avAssetExport exportAsynchronouslyWithCompletionHandler:^{
        switch ([avAssetExport status]) {
            case AVAssetExportSessionStatusCompleted:
            {
                
                NSInteger fileSize = [[NSFileManager defaultManager] attributesOfItemAtPath:outfilePath error:nil].fileSize;
//                NSInteger finalSize = fileSize/(1024 * 1024);
//                做文件大小判断的可在这进行判断
//                NSLog(@"========文件的大小fileSize:%ld",fileSize/(1024 * 1024));
                
                
                NSString * URLS = [BaseURL stringByAppendingString:url];
                [self POST:URLS parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                    NSURL *filePathURL2 = [NSURL URLWithString:[NSString stringWithFormat:@"file://%@", outfilePath]];
                    
                    // 获得沙盒中的视频内容
                    [formData appendPartWithFileURL:filePathURL2 name:@"video" fileName:outfilePath mimeType:@"application/octet-stream" error:nil];
                    
                } progress:^(NSProgress * _Nonnull uploadProgress) {
                    NSLog(@"上传进度--%lld,总进度---%lld",uploadProgress.completedUnitCount,uploadProgress.totalUnitCount);
                    if (progress)
                    {
                        progress(uploadProgress.completedUnitCount, uploadProgress.totalUnitCount);
                    }
                    
                } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                    if (success) {
                        success(dict);
                    }
                    NSLog(@"请求的网址为%@\n返回的数据为%@",URLS,dict);
                    
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    NSLog(@"错误为%@",error);
                    if (failure) {
                        failure(error);
                    }
                    
                }];
                break;
            }
            default:
                break;
        }
    }];
}

/*!
 *  文件下载
 *
 *  @param savePath     下载文件保存路径
 *  @param url        请求的url
 *  @param successBlock 下载文件成功的回调
 *  @param failureBlock 下载文件失败的回调
 *  @param progress     下载文件的进度显示
 */
-(BDBaseHttpURLSessionTask *)downLoadFileWithUrlString:(NSString *)url parameters:(NSDictionary *)parameters savaPath:(NSString *)savePath successBlock:(BDBaseHttpToolSuccess)successBlock failureBlock:(BDBaseHttpToolError)failureBlock downLoadProgress:(BDBaseHttpDownloadProgress)progress{
    if (url == nil)
    {
        return nil;
    }
    
    NSString * URLS = [BaseURL stringByAppendingString:url];
    NSURLRequest *downloadRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:URLS]];
    
    
    NSLog(@"******************** 请求参数 ***************************");
    NSLog(@"请求方式: %@\n请求URL: %@\n请求param: %@\n\n", @"download",URLS, parameters);
    NSLog(@"******************************************************");
    
    
    BDBaseHttpURLSessionTask *sessionTask = nil;
    sessionTask = [self downloadTaskWithRequest:downloadRequest progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"下载进度：%.2lld%%",100 * downloadProgress.completedUnitCount/downloadProgress.totalUnitCount);
        /*! 回到主线程刷新UI */
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (progress)
            {
                progress(downloadProgress.completedUnitCount, downloadProgress.totalUnitCount);
                NSLog(@"下载进度--%lld,总进度---%lld",downloadProgress.completedUnitCount,downloadProgress.totalUnitCount);
            }
            
        });
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        if (!savePath)
        {
            NSURL *downloadURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
            NSLog(@"默认路径--%@",downloadURL);
            return [downloadURL URLByAppendingPathComponent:[response suggestedFilename]];
        }
        else
        {
            return [NSURL fileURLWithPath:savePath];
        }
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        [[self tasks] removeObject:sessionTask];
    
        
        NSLog(@"下载文件成功");
        if (error == nil)
        {
            
            if (successBlock)
            {
                /*! 返回完整路径 */
                successBlock([filePath path]);
            }
            else
            {
                NSLog(@"错误为%@",error);
                if (failureBlock) {
                    failureBlock(error);
                }
            }
        }
        
    }];
    /*! 开始启动任务 */
    [sessionTask resume];
    
    if (sessionTask)
    {
        [[self tasks] addObject:sessionTask];
    }
    return sessionTask;

}
/**
 *  删除请求
 *
 *  @param url        接口地址 Url
 *  @param parameters 请求参数
 *  @param sucess     成功后的回调
 *  @param failure     失败后的回调
 */
-(void)DeleteWithUrl:(NSString *)url parameters:(NSDictionary *)parameters sucess:(BDBaseHttpToolSuccess)sucess failure:(BDBaseHttpToolError)failure{
    
    [self DELETE:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (sucess) {
            sucess(dict);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if(failure){
            failure(error);
        }
    }];
}

@end
