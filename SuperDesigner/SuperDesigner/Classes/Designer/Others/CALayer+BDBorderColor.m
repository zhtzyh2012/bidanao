//
//  CALayer+BDBorderColor.m
//  SuperDesigner
//
//  Created by Julia on 2017/9/15.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "CALayer+BDBorderColor.h"
#import <UIKit/UIKit.h>

@implementation CALayer (BDBorderColor)


- (void)setBorderColorWithUIColor:(UIColor *)color
{
    
    self.borderColor = color.CGColor;
}

@end
