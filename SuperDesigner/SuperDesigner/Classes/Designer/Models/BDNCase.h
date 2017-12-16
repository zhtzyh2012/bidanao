//
//  BDNCase.h
//  NewWind
//
//  Created by Julia on 16/10/28.
//  Copyright © 2016年 Julia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BDNCase : NSObject

//图片的名字
@property(nonatomic, copy) NSString *icon;

//图片的名称
@property(nonatomic, copy) NSString *name;

//性别
@property(nonatomic, copy) NSString *sex;

//等级
@property(nonatomic, copy) NSString *rank;

//所在的城市
@property(nonatomic, copy) NSString *city;

//大学地点
@property(nonatomic, copy) NSString *campus;

//经验
@property(nonatomic, copy) NSString *experience;

//擅长label
@property(nonatomic, copy) NSString *skilled;

//建筑类型
@property(nonatomic, copy) NSString *buildType;

//图片
@property(nonatomic, strong) UIImage *image;

//性别的图片
@property (nonatomic, strong) UIImage *sexImage;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)caseWithDict:(NSDictionary *)dict;

@end
