//
//  BDBaseDataTool.m
//  SuperDesigner
//
//  Created by Julia on 2017/8/1.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDBaseDataTool.h"
#import "AFNetworking.h"
#import "MJExtension.h"


@implementation BDBaseDataTool

-(void)getWithUrl:(NSString *)url params:(NSDictionary *)params clazz:(Class *)clazz succsee:(void(^)(id responseObject))success failure:(void(^)(id responseObject))failure {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //回调判断block是否有值
        if (success) {
            //success(responseObject);
            
//            id result = [[clazz alloc] init];
//            [result mj_setKeyValues:responseObject];
//            success(result);
            
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            
            failure(error);
        }
    }];


}

@end
