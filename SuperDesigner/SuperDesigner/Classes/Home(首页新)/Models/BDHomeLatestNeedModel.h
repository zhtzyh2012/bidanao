//
//  BDHomeLatestNeedModel.h
//  SuperDesigner
//
//  Created by Julia on 2017/12/12.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDHomeLatestNeedModel : NSObject

//1.建筑面积
@property(nonatomic,copy) NSString *jzmj;
//头像
@property(nonatomic, copy) NSString *img_head;
//头像图片
@property(nonatomic, strong) UIImage *iconImage;
//发布时间
@property(nonatomic, copy) NSString *fbtime;
//截止时间
@property(nonatomic, copy) NSString *jztime;
//项目类型
@property(nonatomic, copy) NSString *xmlx;
//项目名称
@property(nonatomic, copy) NSString *xmjs;
//项目预算
@property(nonatomic, copy) NSString *xmys;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)needWithDict:(NSDictionary *)dict;

@end












