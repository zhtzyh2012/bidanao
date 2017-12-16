//
//  BDProfileHeadView.m
//  SuperDesigner
//
//  Created by Julia on 2017/6/14.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDProfileHeadView.h"
#import "masonry.h"
#import "BDLoginViewController.h"
#import <UIImageView+WebCache.h>

#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height


@interface BDProfileHeadView()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

//背景图片
@property(nonatomic, weak) UIImageView *backImageView;

@property(nonatomic, weak) UILabel *titleLabel;

@property(nonatomic,weak) UIButton *iconImgBtn;

@property(nonatomic, weak) UILabel *userNamelabel;

@property(nonatomic, weak) UILabel *nameLabel;

@property(nonatomic, weak) UILabel *iDLabel;

@property(nonatomic, weak) UIButton *changeSingBtn;

@property(nonatomic, weak) UILabel *iDNumLabel;


@end

@implementation BDProfileHeadView

-(instancetype) initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setHeadViewUINew];
        [self meNetFunc];
        //self.backgroundColor = [UIColor clearColor];
        
        
    }
    
    return self;
    
}


-(void)setHeadViewUINew {
    
    
    //背景图片
    self.frame = CGRectMake(0, 0, KScreenWidth, 170);
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = self.bounds;
    imageView.userInteractionEnabled = YES;
    imageView.backgroundColor = rgb(49, 144, 250);
    //imageView.image = [UIImage imageNamed:@"me_userBackImg"];
    [self addSubview:imageView];
    self.backImageView = imageView;
    
    //图像
    UIButton *imageBack = [[UIButton alloc] init];
    imageBack.backgroundColor = rgb(237, 237, 242);
    imageBack.frame = CGRectMake(0, -64, KScreenWidth, 0);
    
    [self addSubview:imageBack];
    
    
    //用户图像
    UIButton *userIconBtn = [[UIButton alloc] init];
    
    [userIconBtn setImage:[UIImage imageNamed:@"userIcon"] forState:UIControlStateNormal];
    //[userIconBtn setBackgroundColor:[UIColor clearColor]];
    
    [self.backImageView addSubview:userIconBtn];
    
    self.iconImgBtn = userIconBtn;
    
    [userIconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self).mas_offset(40);
        //make.right.equalTo(self).mas_offset(98);
        make.left.equalTo(self).mas_offset(20);
        make.height.mas_equalTo(70);
        make.width.mas_equalTo(70);
        
    }];
    self.iconImgBtn.layer.masksToBounds = YES;
    self.iconImgBtn.layer.cornerRadius = 35;
    
    
    
    [self.iconImgBtn  addTarget:self action:@selector(IconBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    //昵称标签
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"优设计";
    nameLabel.font = [UIFont systemFontOfSize:15];
    //NSString *name = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_Name"];
    //nameLabel.text = name;
    
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.font = [UIFont systemFontOfSize:18];
    [self addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.top.equalTo(self).mas_offset(40);
        make.left.equalTo(self.iconImgBtn.mas_right).mas_offset(15);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(200);
        
        
    }];
    
    
    //ID的标签
    UILabel *IDLabel = [[UILabel alloc] init];
    IDLabel.text = @"ID:";
    
    IDLabel.textColor = [UIColor whiteColor];
    IDLabel.textAlignment = NSTextAlignmentLeft;
    IDLabel.font = [UIFont systemFontOfSize:18];
    //IDLabel.backgroundColor = [UIColor redColor];
    [self addSubview:IDLabel];
    self.iDLabel = IDLabel;
    
    [IDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.nameLabel.mas_bottom).offset(20);
        make.left.equalTo(self.iconImgBtn.mas_right).mas_offset(15);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(100);
        
        
    }];
    
    //ID的数字标签
    UILabel *IDNumLabel = [[UILabel alloc] init];
    NSString *IDNum = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_Id"];
    IDLabel.text = [NSString stringWithFormat:@"ID:%@", IDNum];
    //NSLog(@"我的ID===%@", IDNum);
    IDNumLabel.textColor = [UIColor whiteColor];
    IDNumLabel.textAlignment = NSTextAlignmentLeft;
    IDNumLabel.font = [UIFont systemFontOfSize:18];
    //IDNumLabel.backgroundColor = [UIColor redColor];
    [self addSubview:IDNumLabel];
    self.iDNumLabel = IDLabel;
    
    [IDNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.nameLabel.mas_bottom).offset(20);
        make.left.equalTo(self.iDLabel.mas_right).mas_offset(0);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(130);
        
    }];
    
    UIButton *arrowBtn = [[UIButton alloc] init];
    [arrowBtn setBackgroundImage:[UIImage imageNamed:@"btn_more_white"] forState:UIControlStateNormal];
    arrowBtn.enabled = NO;
    [self addSubview:arrowBtn];
    
    [arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self).mas_offset(60);
        make.right.equalTo(self).mas_offset(-15);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(25);
        
    }];
    
}

-(void) meNetFunc {
    
    
    NSString *IDNum = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_Id"];
    NSLog(@"这个用户的ID---%@", IDNum);
   
    NSDictionary *dictParams = @{
                                 @"id": IDNum
                                 
                                 };
    
    [[BDBaseHttpTool sharedInstance] getWithUrl:url_chenkUserBasicInfo parameters:dictParams sucess:^(id json) {
        if ([json[@"code"] intValue] == 200) {
            
            NSLog(@"查询用户基本信息成功");
            NSString *nameStr = json[@"user"][@"username"];
            self.nameLabel.text = nameStr;
            
            [self.iconImgBtn.imageView sd_setImageWithURL:[NSURL URLWithString:json[@"user"][@"img_head"]] placeholderImage:[UIImage imageNamed:@"userIcon"]];
            
            
            //self.nameLabel.text = json[@"user"][@"username"];
            //self.iDNumLabel.text = json[@"user"][@"id"];
            
            
        } if ([json[@"code"] intValue] == 202) {
            
            NSLog(@"异常===");
            
        } if ([json[@"code"] intValue] == 201) {
            NSLog(@"空的参数");
        }
        
    } failure:^(NSError *error) {
        
        NSLog(@"查询失败");
    }];
}

-(void)IconBtnClick{
    
    NSLog(@"我的页面,头像按钮点击了");
    
    if ([self.delegate respondsToSelector:@selector(headViewBtnClick)]) {
        
        [self.delegate headViewBtnClick];
        
    }
    
}


@end







