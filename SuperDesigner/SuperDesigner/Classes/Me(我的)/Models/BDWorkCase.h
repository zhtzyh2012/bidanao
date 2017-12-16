//
//  BDWorkCase.h
//  SuperDesigner
//
//  Created by Julia on 2017/10/17.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BDWorkCase : NSObject
//名称
@property(nonatomic, copy) NSString *workName;

//时间
@property(nonatomic, copy) NSString *workTime;

//图片一
@property(nonatomic, copy) NSString *workImageOne;

//图片二
@property(nonatomic, copy) NSString *workImageTwo;

//图片1的对象
@property (nonatomic,strong) UIImage *image;
//图片2的对象
@property (nonatomic,strong) UIImage *pictureImage;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)workCaseWithDict:(NSDictionary *)dict;

@end
