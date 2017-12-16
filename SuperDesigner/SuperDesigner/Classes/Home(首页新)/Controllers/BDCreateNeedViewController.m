//
//  BDCreateNeedViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/12/12.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDCreateNeedViewController.h"

@interface BDCreateNeedViewController ()
@property (strong, nonatomic) UIScrollView *scrollView;

//建筑名称
@property(nonatomic, strong) UILabel *nameLabel;
//名称输入框
@property(nonatomic, strong) UITextField *nameTF;
//建筑类型
@property(nonatomic, strong) UILabel *typeLabel;

//建筑面积
@property(nonatomic, strong) UILabel *sizeLabel;
//面积输入框
@property(nonatomic, strong) UITextField *sizeTF;

//项目预算
@property(nonatomic, strong) UILabel *sumLabel;
//预算输入框
@property(nonatomic, strong) UITextField *sumTF;

//项目地址
@property(nonatomic, strong) UILabel *addressLabel;
//地址输入框
@property(nonatomic, strong) UITextField *addressTF;

//需求说明
@property(nonatomic, strong) UILabel *explainLabel;
//说明输入框
@property(nonatomic, strong) UITextField *explainTF;

//截止时间
@property(nonatomic, strong) UILabel *timeLabel;
//时间输入框
@property(nonatomic, strong) UITextField *timeTF;

//成果交付
@property(nonatomic, strong) UILabel *giveLabel;
//交付
@property(nonatomic, strong) UITextField *giveTF;

//注意事项
@property(nonatomic, strong) UILabel *attentionLabel;
//注意输入框
@property(nonatomic, strong) UITextField *attentionTF;

//招标文件
@property(nonatomic, strong) UILabel *fileLabel;

//分割线
@property(nonatomic, strong) UIView *lineView;


@end

@implementation BDCreateNeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNav];
    [self setupUI];
}


-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;
    
}


-(void)setNav {
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"leftArrow"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    //修改导航栏的背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19], NSForegroundColorAttributeName:[UIColor grayColor]}];
    
    
}

-(void) backClick {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


-(void) setupUI {
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.alwaysBounceVertical = YES;
    [self.view addSubview:_scrollView];
    _scrollView.backgroundColor = [UIColor whiteColor];
    
    //项目名称
    self.nameLabel = [[UILabel alloc] init];
    [_scrollView addSubview:self.nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView).offset(15);
        make.left.equalTo(self.scrollView).offset(15);
        
    }];
    _nameLabel.text = @"项目名称";
    _nameLabel.textColor = ThemelightDarkColor;
    
    self.nameTF = [[UITextField alloc] init];
    [_scrollView addSubview:self.nameTF];
    [_nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(self.scrollView).offset(15);
       make.left.equalTo(self.nameLabel.mas_right).offset(8);
    }];
    _nameTF.placeholder = @"请输入";
    
    self.lineView = [[UIView alloc] init];
    [_scrollView addSubview:self.lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameTF.mas_bottom).offset(10);
        make.left.equalTo(self.scrollView).offset(0);
        make.size.mas_equalTo(CGSizeMake(KScreen_WIDTH, 1));
    }];
    _lineView.backgroundColor = rgb(228, 229, 230);
    
    
    //类型
    self.typeLabel = [[UILabel alloc] init];
    [_scrollView addSubview:self.typeLabel];
    [_typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView).offset(15);
        make.left.equalTo(self.scrollView).offset(15);
        
    }];
    _typeLabel.text = @"项目类型";
    _typeLabel.textColor = ThemelightDarkColor;
    
    //类型的标签按钮button
//    UIButton *typeButton= [[UITextField alloc] init];
//    [_scrollView addSubview:self.typeButton];
//    [_nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.scrollView).offset(15);
//        make.left.equalTo(self.nameLabel.mas_right).offset(8);
//    }];
//    _nameTF.placeholder = @"请输入";
    
    self.lineView = [[UIView alloc] init];
    [_scrollView addSubview:self.lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_typeLabel.mas_bottom).offset(100);
        make.left.equalTo(self.scrollView).offset(0);
        make.size.mas_equalTo(CGSizeMake(KScreen_WIDTH, 1));
    }];
    _lineView.backgroundColor = rgb(228, 229, 230);
    
    
    //建筑面积
    self.sizeLabel = [[UILabel alloc] init];
    [_scrollView addSubview:self.sizeLabel];
    [_sizeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView).offset(15);
        make.left.equalTo(self.scrollView).offset(15);
        
    }];
    _sizeLabel.text = @"建筑面积";
    _sizeLabel.textColor = ThemelightDarkColor;
    
    self.sizeTF = [[UITextField alloc] init];
    [self.scrollView addSubview:self.sizeTF];
    [_sizeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView).offset(15);
        make.left.equalTo(self.sizeLabel.mas_right).offset(8);
    }];
    //_sizeTF.backgroundColor = [UIColor redColor];
    _sizeTF.placeholder = @"请输入";
    
    self.lineView = [[UIView alloc] init];
    [_scrollView addSubview:self.lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sizeLabel.mas_bottom).offset(10);
        make.left.equalTo(self.scrollView).offset(0);
        make.size.mas_equalTo(CGSizeMake(KScreen_WIDTH, 1));
    }];
    _lineView.backgroundColor = rgb(228, 229, 230);
    
    
    //建筑预算
    self.sumLabel = [[UILabel alloc] init];
    [_scrollView addSubview:self.sumLabel];
    [_sumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lineView.mas_bottom).offset(15);
        make.left.equalTo(self.scrollView).offset(15);
        
    }];
    _sumLabel.text = @"建筑预算";
    _sumLabel.textColor = ThemelightDarkColor;
    
    self.sumTF = [[UITextField alloc] init];
    [self.scrollView addSubview:self.sumTF];
    [_sumTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView).offset(15);
        make.left.equalTo(self.sumLabel.mas_right).offset(8);
    }];
    //_sizeTF.backgroundColor = [UIColor redColor];
    _sumTF.placeholder = @"请输入";
    
    self.lineView = [[UIView alloc] init];
    [_scrollView addSubview:self.lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sumLabel.mas_bottom).offset(10);
        make.left.equalTo(self.scrollView).offset(0);
        make.size.mas_equalTo(CGSizeMake(KScreen_WIDTH, 1));
    }];
    _lineView.backgroundColor = rgb(228, 229, 230);
    
    
    //项目地址
    self.addressLabel = [[UILabel alloc] init];
    [_scrollView addSubview:self.addressLabel];
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lineView.mas_bottom).offset(15);
        make.left.equalTo(self.scrollView).offset(15);
        
    }];
    _addressLabel.text = @"项目地址";
    _addressLabel.textColor = ThemelightDarkColor;
    
    self.sumTF = [[UITextField alloc] init];
    [self.scrollView addSubview:self.sumTF];
    [_sumTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView).offset(15);
        make.left.equalTo(self.sumLabel.mas_right).offset(8);
    }];
    //_sizeTF.backgroundColor = [UIColor redColor];
    _sumTF.placeholder = @"请输入";
    
    self.lineView = [[UIView alloc] init];
    [_scrollView addSubview:self.lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.addressLabel.mas_bottom).offset(10);
        make.left.equalTo(self.scrollView).offset(0);
        make.size.mas_equalTo(CGSizeMake(KScreen_WIDTH, 1));
    }];
    _lineView.backgroundColor = rgb(228, 229, 230);
    
    
    //需求说明
    self.explainLabel = [[UILabel alloc] init];
    [_scrollView addSubview:self.explainLabel];
    [_explainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lineView.mas_bottom).offset(15);
        make.left.equalTo(self.scrollView).offset(15);
        
    }];
    _explainLabel.text = @"需求说明";
    _explainLabel.textColor = ThemelightDarkColor;
    
    self.explainTF = [[UITextField alloc] init];
    [self.scrollView addSubview:self.explainTF];
    [_explainTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView).offset(15);
        make.left.equalTo(self.explainLabel.mas_right).offset(8);
    }];
    //_sizeTF.backgroundColor = [UIColor redColor];
    _explainTF.placeholder = @"请输入";
    
    self.lineView = [[UIView alloc] init];
    [_scrollView addSubview:self.lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.explainLabel.mas_bottom).offset(10);
        make.left.equalTo(self.scrollView).offset(0);
        make.size.mas_equalTo(CGSizeMake(KScreen_WIDTH, 1));
    }];
    _lineView.backgroundColor = rgb(228, 229, 230);
    
    
    //截止时间
    self.timeLabel = [[UILabel alloc] init];
    [_scrollView addSubview:self.timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lineView.mas_bottom).offset(15);
        make.left.equalTo(self.scrollView).offset(15);
        
    }];
    _timeLabel.text = @"截止时间";
    _timeLabel.textColor = ThemelightDarkColor;
    
    self.timeTF = [[UITextField alloc] init];
    [self.scrollView addSubview:self.timeTF];
    [_timeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView).offset(15);
        make.left.equalTo(self.timeLabel.mas_right).offset(8);
    }];
    //_sizeTF.backgroundColor = [UIColor redColor];
    _timeTF.placeholder = @"请输入";
    
    self.lineView = [[UIView alloc] init];
    [_scrollView addSubview:self.lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeLabel.mas_bottom).offset(10);
        make.left.equalTo(self.scrollView).offset(0);
        make.size.mas_equalTo(CGSizeMake(KScreen_WIDTH, 8));
    }];
    _lineView.backgroundColor = ThemeGrayColor;
    
    
    
    //成果交付
    self.giveLabel = [[UILabel alloc] init];
    [_scrollView addSubview:self.giveLabel];
    [_giveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lineView.mas_bottom).offset(15);
        make.left.equalTo(self.scrollView).offset(15);
        
    }];
    _giveLabel.text = @"成果交付";
    _giveLabel.textColor = ThemelightDarkColor;
    
    self.giveTF = [[UITextField alloc] init];
    [self.scrollView addSubview:self.giveTF];
    [_giveTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom).offset(15);
        make.left.equalTo(self.giveLabel.mas_right).offset(8);
    }];
    _giveTF.placeholder = @"请输入";
    
    self.lineView = [[UIView alloc] init];
    [_scrollView addSubview:self.lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.giveLabel.mas_bottom).offset(10);
        make.left.equalTo(self.scrollView).offset(0);
        make.size.mas_equalTo(CGSizeMake(KScreen_WIDTH, 1));
    }];
    _lineView.backgroundColor = ThemeGrayColor;
    
    
    //注意事项
    self.attentionLabel = [[UILabel alloc] init];
    [_scrollView addSubview:self.attentionLabel];
    [_attentionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lineView.mas_bottom).offset(15);
        make.left.equalTo(self.scrollView).offset(15);
        
    }];
    _attentionLabel.text = @"注意事项";
    _attentionLabel.textColor = ThemelightDarkColor;
    
    
    self.giveTF = [[UITextField alloc] init];
    [self.scrollView addSubview:self.giveTF];
    [_giveTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom).offset(15);
        make.left.equalTo(self.giveLabel.mas_right).offset(8);
    }];
    _giveTF.placeholder = @"请输入";
    
    self.lineView = [[UIView alloc] init];
    [_scrollView addSubview:self.lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.giveLabel.mas_bottom).offset(10);
        make.left.equalTo(self.scrollView).offset(0);
        make.size.mas_equalTo(CGSizeMake(KScreen_WIDTH, 40));
    }];
    _lineView.backgroundColor = ThemeGrayColor;
    
    //招标文件
    self.fileLabel = [[UILabel alloc] init];
    [_scrollView addSubview:self.fileLabel];
    [_fileLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lineView.mas_top).offset(10);
        make.left.equalTo(self.scrollView).offset(15);
        
    }];
    _fileLabel.text = @"招标文件";
    _fileLabel.textColor = ThemelightDarkColor;
    
    
    
    
    
    
    
    
    
}


@end











































































































