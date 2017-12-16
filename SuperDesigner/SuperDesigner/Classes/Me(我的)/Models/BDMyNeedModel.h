//
//  BDMyNeedModel.h
//  SuperDesigner
//
//  Created by Julia on 2017/11/13.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDMyNeedModel : NSObject

//项目名字
@property(nonatomic, copy) NSString *bulidName;

//发布时间
@property(nonatomic, copy) NSString *time;

//设计标签
@property(nonatomic, copy) NSString *buildTags;

//预算
@property(nonatomic, copy) NSString *money;

//是否招标的标签
@property(nonatomic, copy) NSString *callBidsLabel;

//对象方法
-(instancetype) initWithDict:(NSDictionary *)dict;

//类方法
+(instancetype) needsWithDict:(NSDictionary *)dict;

@end













