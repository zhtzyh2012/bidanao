//
//  BDMyCollectModel.m
//  SuperDesigner
//
//  Created by Julia on 2017/10/27.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDMyCollectModel.h"

@implementation BDMyCollectModel

//第一张图片
-(UIImage *)firstCollectImage {
    if (_firstCollectImage == nil) {
        _firstCollectImage = [UIImage imageNamed:self.collectImageOne];
    }
    return _firstCollectImage;
}

//第二张图片
-(UIImage *)secondCollectImage {
    if (_secondCollectImage == nil) {
        _secondCollectImage = [UIImage imageNamed:self.collectImageTwo];
    }
    return _secondCollectImage;
}

-(instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)collectCaseWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
    
}

-(void) setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end













