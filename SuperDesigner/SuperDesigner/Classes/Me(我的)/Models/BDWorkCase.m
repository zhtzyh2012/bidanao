//
//  BDWorkCase.m
//  SuperDesigner
//
//  Created by Julia on 2017/10/17.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDWorkCase.h"

@implementation BDWorkCase

- (UIImage *)image{
    if (_image == nil) {
        _image = [UIImage imageNamed:self.workImageOne];
    }
    return _image;
    
}

- (UIImage *)pictureImage{
    
    if(_pictureImage == nil){
        
        _pictureImage = [UIImage imageNamed:self.workImageTwo];
        
    }
    return _pictureImage;
    
}


-(instancetype)initWithDict:(NSDictionary *)dict {
    
    self = [super init];
    if (self) {
        
        [self setValuesForKeysWithDictionary:dict];
        
    }
    return  self;
    
}

+(instancetype)workCaseWithDict:(NSDictionary *)dict {
    
    return [[self alloc ] initWithDict:dict];
    
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}



@end
