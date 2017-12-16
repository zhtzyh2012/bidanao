//
//  BDMyAttentionModel.m
//  SuperDesigner
//
//  Created by Julia on 2017/10/30.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDMyAttentionModel.h"

@implementation BDMyAttentionModel

//写一个对象方法
-(instancetype) initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
    
}

//用户的图像
-(UIImage *)iconImg {
    if (_iconImg == nil) {
        _iconImg = [UIImage imageNamed:self.designerIcon];
    }
    return _iconImg;
}

//用户的等级
-(UIImage *)rankImage {
    if(_rankImage == nil) {
        _rankImage = [UIImage imageNamed:self.designerRank];
    }
    return _rankImage;
}

//一个类方法
+(instancetype) attentionListWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
    
}

-(void) setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end













