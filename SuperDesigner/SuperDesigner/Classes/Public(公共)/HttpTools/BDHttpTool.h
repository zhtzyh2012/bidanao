//
//  BDHttpTool.h
//  SuperDesigner
//
//  Created by Julia on 2017/8/1.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDHttpTool : NSObject

/**
 
 *  get形式请求网络书籍
 *  url地址
 *  success请求成功的回调
 *  请求失败的回调
 **/
+(void)getWithUrl:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

/**
 
 *  post形式请求网络书籍
 *  url地址
 *  success请求成功的回调
 *  请求失败的回调
 **/

+(void)postWithUrl:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;


@end




















