//
//  BDMyAdviceViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/11/1.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDMyAdviceViewController.h"
#import "HXPhotoViewController.h"
#import "HXPhotoView.h"
static const CGFloat kPhotoViewMargin = 2.0;


@interface BDMyAdviceViewController ()<UITextViewDelegate, HXPhotoViewDelegate>

@property(nonatomic, strong) UITextView *textView;
@property(nonatomic, strong) UILabel *placeHolderLabel;
@property(nonatomic, weak) UILabel *strLengthLabel;
//改进的label
@property(nonatomic, weak) UILabel *proLabel;

@property (strong, nonatomic) HXPhotoManager *manager;
@property (strong, nonatomic) HXPhotoView *photoView;
@property (strong, nonatomic) UIScrollView *scrollView;


@end

@implementation BDMyAdviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = ThemeGrayColor;
    [self setNav];
    self.title = @"意见反馈";
    
    [self setUpUI];
    [self setUpUIInputFunc];
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.translucent = YES;
    
    
}

-(void) setUpUI {
    
    //self.automaticallyAdjustsScrollViewInsets = YES;
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.alwaysBounceVertical = YES;
    [self.view addSubview:_scrollView];
    _scrollView.backgroundColor = [UIColor redColor];
    //scrollView.backgroundColor = rgb(246, 246, 246);
    
    UILabel *label = [[UILabel alloc] init];
    [_scrollView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(self.view).offset(10);
        make.size.mas_equalTo(CGSizeMake(300, 20));
        
    }];
    label.text = @"请选择您想反馈的问题  (必填) ";
    label.textColor = [UIColor grayColor];
    
    UIView *backView = [[UIView alloc] init];
    [_scrollView addSubview:backView];
    backView.backgroundColor = [UIColor whiteColor];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(10);
        make.left.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(135);
    }];
    
    //第一个按钮
    UIButton *firstBtn = [[UIButton alloc] init];
    [_scrollView addSubview:firstBtn];
    [firstBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView).offset(15);
        make.left.equalTo(self.view).offset(10);
        make.size.mas_equalTo(CGSizeMake(22, 22));
        
    }];
    //firstBtn.backgroundColor = [UIColor redColor];
    [firstBtn setImage:[UIImage imageNamed:@"normalBtnClickImg"] forState:UIControlStateNormal];
    
    [firstBtn setImage:[UIImage imageNamed:@"selectBtnClickImg"] forState:UIControlStateSelected];
    
    [firstBtn addTarget:self action:@selector(firstBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *oneTextLabel = [[UILabel alloc] init];
    [_scrollView addSubview:oneTextLabel];
    [oneTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView).offset(13);
        make.left.equalTo(firstBtn.mas_right).offset(7);
        make.size.mas_equalTo(CGSizeMake(340, 23));
        
    }];
    oneTextLabel.text = @"功能异常:功能故障或不可用";
    oneTextLabel.font = [UIFont systemFontOfSize:15];
    oneTextLabel.textColor = [UIColor grayColor];
    //oneTextLabel.backgroundColor = [UIColor redColor];
    
    
    //第一个分割线
    UIView *splitV = [[UIView alloc] init];
    [_scrollView addSubview:splitV];
    [splitV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(firstBtn.mas_bottom).offset(7);
        make.left.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(1);
        
    }];
    splitV.backgroundColor = rgb(241, 240, 240);
    
    //第二个label
    UILabel *twoTextLabel = [[UILabel alloc] init];
    [_scrollView addSubview:twoTextLabel];
    [twoTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(splitV).offset(9);
        make.left.equalTo(firstBtn.mas_right).offset(7);
        make.size.mas_equalTo(CGSizeMake(340, 23));
        
    }];
    twoTextLabel.text = @"产品建议:用着不爽,我有建议";
    twoTextLabel.font = [UIFont systemFontOfSize:15];
    twoTextLabel.textColor = [UIColor grayColor];
    //oneTextLabel.backgroundColor = [UIColor redColor];
    
    //第二个按钮
    UIButton *secondBtn = [[UIButton alloc] init];
    [_scrollView addSubview:secondBtn];
    [secondBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(firstBtn.mas_bottom).offset(17);
        make.left.equalTo(self.view).offset(10);
        make.size.mas_equalTo(CGSizeMake(22, 22));
        
    }];
    [secondBtn setImage:[UIImage imageNamed:@"normalBtnClickImg"] forState:UIControlStateNormal];
    [secondBtn setImage:[UIImage imageNamed:@"selectBtnClickImg"] forState:UIControlStateSelected];
     [secondBtn addTarget:self action:@selector(secondBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //第二个分割线
    UIView *splitVi = [[UIView alloc] init];
    [_scrollView addSubview:splitVi];
    [splitVi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(secondBtn.mas_bottom).offset(10);
        make.left.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(1);
        
    }];
    splitVi.backgroundColor = rgb(241, 240, 240);
    
    //第三个label
    UILabel *threeTextLabel = [[UILabel alloc] init];
    [_scrollView addSubview:threeTextLabel];
    [threeTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(splitVi).offset(12);
        make.left.equalTo(firstBtn.mas_right).offset(7);
        make.size.mas_equalTo(CGSizeMake(340, 23));
        
    }];
    threeTextLabel.text = @"其他问题";
    threeTextLabel.font = [UIFont systemFontOfSize:15];
    threeTextLabel.textColor = [UIColor grayColor];
    //oneTextLabel.backgroundColor = [UIColor redColor];
    
    //第三个按钮
    UIButton *thirdBtn = [[UIButton alloc] init];
    [_scrollView addSubview:thirdBtn];
    [thirdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(splitVi.mas_bottom).offset(12);
        make.left.equalTo(self.view).offset(10);
        make.size.mas_equalTo(CGSizeMake(22, 22));
        
    }];
    [thirdBtn setImage:[UIImage imageNamed:@"normalBtnClickImg"] forState:UIControlStateNormal];
    [thirdBtn setImage:[UIImage imageNamed:@"selectBtnClickImg"] forState:UIControlStateSelected];
    [thirdBtn addTarget:self action:@selector(thirdBtnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //改进label
    UILabel *proLabel = [[UILabel alloc] init];
    [self.scrollView addSubview:proLabel];
    self.proLabel = proLabel;
    
    [proLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.mas_bottom).offset(13);
        make.left.equalTo(self.view).offset(7);
        make.size.mas_equalTo(CGSizeMake(140, 23));
        
    }];
    proLabel.text = @"改进建议";
    proLabel.font = [UIFont systemFontOfSize:17];
    proLabel.textColor = rgb(108, 109, 109);
    
    
    
    
}

-(void) firstBtnClick:(UIButton *)sender {
    
    sender.selected = ! sender.selected;
    NSLog(@"按钮点击了");
}

-(void) secondBtnClick:(UIButton *)sender {
    sender.selected = ! sender.selected;
  
}

-(void) thirdBtnBtnClick:(UIButton *)sender {
    sender.selected = ! sender.selected;
}

-(void)setNav {
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"leftArrow"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    //修改导航栏的背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19], NSForegroundColorAttributeName:[UIColor grayColor]}];
    
    
}

-(void) setUpUIInputFunc {
    
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [UIColor redColor];
    
    [self.scrollView addSubview:backView];
    backView.frame = CGRectMake(0, 0, KScreen_WIDTH, 150);
    
    //=======================================================
    UITextView *textV = [[UITextView alloc] init];
    textV.frame = CGRectMake(0, 220, KScreen_WIDTH, 150);
    [self.scrollView addSubview:textV];
    self.textView = textV;
    self.textView.delegate = self;
    
    textV.backgroundColor = [UIColor whiteColor];
    textV.font = [UIFont systemFontOfSize:18];
    
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    self.placeHolderLabel = placeHolderLabel;
    [self.scrollView addSubview:placeHolderLabel];
    placeHolderLabel.frame = CGRectMake(5, 220, KScreen_WIDTH-10, 40);
    placeHolderLabel.text = @"期待您的宝贵建议";
    //placeHolderLabel.textAlignment = NSTextAlignmentCenter;
    placeHolderLabel.textColor = rgb(147, 147, 148);
    
    UILabel *strLengthLabel = [[UILabel alloc] init];
    self.strLengthLabel = strLengthLabel;
    [self.scrollView addSubview:strLengthLabel];
    strLengthLabel.text = @"0/140";
    strLengthLabel.textColor = [UIColor grayColor];
    strLengthLabel.textAlignment = NSTextAlignmentRight;
    strLengthLabel.backgroundColor = [UIColor whiteColor];
    [strLengthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(backView.mas_bottom).offset(-5);
        make.right.equalTo(self.view).offset(-7);
        make.size.mas_equalTo(CGSizeMake(100, 30));
        
    }];
    
    //联系方式
    UILabel *contactLabel = [[UILabel alloc] init];
    [self.scrollView addSubview:contactLabel];
    //self.contactLabel = contactLabel;
    
    [contactLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.mas_bottom).offset(15);
        make.left.equalTo(self.view).offset(7);
        make.size.mas_equalTo(CGSizeMake(140, 23));
        
    }];
    contactLabel.text = @"联系方式";
    contactLabel.font = [UIFont systemFontOfSize:17];
    contactLabel.textColor = rgb(108, 109, 109);
    
    UITextField *textF = [[UITextField alloc] init];
    [self.scrollView addSubview:textF];
    [textF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contactLabel.mas_bottom).offset(10);
        make.left.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(50);
        
    }];
    textF.backgroundColor = [UIColor whiteColor];
    textF.placeholder = @"请留下您的任意一种联系方式, 手机/邮箱/QQ";
    
    //提供截图
    UILabel *picLabel = [[UILabel alloc] init];
    [self.scrollView addSubview:picLabel];
    //self.contactLabel = contactLabel;
    
    [picLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textF.mas_bottom).offset(15);
        make.left.equalTo(self.view).offset(10);
        make.size.mas_equalTo(CGSizeMake(300, 23));
        
    }];
    picLabel.text = @"请提供相关问题的截图或者图片";
    picLabel.font = [UIFont systemFontOfSize:17];
    picLabel.textColor = rgb(108, 109, 109);
    
    
    
    UIView *photoBackView = [[UIView alloc] init];
    [self.scrollView addSubview:photoBackView];
    [photoBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(picLabel.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(120);
        
    }];
    photoBackView.backgroundColor = [UIColor whiteColor];
    
    CGFloat width = self.scrollView.frame.size.width;
    HXPhotoView *photoView = [HXPhotoView photoManager:self.manager];
    
    //photoView.frame = CGRectMake(kPhotoViewMargin, kPhotoViewMargin, width - kPhotoViewMargin * 2, 0);
    //photoView.frame = CGRectMake(kPhotoViewMargin, 320, width - kPhotoViewMargin * 2, 0);
    photoView.frame = CGRectMake(kPhotoViewMargin, 510, width - kPhotoViewMargin * 2, 0);
    photoView.delegate = self;
    photoView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:photoView];
    self.photoView = photoView;
    
}

- (HXPhotoManager *)manager {
    if (!_manager) {
        _manager = [[HXPhotoManager alloc] initWithType:HXPhotoManagerSelectedTypePhotoAndVideo];
        _manager.openCamera = YES;
        _manager.cacheAlbum = YES;
        _manager.lookLivePhoto = YES;
        //_manager.outerCamera = YES;
        _manager.open3DTouchPreview = YES;
        _manager.cameraType = HXPhotoManagerCameraTypeSystem;
        _manager.photoMaxNum = 9;
        _manager.videoMaxNum = 9;
        _manager.maxNum = 18;
        _manager.saveSystemAblum = NO;
        //        _manager.selectTogether = NO;
        //        _manager.rowCount = 3;
    }
    return _manager;
}

- (void)photoView:(HXPhotoView *)photoView changeComplete:(NSArray<HXPhotoModel *> *)allList photos:(NSArray<HXPhotoModel *> *)photos videos:(NSArray<HXPhotoModel *> *)videos original:(BOOL)isOriginal {
    NSSLog(@"所有:%ld - 照片:%ld - 视频:%ld",allList.count,photos.count,videos.count);
    
}

- (void)photoView:(HXPhotoView *)photoView deleteNetworkPhoto:(NSString *)networkPhotoUrl {
    NSSLog(@"%@",networkPhotoUrl);
}

- (void)photoView:(HXPhotoView *)photoView updateFrame:(CGRect)frame {
    NSSLog(@"%@",NSStringFromCGRect(frame));
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, CGRectGetMaxY(frame) + kPhotoViewMargin);
    
}


//正在改变
- (void)textViewDidChange:(UITextView *)textView{
    
    self.placeHolderLabel.hidden = YES;
    self.strLengthLabel.text = [NSString stringWithFormat:@"%lu/140", (unsigned long)textView.text.length];
    //字数限制
    if (textView.text.length >= 140) {
        textView.text = [textView.text substringToIndex:140];
        self.strLengthLabel.text = @"140/140";
    }
    
    if (textView.text.length == 0) {
        self.placeHolderLabel.hidden = NO;
        
    }
    
}



-(void) backClick {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}






@end
