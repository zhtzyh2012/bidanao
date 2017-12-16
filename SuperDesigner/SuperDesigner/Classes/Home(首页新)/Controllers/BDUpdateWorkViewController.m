//
//  BDUpdateWorkViewController.m
//  SuperDesigner
//
//  Created by Julia on 2017/10/25.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDUpdateWorkViewController.h"
#import "HXPhotoViewController.h"
#import "HXPhotoView.h"
static const CGFloat kPhotoViewMargin = 2.0;

@interface BDUpdateWorkViewController ()<HXPhotoViewDelegate, UITextViewDelegate>

@property (strong, nonatomic) HXPhotoManager *manager;
@property (strong, nonatomic) HXPhotoView *photoView;
@property (strong, nonatomic) UIScrollView *scrollView;

//输入框
@property(nonatomic, strong) UITextView *textView;
@property(nonatomic, strong) UILabel *placeHolderLabel;
@property(nonatomic, weak) UILabel *strLengthLabel;

@property(nonatomic, strong) UITextView *textViewTwo;
@property(nonatomic, strong) UILabel *placeHolderLabelTwo;
@property(nonatomic, weak) UILabel *strLengthLabelTwo;

@end

@implementation BDUpdateWorkViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"上传作品";
    [self setNav];
    [self setUpUI];
    
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

-(void)setNav {
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"leftArrow"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    //修改导航栏的背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19], NSForegroundColorAttributeName:[UIColor grayColor]}];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(upNeedButtonClick)];
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    
}



-(void) backClick {
    
    [self.navigationController popToRootViewControllerAnimated:YES];

}

-(void) upNeedButtonClick {
    
    NSLog(@"发布点击了");
    
}

-(void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    self.tabBarController.tabBar.hidden = YES;
    
}


-(void) setUpUI {
    
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.alwaysBounceVertical = YES;
    [self.view addSubview:scrollView];
    //scrollView.backgroundColor = ThemeGrayColor;
    scrollView.backgroundColor = rgb(246, 246, 246);
    self.scrollView = scrollView;
    
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [UIColor whiteColor];
    
    [self.scrollView addSubview:backView];
    backView.frame = CGRectMake(0, 15, KScreen_WIDTH,40);
    
    UITextView *textV = [[UITextView alloc] init];
    textV.frame = CGRectMake(0, 15, KScreen_WIDTH, 40);
    [self.scrollView addSubview:textV];
    self.textView = textV;
    
    self.textView.delegate = self;
    
    textV.backgroundColor = [UIColor whiteColor];
    textV.font = [UIFont systemFontOfSize:18];
    textV.tag = 666;
    
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    self.placeHolderLabel = placeHolderLabel;
    [self.scrollView addSubview:placeHolderLabel];
    placeHolderLabel.frame = CGRectMake(5, 15, KScreen_WIDTH-10, 40);
    placeHolderLabel.text = @"请填写作品名称...";
    placeHolderLabel.textColor = rgb(147, 147, 148);
    
    UILabel *strLengthLabel = [[UILabel alloc] init];
    self.strLengthLabel = strLengthLabel;
    [self.scrollView addSubview:strLengthLabel];
    strLengthLabel.text = @"0/20";
    strLengthLabel.textColor = [UIColor grayColor];
    strLengthLabel.textAlignment = NSTextAlignmentRight;
    strLengthLabel.backgroundColor = [UIColor whiteColor];
    [strLengthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.mas_top).offset(5);
        make.right.equalTo(self.view).offset(-7);
        make.size.mas_equalTo(CGSizeMake(100, 30));
        
    }];
    
    
    //第二个TextView
    
    UIView *backViewTwo = [[UIView alloc] init];
    backView.backgroundColor = [UIColor whiteColor];
    
    [self.scrollView addSubview:backViewTwo];
    backViewTwo.frame = CGRectMake(0, 70, KScreen_WIDTH, 200);
    
    UITextView *textVTwo = [[UITextView alloc] init];
    textVTwo.frame = CGRectMake(0, 70, KScreen_WIDTH, 200);
    textVTwo.tag = 667;
    [self.scrollView addSubview:textVTwo];
    self.textViewTwo = textVTwo;
    
    self.textViewTwo.delegate = self;
    
    textVTwo.backgroundColor = [UIColor whiteColor];
    textVTwo.font = [UIFont systemFontOfSize:18];
    
    UILabel *placeHolderLabelTwo = [[UILabel alloc] init];
    self.placeHolderLabelTwo = placeHolderLabelTwo;
    [self.scrollView addSubview:placeHolderLabelTwo];
    placeHolderLabelTwo.frame = CGRectMake(5, 70, KScreen_WIDTH-10, 40);
    placeHolderLabelTwo.text = @"请在这里填写作品理念描述";
    placeHolderLabelTwo.textColor = rgb(147, 147, 148);
    
    
    UILabel *strLengthLabelTwo = [[UILabel alloc] init];
    self.strLengthLabelTwo = strLengthLabelTwo;
    [self.scrollView addSubview:strLengthLabelTwo];
    strLengthLabelTwo.text = @"0/300";
    strLengthLabelTwo.textColor = [UIColor grayColor];
    strLengthLabelTwo.textAlignment = NSTextAlignmentRight;
    strLengthLabelTwo.backgroundColor = [UIColor whiteColor];
    [strLengthLabelTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(backViewTwo.mas_bottom).offset(-5);
        make.right.equalTo(self.view).offset(-7);
        make.size.mas_equalTo(CGSizeMake(100, 30));
        
    }];
    
    //添加作品图片的label
    UILabel *addLabel = [[UILabel alloc] init];
    [self.scrollView addSubview:addLabel];
    [addLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backViewTwo.mas_bottom).offset(12);
        make.left.mas_equalTo(self.view).offset(10);
        make.size.mas_equalTo(CGSizeMake(150, 30));
        
    }];
    addLabel.text = @"添加作品图片";
    addLabel.textColor = rgb(93, 93, 93);
    addLabel.font = [UIFont systemFontOfSize:17];
    //addLabel.backgroundColor = [UIColor redColor];
    

    UIView *photoBackView = [[UIView alloc] init];
    [self.scrollView addSubview:photoBackView];
    [photoBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(addLabel.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(120);

    }];
    photoBackView.backgroundColor = [UIColor whiteColor];
    
//    CGFloat width = scrollView.frame.size.width;
//    HXPhotoView *photoView = [HXPhotoView photoManager:self.manager];
//    //photoView.frame = CGRectMake(kPhotoViewMargin, kPhotoViewMargin, width - kPhotoViewMargin * 2, 0);
//    //photoView.frame = CGRectMake(kPhotoViewMargin, 320, width - kPhotoViewMargin * 2, 0);
//     photoView.frame = CGRectMake(kPhotoViewMargin, 320, width - kPhotoViewMargin * 2, 0);
//    photoView.delegate = self;
//    photoView.backgroundColor = [UIColor whiteColor];
//    [scrollView addSubview:photoView];
//    self.photoView = photoView;
    
    
}



//正在改变
- (void)textViewDidChange:(UITextView *)textView{
    
    if (textView.tag == 666) {
        
        self.placeHolderLabel.hidden = YES;
        self.strLengthLabel.text = [NSString stringWithFormat:@"%lu/20", (unsigned long)textView.text.length];
        //字数限制
        if (textView.text.length >= 20) {
            textView.text = [textView.text substringToIndex:20];
            self.strLengthLabel.text = @"20/20";
        }
        
        if (textView.text.length == 0) {
            self.placeHolderLabel.hidden = NO;
            
        }
        
    } else if (textView.tag == 667) {
        
        self.placeHolderLabelTwo.hidden = YES;
        self.strLengthLabelTwo.text = [NSString stringWithFormat:@"%lu/300", (unsigned long)textView.text.length];
        //字数限制
        if (textView.text.length >= 300) {
            textView.text = [textView.text substringToIndex:300];
            self.strLengthLabelTwo.text = @"300/300";
        }
        
        if (textView.text.length == 0) {
            self.placeHolderLabelTwo.hidden = NO;
        }
    }
}




@end
































