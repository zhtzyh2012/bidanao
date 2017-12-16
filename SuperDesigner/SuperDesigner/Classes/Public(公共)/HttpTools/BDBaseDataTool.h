//
//  BDBaseDataTool.h
//  SuperDesigner
//
//  Created by Julia on 2017/8/1.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDBaseDataTool : NSObject

//返回值也是一样的需要block返回
//成功的回调-->回调的是数据模型

-(void)getWithUrl:(NSString *)url params:(NSDictionary *)params clazz:(Class *)clazz succsee:(void(^)(id responseObject))success failure:(void(^)(id responseObject))failure;


@end
