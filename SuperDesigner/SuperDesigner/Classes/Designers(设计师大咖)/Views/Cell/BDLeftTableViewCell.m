//
//  BDLeftTableViewCell.m
//  SuperDesigner
//
//  Created by Julia on 2017/11/23.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDLeftTableViewCell.h"

static NSString *reusedId = @"DakaCell";
#import "TagView.h"



@interface BDLeftTableViewCell()
//背景大图
@property(nonatomic, weak) UIImageView *bigImage;
//签名
@property(nonatomic, weak) UILabel *singLabel;
//姓名
@property(nonatomic, weak) UILabel *nameLabel;
//大咖标识别
@property(nonatomic, weak) UIImageView *bigStaerImageView;
//加关注按钮
@property(nonatomic, weak) UIButton *attentionButton;
//建筑类型标签
@property(nonatomic, weak) UILabel *typeLabel;
//粉丝
@property(nonatomic, weak) UILabel *fansLabel;
//作品
@property(nonatomic, weak) UILabel *worksLabel;

//粉丝数量
@property(nonatomic, weak) UILabel *fansNumLabel;
//作品数量
@property(nonatomic, weak) UILabel *worksNumLabel;


//类型标签的tagView
@property(nonatomic, strong) TagView *tagView;

@end


@implementation BDLeftTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpUI];
        
    }
    return self;
    
}

-(void) setUpUI {
    
    UIImageView *bigImage = [[UIImageView alloc] init];
    self.bigImage = bigImage;
    [self.contentView addSubview:bigImage];
    [bigImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(5);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.mas_equalTo(KScreen_HEIGHT *0.58);
        
    }];
    bigImage.image = [UIImage imageNamed:@"userBigImage"];
    
    UILabel *singLabel = [[UILabel alloc] init];
    self.singLabel = singLabel;
    [self.contentView addSubview:singLabel];
    [singLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bigImage.mas_bottom).offset(5);
        make.left.equalTo(self.contentView).offset(12);
        make.right.equalTo(self.contentView).offset(-12);
        make.height.mas_equalTo(40);
        
    }];
    singLabel.numberOfLines = 0;
    //singLabel.backgroundColor = [UIColor orangeColor];
    singLabel.text = @"但愿人长久啊,千里共婵娟,你是猴子派来的救兵吗,长得这么卡哇伊☺,原来你真的是一个逗比(=@__@=)";
    singLabel.font = [UIFont systemFontOfSize:14];
    singLabel.textColor = rgb(145, 144, 144);
    
    UILabel *nameLael = [[UILabel alloc] init];
    self.nameLabel = nameLael;
    [self.contentView addSubview:nameLael];
    nameLael.text = @"齐天大圣";
    nameLael.numberOfLines = 0;
    //nameLael.backgroundColor = [UIColor orangeColor];
    
//    NSString *nameStr = self.nameLabel.text;
//    NSDictionary *attributeDict = @{NSFontAttributeName :[UIFont systemFontOfSize:15]};
//    CGRect userNameBounds = [ nameStr boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributeDict context:nil];
//
//    nameLael.frame = CGRectMake(13, KScreen_HEIGHT * 0.68,  userNameBounds.size.width+30, userNameBounds.size.height);
    
    [nameLael mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.singLabel.mas_bottom).offset(8);
        make.left.equalTo(self.contentView).offset(12);
        make.height.mas_equalTo(30);
        
    }];
    
    
    //设置大咖的标志
    UIImageView *starImage = [[UIImageView alloc] init];
    self.bigStaerImageView = starImage;
    [self.contentView addSubview:starImage];
    starImage.image = [UIImage imageNamed:@"userRank_one"];
    [starImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLabel.mas_centerY);
        make.left.equalTo(self.nameLabel.mas_right).offset(6.4);
        make.size.mas_equalTo(CGSizeMake(45, 17));
        
    }];
    //starImage.frame = CGRectMake(CGRectGetMaxX(self.nameLabel.frame) + 20, CGRectGetMinY(self.nameLabel.frame), 45 , 17);
    
    //加关注的按钮
    UIButton *addButton = [[UIButton alloc] init];
    self.attentionButton = addButton;
    [self.contentView addSubview:addButton];
    [addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.singLabel.mas_bottom).offset(15);
        make.right.equalTo(self.contentView).offset(-13);
        make.size.mas_equalTo(CGSizeMake(68, 33));
        
    }];
    [addButton setImage:[UIImage imageNamed:@"addAttention"] forState:UIControlStateNormal];
    [addButton setImage:[UIImage imageNamed:@"addAttention_selected"] forState:UIControlStateSelected];
    
    //addButton.backgroundColor = [UIColor orangeColor];
    [addButton addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UILabel *typeLabel = [[UILabel alloc] init];
    self.typeLabel = typeLabel;
    [self.contentView addSubview:typeLabel];
    self.typeLabel.text = @"园林设计,建筑设计,读书设计";
    [typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(7);
        make.left.equalTo(self.contentView).offset(13);
        make.height.mas_equalTo(33);
    }];
    

     //粉丝
    UILabel *fansLabel = [[UILabel alloc] init];
    
    [self.contentView addSubview:fansLabel];
    self.fansLabel = fansLabel;
    self.fansLabel.text = @"粉丝:";
    self.fansLabel.textColor = rgb(113, 112, 112);
    //fansLabel.backgroundColor = [UIColor redColor];
    [fansLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.typeLabel.mas_bottom).offset(5);
        make.left.equalTo(self.contentView).offset(15);
        make.height.mas_equalTo(25);
    }];
    
    //粉丝数量
    UILabel *fansNumLabel = [[UILabel alloc] init];
    self.fansNumLabel = fansNumLabel;
    [self.contentView addSubview:fansNumLabel];
    fansNumLabel.text = @"1万";
    fansNumLabel.textColor = rgb(54, 156, 252);
    //fansNumLabel.backgroundColor = [UIColor blueColor];
    [fansNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.typeLabel.mas_bottom).offset(5);
        make.left.equalTo(self.fansLabel.mas_right).offset(2);
        make.height.mas_equalTo(25);
    }];
    
    
    //作品
    UILabel *worksLabel = [[UILabel alloc] init];
    self.worksLabel = worksLabel;
    
    [self.contentView addSubview:worksLabel];
    self.worksLabel.text = @"作品:";
    self.worksLabel.textColor = rgb(113, 112, 112);
    //fansLabel.backgroundColor = [UIColor redColor];
    [worksLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.typeLabel.mas_bottom).offset(5);
        make.left.equalTo(fansNumLabel).offset(60);
        make.height.mas_equalTo(25);
    }];
    
    //作品数量
    UILabel *workNumLabel = [[UILabel alloc] init];
    self.worksNumLabel = workNumLabel;
    [self.contentView addSubview:workNumLabel];
    workNumLabel.text = @"2000";
    workNumLabel.textColor = rgb(54, 156, 252);
    //fansNumLabel.backgroundColor = [UIColor blueColor];
    [workNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.typeLabel.mas_bottom).offset(5);
        make.left.equalTo(self.worksLabel.mas_right).offset(2);
        make.height.mas_equalTo(25);
    }];
    
    
    
    
    
    
}

#pragma mark -- 设置模型数据
-(void)setInstituteListModel:(BDDesignInstituteModel *)instituteListModel {
    
    _instituteListModel = instituteListModel;
    
    [self.bigImage sd_setImageWithURL:[NSURL URLWithString:instituteListModel.img_head] placeholderImage:[UIImage imageNamed:@"userBigImage"]];
    self.singLabel.text = instituteListModel.resume;
    self.nameLabel.text = instituteListModel.username;
    
    self.fansNumLabel.text = instituteListModel.fensi;
    self.worksNumLabel.text = instituteListModel.workscount;
    
    //设置TagView
    
    
    
}


-(void) addButtonClick:(UIButton *)sender {
    
    sender.selected = !sender.selected;

}


@end


























