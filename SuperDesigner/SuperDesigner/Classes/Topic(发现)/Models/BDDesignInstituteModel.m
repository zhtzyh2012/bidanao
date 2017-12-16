//
//  BDDesignInstituteModel.m
//  SuperDesigner
//
//  Created by Julia on 2017/11/20.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDDesignInstituteModel.h"

@implementation BDDesignInstituteModel

-(UIImage *)iconImage {
    if (_iconImage == nil) {
        _iconImage = [UIImage imageNamed:self.img_head];
    }
    return _iconImage;
    
}

-(instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
    
}

+(instancetype)DesigneInstituteWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    
}



@end





















