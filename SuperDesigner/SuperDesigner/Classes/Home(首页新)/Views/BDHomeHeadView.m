//
//  BDHomeHeadView.m
//  SuperDesigner
//
//  Created by Julia on 2017/11/30.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDHomeHeadView.h"
#import "MXScrollView.h"
#import "BDHomeFindProjectViewController.h"

@interface BDHomeHeadView()<MXScrollViewDelegate>

@property(nonatomic, strong) NSArray *imageUrls;

@end


@implementation BDHomeHeadView
-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
    
}

-(void) setUpUI {
    
    self.frame = CGRectMake(0, 0, KScreen_WIDTH, 730);
    self.backgroundColor = [UIColor whiteColor];
    MXScrollView *mxScrollView = [[MXScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 180) withContents:self.imageUrls andScrollDelay:2];
    
    //方法二：设置回调Block
    mxScrollView.clickHandler = ^(NSInteger index) {
        
        //NSLog(@"图片index：%ld",index);
        
    };
    
    [self addSubview:mxScrollView];
    
    
    
    UIView *lineView = [[UIView alloc] init];
    [self addSubview:lineView];
    lineView.backgroundColor = [UIColor clearColor];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mxScrollView.mas_bottom).offset(13);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(1, 700));
        
    }];
    
    //第一个Button
    UIButton *buttonOne = [[UIButton alloc] init];
    //buttonOne.backgroundColor = [UIColor orangeColor];
    [self addSubview:buttonOne];
    [buttonOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mxScrollView.mas_bottom).offset(13);
        make.left.equalTo(self).offset(25);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        
    }];
    [buttonOne setImage:[UIImage imageNamed:@"one_home"] forState:UIControlStateNormal];
    [buttonOne addTarget:self action:@selector(findDesignerClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *labelOne = [[UILabel alloc] init];
    [self addSubview:labelOne];
    [labelOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(buttonOne.mas_bottom).offset(14);
        make.left.equalTo(self).offset(20);
    }];
    labelOne.text = @"找设计";
    labelOne.font = [UIFont systemFontOfSize:16];
    labelOne.textColor = rgb(110, 110, 110);
    
    //第二个button
    UIButton *buttontwo = [[UIButton alloc] init];
    [self addSubview:buttontwo];
    //buttontwo.backgroundColor = [UIColor orangeColor];
    [self addSubview:buttontwo];
    [buttontwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mxScrollView.mas_bottom).offset(13);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.right.equalTo(lineView.mas_right).offset(-35);
    }];
    [buttontwo setImage:[UIImage imageNamed:@"two_home"] forState:UIControlStateNormal];
    [buttontwo addTarget:self action:@selector(findProjectClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *labelTwo = [[UILabel alloc] init];
    [self addSubview:labelTwo];
    [labelTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(buttontwo.mas_bottom).offset(14);
        make.right.equalTo(lineView.mas_right).offset(-25);
    }];
    labelTwo.text = @"找项目";
    labelTwo.font = [UIFont systemFontOfSize:16];
    labelTwo.textColor = rgb(110, 110, 110);
    
    
    //第三个button
    UIButton *buttonthree = [[UIButton alloc] init];
    [self addSubview:buttonthree];
    //buttonthree.backgroundColor = [UIColor orangeColor];
    [self addSubview:buttonthree];
    [buttonthree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mxScrollView.mas_bottom).offset(13);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.left.equalTo(lineView.mas_right).offset(35);
    }];
    [buttonthree setImage:[UIImage imageNamed:@"three_home"] forState:UIControlStateNormal];
    [buttonthree addTarget:self action:@selector(homeFindConstructionClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *labelThree = [[UILabel alloc] init];
    [self addSubview:labelThree];
    [labelThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(buttontwo.mas_bottom).offset(14);
        make.left.equalTo(lineView.mas_right).offset(20);
    }];
    labelThree.text = @"找工程商";
    labelThree.font = [UIFont systemFontOfSize:16];
    labelThree.textColor = rgb(110, 110, 110);
    
    //第四个button
    UIButton *buttonfour = [[UIButton alloc] init];
    [self addSubview:buttonfour];
    //buttonfour.backgroundColor = [UIColor orangeColor];
    [self addSubview:buttonfour];
    [buttonfour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mxScrollView.mas_bottom).offset(13);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.right.equalTo(self).offset(-30);
    }];
    [buttonfour setImage:[UIImage imageNamed:@"four_home"] forState:UIControlStateNormal];
    
    [buttonfour addTarget:self action:@selector(homeFindContsClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *labelfour = [[UILabel alloc] init];
    [self addSubview:labelfour];
    [labelfour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(buttontwo.mas_bottom).offset(14);
        make.right.equalTo(self).offset(-20);
    }];
    labelfour.text = @"找建材";
    labelfour.font = [UIFont systemFontOfSize:16];
    labelfour.textColor = rgb(110, 110, 110);
    //labelfour.textAlignment = NSTextAlignmentCenter;
    
    UIView *splitView = [[UIView alloc] init];
    [self addSubview:splitView];
    splitView.backgroundColor = rgb(245, 246, 246);
    [splitView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelOne.mas_bottom).offset(20);
        make.left.equalTo(self).offset(0);
        make.size.mas_equalTo(CGSizeMake(KScreen_WIDTH, 15));
        
    }];
    
    UILabel *labelselect = [[UILabel alloc] init];
    [self addSubview:labelselect];
    [labelselect mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(splitView.mas_bottom).offset(20);
        make.left.equalTo(self).offset(15);
    }];
    labelselect.text = @"精选作品";
    labelselect.font = [UIFont systemFontOfSize:17];
    labelselect.textColor = rgb(69, 69, 69);
    
    //第五个更多button
    UIButton *buttonMore = [[UIButton alloc] init];
    [self addSubview:buttonMore];
    //buttonMore.backgroundColor = [UIColor orangeColor];
    [self addSubview:buttonMore];
    [buttonMore mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(splitView.mas_top).offset(20);
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.right.equalTo(self).offset(-15);
    }];
    [buttonMore setBackgroundImage:[UIImage imageNamed:@"more_home"] forState:UIControlStateNormal];
    
    UIView *splitTwoView = [[UIView alloc] init];
    [self addSubview:splitTwoView];
    splitTwoView.backgroundColor = rgb(238, 238, 238);
    [splitTwoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelselect.mas_bottom).offset(10);
        make.left.equalTo(self).offset(0);
        make.size.mas_equalTo(CGSizeMake(KScreen_WIDTH, 1));
        
    }];
    
    //第一张大图
    UIImageView *imageOne = [[UIImageView alloc] init];
    [self addSubview:imageOne];
    //bigImage_1
    [imageOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(splitTwoView.mas_bottom).offset(16);
        make.left.equalTo(self).offset(15);
        make.right.equalTo(lineView).offset(-5);
        
    }];
    imageOne.image = [UIImage imageNamed:@"bigImage_1"];
    
    //第2张大图
    UIImageView *imageTwo = [[UIImageView alloc] init];
    [self addSubview:imageTwo];
    //bigImage_1
    [imageTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(splitTwoView.mas_bottom).offset(16);
        make.left.equalTo(lineView.mas_right).offset(5);
        make.right.equalTo(self).offset(-15);
        
    }];
    imageTwo.image = [UIImage imageNamed:@"bigImage_2"];
    
    //第3张大图
    UIImageView *imageThree = [[UIImageView alloc] init];
    [self addSubview:imageThree];
    [imageThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageOne.mas_bottom).offset(10);
        make.left.equalTo(self).offset(15);
        make.right.equalTo(lineView).offset(-5);

    }];
    imageThree.image = [UIImage imageNamed:@"bigImage_3"];

    //第4张大图
    UIImageView *imageFour = [[UIImageView alloc] init];
    [self addSubview:imageFour];
    [imageFour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageTwo.mas_bottom).offset(10);
        make.right.equalTo(self).offset(-15);
        make.left.equalTo(lineView).offset(5);

    }];
    imageFour.image = [UIImage imageNamed:@"bigImage_4"];

    UIView *splitThreeView = [[UIView alloc] init];
    [self addSubview:splitThreeView];
    splitThreeView.backgroundColor = rgb(245, 246, 246);
    [splitThreeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageFour.mas_bottom).offset(12);
        make.left.equalTo(self).offset(0);
        make.size.mas_equalTo(CGSizeMake(KScreen_WIDTH, 8));
        
    }];
    
    //最新设计需求
    UILabel *labelselecNewt = [[UILabel alloc] init];
    [self addSubview:labelselecNewt];
    [labelselecNewt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(splitThreeView.mas_bottom).offset(15);
        make.left.equalTo(self).offset(15);
    }];
    labelselecNewt.text = @"最新设计需求";
    labelselecNewt.font = [UIFont systemFontOfSize:17];
    labelselecNewt.textColor = rgb(69, 69, 69);
    
    //第五个更多button
    UIButton *buttonMoreTwo = [[UIButton alloc] init];
    [self addSubview:buttonMoreTwo];
    //buttonMore.backgroundColor = [UIColor orangeColor];
    [self addSubview:buttonMoreTwo];
    [buttonMoreTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(splitThreeView.mas_top).offset(15);
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.right.equalTo(self).offset(-15);
    }];
    [buttonMoreTwo setBackgroundImage:[UIImage imageNamed:@"more_home"] forState:UIControlStateNormal];
    
    
    UIView *splitFourView = [[UIView alloc] init];
    [self addSubview:splitFourView];
    splitFourView.backgroundColor = rgb(238, 238, 238);
    [splitFourView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelselecNewt.mas_bottom).offset(15);
        make.left.equalTo(self).offset(0);
        make.size.mas_equalTo(CGSizeMake(KScreen_WIDTH, 1));
        
    }];
    
}

#pragma mark -- tableView的headView的初始化
- (void)clickImageIndex:(NSInteger)index {
    
    //NSLog(@"图片index：%ld",index);
}

- (NSArray *)imageUrls {
    
    //    return @[@"http://123.56.183.204:8080/ios/1.jpg", @"http://pic8.nipic.com/20100808/4953913_162517044879_2.jpg",@"http://www.taopic.com/uploads/allimg/121214/267863-12121421114939.jpg"];
    
    return @[@"http://123.56.183.204:8080/ios/1.jpg", @"http://123.56.183.204:8080/ios/2.jpg",@"http://123.56.183.204:8080/ios/3.jpg"];
    
}

//找设计
-(void) findDesignerClick {
    if ([self.delegate respondsToSelector:@selector(homeFindDesignerClick)]) {
        [self.delegate homeFindDesignerClick];
    }
    
}

//找项目
-(void) findProjectClick {
    if ([self.delegate respondsToSelector:@selector(homeFindProjectClick)]) {
        [self.delegate homeFindProjectClick];
    }
}

//找工程商
-(void) homeFindConstructionClick {
    if ([self.delegate respondsToSelector:@selector(homeFindConstructionClick)]) {
        [self.delegate homeFindConstructionClick];
    }
}

//找建材
-(void) homeFindContsClick {
    if ([self.delegate respondsToSelector:@selector(homeFindConsMaterialClick)]) {
        [self.delegate homeFindConsMaterialClick];
    }
}

@end














































