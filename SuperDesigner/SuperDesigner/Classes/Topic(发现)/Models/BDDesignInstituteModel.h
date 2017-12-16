//
//  BDDesignInstituteModel.h
//  SuperDesigner
//
//  Created by Julia on 2017/11/20.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDDesignInstituteModel : NSObject

//1-设计院id
@property(nonatomic, copy) NSString *id;

//2-设计院作品
@property(nonatomic, copy) NSString *workscount;

//3-粉丝fensi
@property(nonatomic, copy) NSString *fensi;

//4-设计院图标
@property(nonatomic, copy) NSString *img_head;

//5-类型
@property(nonatomic, copy) NSString *ican;

//6-设计院关注
@property(nonatomic, copy) NSString *follow_count;

//7-设计院user_id
@property(nonatomic, copy) NSString *user_id;

//8-设计院简介
@property(nonatomic, copy) NSString *resume;

//9-设计院名字
@property(nonatomic, copy) NSString *username;

//10-设计院综合评分
@property(nonatomic, assign) NSNumber *grade;

//11-设计院作品
@property(nonatomic, copy) NSString *honor;

//12-更多
@property(nonatomic, copy) NSString *more;


//图片
@property(nonatomic, strong) UIImage *iconImage;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)DesigneInstituteWithDict:(NSDictionary *)dict;



@end





















