//
//  BDRadioView.m
//  SuperDesigner
//
//  Created by Julia on 2017/12/13.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDRadioView.h"

@interface BDRadioView()


@property (strong,nonatomic)UIImageView *imageView;/*!< 选中或者取消选中的显示 */


@end

@implementation BDRadioView

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title

{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setup:title];
        
    }
    

    return self;
    
}

/**
 
 *  设置控件
 
 *
 
 *  @param title 单选框文字
 
 */

-(void)setup:(NSString *)title

{
    
    UIImage *image = [UIImage imageNamed:@"pref_checkbox_normal"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10,10, 30, 30)];
    [imageView setImage:image];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self addSubview:imageView];
    self.imageView = imageView;

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame) +10, 10, 100,30)];
    [label setText:title];
    [self addSubview:label];
    
}

/**
 
 *  设置选中和取消选中的效果
 *  @param isSelect BOOL
 
 */

-(void)setIsSelect:(BOOL)isSelect

{
    _isSelect = isSelect;
  
    UIImage *image = [UIImage imageNamed:@"pref_checkbox_normal"];
    
    if (isSelect) {
        
        image = [UIImage imageNamed:@"pref_checkbox_checked"];
    }
    [self.imageView setImage:image];

}
@end
    
    
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
