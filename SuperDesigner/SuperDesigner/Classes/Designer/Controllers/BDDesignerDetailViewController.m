//
//  BDDesignerDetailViewController.m
//  SuperDesigner
//
//  Created by Guo JingRui on 2017/8/1.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDDesignerDetailViewController.h"
#import "BDBaseLabel.h"
#import "BDDesignerDetailTableView.h"
#import "BDSendrequirementViewController.h"

@interface BDDesignerDetailViewController ()
@property(nonatomic,strong)UIView * headView;
@property(nonatomic,weak)UIImageView * headImageView;//头像
@property(nonatomic,strong)UIView * toolView;//上面的工具条
@property(nonatomic,weak)UIButton * attentionBtn;//关注的按钮
@property(nonatomic,strong)UIView * nameView;
@property(nonatomic,weak)BDBaseLabel * nameLabel;//昵称
@property(nonatomic,weak)UIImageView * sexImageView;//性别
@property(nonatomic,weak)BDBaseLabel * levelLabel;//等级
@property(nonatomic,weak)BDBaseLabel * IDLabel;//标识
@property(nonatomic,strong)BDBaseLabel * hobbyLabel;//擅长
@property(nonatomic,strong)UIView * fansView;
@property(nonatomic,weak)BDBaseLabel * fansLabel;//粉丝
@property(nonatomic,weak)BDBaseLabel * attentionLabel;//关注
@property(nonatomic,strong)UIView * personView;//个人view
@property(nonatomic,strong)BDDesignerDetailTableView * myTableView;


//底部接需求按钮
@property(nonatomic, strong) UIButton *acceptDemandBtn;

@end

@implementation BDDesignerDetailViewController
-(UIView *)headView{
    if (_headView == nil) {
        _headView = [[UIView alloc]init];
        [self.view addSubview:_headView];
        [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self.view);
            make.height.offset(200);
        }];
        _headView.layer.contents = (id)[UIImage imageNamed:@"designerInfo_back"].CGImage;
        
        UIImageView * headImageView = [[UIImageView alloc]init];
        [_headView addSubview:headImageView];
        [headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_headView);
            make.size.mas_equalTo(CGSizeMake(60, 60));
            make.top.equalTo(_headView).offset(25);
        }];
        [headImageView setImage:[UIImage imageNamed:@"userIcon"]];
        headImageView.layer.cornerRadius = 30;
        headImageView.layer.masksToBounds = YES;
        headImageView.layer.borderWidth = 1;
        headImageView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.headImageView = headImageView;
    }
    return _headView;
}
-(UIView *)toolView{
    if(_toolView == nil){
        _toolView = [[UIView alloc]init];
        [self.headView addSubview:_toolView];
        [_toolView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(self.headView);
            make.height.offset(44);
        }];
       UIButton * backBtn = [[UIButton alloc]init];
        [_toolView addSubview:backBtn];
        [backBtn setImage:[UIImage imageNamed:@"leftBackArrow"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headView).offset(10);
            make.top.equalTo(self.view).offset(25);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        
        UIButton * shareBtn = [[UIButton alloc]init];
        [_toolView addSubview:shareBtn];
        [shareBtn setImage:[UIImage imageNamed:@"shareBtnImage"] forState:UIControlStateNormal];
        [shareBtn addTarget:self action:@selector(shareBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.headView).offset(-10);
            make.top.equalTo(self.view).offset(25);
            make.size.mas_equalTo(CGSizeMake(22, 22));
        }];
        UIButton * attentionBtn = [[UIButton alloc]init];
        [_toolView addSubview:attentionBtn];
        [attentionBtn setTitle:@"关注Ta" forState:UIControlStateNormal];
        [attentionBtn addTarget:self action:@selector(attentionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.attentionBtn = attentionBtn;
        [attentionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(shareBtn.mas_left).offset(-5);
            make.centerY.equalTo(shareBtn);
            
        }];
    }
    return _toolView;
}
-(UIView *)nameView{
    if (_nameView == nil) {
        _nameView = [[UIView alloc]init];
        [self.headView addSubview:_nameView];

        //昵称
        BDBaseLabel * nameLabel = [[BDBaseLabel alloc]init];
        self.nameLabel = nameLabel;
        [_nameView addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(_nameView);
            make.left.equalTo(_nameView.mas_left);
        }];
        [nameLabel sizeToFit];
        nameLabel.BDTextColor([UIColor whiteColor]).BDTextFont(14).BDTextAlignment(NSTextAlignmentCenter).BDText(@"李维斯");
        //性别
        UIImageView * sexImageView = [[UIImageView alloc]init];
        self.sexImageView = sexImageView;
        [_nameView addSubview:sexImageView];
        [sexImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_nameView);
            make.left.equalTo(nameLabel.mas_right).offset(3);
            make.size.mas_equalTo(CGSizeMake(15.5, 15.5));
        }];
        sexImageView.image = [UIImage imageNamed:@"manSexImg"];
        //等级
        BDBaseLabel * levelLabel = [[BDBaseLabel alloc]init];
        [_nameView addSubview:levelLabel];
        self.levelLabel = levelLabel;
        levelLabel.layer.borderWidth = 1;
        levelLabel.layer.borderColor = ThemeColor.CGColor;
        levelLabel.layer.cornerRadius = 5;
        levelLabel.font = [UIFont systemFontOfSize:12];
        levelLabel.textAlignment = NSTextAlignmentCenter;
        levelLabel.text = @"3星";
        
//        levelLabel.BDBorderWidth(1).BDBorderCornderRadius(5).BDBorderColor(ThemeColor).BDTextFont(12).BDTextAlignment(NSTextAlignmentCenter).BDTextColor(ThemeColor).BDText(@"3星 ");
        //layer.borderColorWithUIColor
        
        [levelLabel sizeToFit];
        [levelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(sexImageView.mas_right).offset(3);
            make.top.bottom.equalTo(_nameView);
        }];
        //ID
        BDBaseLabel * IDLabel = [[BDBaseLabel alloc]init];
        self.IDLabel = IDLabel;
        [_nameView addSubview:IDLabel];
        [IDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(_nameView);
            make.left.equalTo(levelLabel.mas_right).offset(3);
        }];
        [IDLabel sizeToFit];
        IDLabel.BDTextColor([UIColor whiteColor]).BDTextAlignment(NSTextAlignmentCenter).BDTextFont(14).BDText(@"ID:46334156");
        
        //_nameView的约束
        [_nameView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.headView);
            make.top.equalTo(self.headImageView.mas_bottom).offset(15);
            make.height.offset(16);
            make.left.equalTo(nameLabel.mas_left);
            make.right.equalTo(IDLabel.mas_right);
        }];
        
    }
    return _nameView;
}
-(BDBaseLabel *)hobbyLabel{
    if (_hobbyLabel == nil) {
        _hobbyLabel = [[BDBaseLabel alloc]init];
        [self.headView addSubview:_hobbyLabel];
        [_hobbyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.headView);
            make.top.equalTo(self.nameView.mas_bottom).offset(10);
            make.height.offset(16);
        }];
        _hobbyLabel.BDTextColor([UIColor whiteColor]).BDTextFont(14).BDTextAlignment(NSTextAlignmentCenter).BDText(@"擅长建筑类型:园林,商业,观览");
    }
    return _hobbyLabel;
}
-(UIView *)fansView{
    if (_fansView == nil) {
        _fansView = [[UIView alloc]init];
        [self.headView addSubview:_fansView];
        //关注
        BDBaseLabel * attentionLabel = [[BDBaseLabel alloc]init];
        [_fansView addSubview:attentionLabel];
        self.attentionLabel = attentionLabel;
        [attentionLabel sizeToFit];
        [attentionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(_fansView);
        }];
        attentionLabel.BDTextColor([UIColor whiteColor]).BDTextFont(14).BDTextAlignment(NSTextAlignmentCenter).BDText(@"关注:15");
        //竖线
        UIView * proView = [[UIView alloc]init];
        proView.backgroundColor = [UIColor whiteColor];
        [_fansView addSubview:proView];
        [proView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(attentionLabel.mas_right).offset(5);
            make.top.bottom.equalTo(_fansView);
            make.width.offset(1);
        }];
        //粉丝
        BDBaseLabel * fansLabel = [[BDBaseLabel alloc]init];
        [_fansView addSubview:fansLabel];
        [fansLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.equalTo(_fansView);
            make.left.equalTo(proView.mas_right).offset(5);
        }];
        [fansLabel sizeToFit];
        self.fansLabel = fansLabel;
        fansLabel.BDTextColor([UIColor whiteColor]).BDTextFont(14).BDTextAlignment(NSTextAlignmentCenter).BDText(@"粉丝:15");
        //
        [_fansView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.headView);
            make.top.equalTo(self.hobbyLabel.mas_bottom).offset(10);
            make.left.equalTo(attentionLabel.mas_left);
            make.right.equalTo(fansLabel.mas_right);
        }];
        
    }
    return _fansView;
}
-(UIView *)personView{
    if (_personView == nil) {
        _personView = [[UIView alloc]init];
        [self.view addSubview:_personView];
        [_personView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(self.headView.mas_bottom);
            make.height.offset(40);
        }];
        //个人信息
        BDBaseLabel * personLabel = [[BDBaseLabel alloc]init];
        [_personView addSubview:personLabel];
        [personLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_personView);
            make.top.bottom.equalTo(_personView);
        }];
        personLabel.BDTextColor([UIColor blackColor]).BDTextFont(16).BDTextAlignment(NSTextAlignmentCenter).BDText(@"个人信息");
        //线条
        UIView * greenView = [[UIView alloc]init];
        [_personView addSubview:greenView];
        [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(_personView);
            make.height.offset(3);
        }];
        greenView.backgroundColor = ThemeColor;
        
    }
    return _personView;
}
-(BDDesignerDetailTableView *)myTableView{
    if (_myTableView == nil) {
        _myTableView = [[BDDesignerDetailTableView alloc]init];
        [self.view addSubview:_myTableView];
        
        //_myTableView.backgroundColor = [UIColor grayColor];
        [_myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            //make.left.right.bottom.equalTo(self.view);
            make.left.right.equalTo(self.view);
            make.bottom.equalTo(self.view).mas_offset(-50);
            
            make.top.equalTo(self.personView.mas_bottom);
        }];
    }
    return _myTableView;
}

#pragma mark -- 底部的接需求的按钮
-(UIButton *)acceptDemandBtn {
    if (_acceptDemandBtn == nil) {
        
        _acceptDemandBtn = [[UIButton alloc] init];
        _acceptDemandBtn.backgroundColor = ThemeColor;
        [_acceptDemandBtn setTitle:@"向Ta发需求" forState:UIControlStateNormal];
        [self.view addSubview:_acceptDemandBtn];
        [_acceptDemandBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view).mas_offset(-5);
            make.centerX.equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(200, 40));
            
        }];
        [_acceptDemandBtn setAdjustsImageWhenHighlighted:YES];
        _acceptDemandBtn.layer.cornerRadius = 5;
        _acceptDemandBtn.layer.masksToBounds = YES;
        [_acceptDemandBtn addTarget:self action:@selector(sendDemandBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _acceptDemandBtn;
}

-(void) sendDemandBtnClick {
    
    NSLog(@"向ta发需求按钮点击了");
    //跳转到发需求的页面
    self.hidesBottomBarWhenPushed = YES;
    BDSendrequirementViewController *sendVC = [[BDSendrequirementViewController alloc] init];
    [self.navigationController pushViewController:sendVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self headView];
    [self toolView];
    [self nameView];
    [self hobbyLabel];
    [self fansView];
    [self personView];
    [self myTableView];
    [self acceptDemandBtn];
    
}
#pragma mark -- 返回的按钮
-(void)backBtnClick:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    
}
#pragma mark --- 分享的点击事件
-(void)shareBtnClick:(UIButton *)sender{
    
}
#pragma mark --- 关注的点击事件
-(void)attentionBtnClick:(UIButton *)attentionBtn{
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    self.tabBarController.tabBar.hidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
