//
//  BDAccordDesignerTableViewCell.m
//  SuperDesigner
//
//  Created by Julia on 2017/12/6.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDAccordDesignerTableViewCell.h"
static NSString *reusedId = @"homeCell";

@interface BDAccordDesignerTableViewCell()

//设计师图片
@property(nonatomic, weak) UIImageView *nameImageView;
//设计师名字
@property(nonatomic, weak) UILabel *nameLable;
//大咖的标志
@property(nonatomic, weak) UIImageView *tagImageView;
//标签
@property(nonatomic, strong) TagView *tagView;
//综合评分
@property(nonatomic, weak) UILabel *scorLabel;
//综合评分的数字
@property(nonatomic, weak) UILabel *scorNumLabel;
//粉丝
@property(nonatomic, weak) UILabel *fansLabel;
//粉丝数量
@property(nonatomic, weak) UILabel *fansNumLabel;
//服务次数
@property(nonatomic, weak) UILabel *servicelabel;
//服务的次数数量
@property(nonatomic, weak) UILabel *serviceNumLabel;


@end

@implementation BDAccordDesignerTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reusedId];
    if (self) {
        [self setUpUI];
        
    }
    return self;
}

-(void) setUpUI {
    
    //设计院的图标
    UIImageView *nameImageView = [[UIImageView alloc] init];
    self.nameImageView = nameImageView;
    [self.contentView addSubview:nameImageView];
    [self.nameImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(15);
        make.size.mas_equalTo(CGSizeMake(80, 80));
        
    }];
    nameImageView.image = [UIImage imageNamed:@"home_Designer1"];
    //self.nameImageView.backgroundColor = [UIColor redColor];
        
    //名字
    UILabel *nameLabel = [[UILabel alloc] init];
    self.nameLable = nameLabel;
    [self.contentView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.nameImageView.mas_right).offset(10);
        
    }];
    nameLabel.font = [UIFont systemFontOfSize:13];
    nameLabel.text = @"我是小仙女";
    
    //大咖的标志
    UIImageView *tagImageV = [[UIImageView alloc] init];
    self.tagImageView = tagImageV;
    [self.contentView addSubview:tagImageV];
    [tagImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(12);
        make.left.equalTo(self.nameLable.mas_right).offset(5);
    }];
    tagImageV.image = [UIImage imageNamed:@"userRank_one"];
    
    
    //综合评分数字
    UILabel *scorNumLabel = [[UILabel alloc] init];
    [self.contentView addSubview:scorNumLabel];
    
    self.scorNumLabel = scorNumLabel;
    [scorNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(12);
        make.right.equalTo(self.contentView).offset(-5);
    }];
    scorNumLabel.text = @"7.0分";
    scorNumLabel.textColor = [UIColor blackColor];
    scorNumLabel.font = [UIFont systemFontOfSize:12];
    
    //综合评分
    UILabel *scorLabel = [[UILabel alloc] init];
    [self.contentView addSubview:scorLabel];
     self.scorLabel = scorLabel;
    [scorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(12);
        make.right.equalTo(scorNumLabel.mas_left).offset(-3);

    }];
    scorLabel.text = @"综合评分";
    scorLabel.textColor = [UIColor grayColor];
    scorLabel.font = [UIFont systemFontOfSize:12];
    
    
    //类型标签
    self.tagView = [[TagView alloc]initWithFrame:CGRectMake(94, 40, self.bounds.size.width, 0)];
    [self.contentView addSubview:self.tagView];
    
    
    NSString *str = @"建筑设计,园林设计,景观设计";
    NSArray *flagArray = [str componentsSeparatedByString:@","];
    //[cell.tagView setTagWithTagArray:flagArray];
    
    [self.tagView setTagWithTagArray:flagArray andWith:self.contentView.bounds.size.width];
    
    
    
    
    //粉丝标签
    UILabel *fansLabel = [[UILabel alloc] init];
    [self.contentView addSubview:fansLabel];
    self.fansLabel = fansLabel;
    [fansLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tagView.mas_bottom).offset(35);
        make.left.equalTo(self.nameImageView.mas_right).offset(10);
        
    }];
    fansLabel.text = @"粉丝";
    fansLabel.textColor = [UIColor grayColor];
    fansLabel.font = [UIFont systemFontOfSize:12];
    
    //粉丝数量
    UILabel *fansNumLabel = [[UILabel alloc] init];
    [self.contentView addSubview:fansNumLabel];
    self.fansNumLabel = fansNumLabel;
    [fansNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tagView.mas_bottom).offset(35);
        make.left.equalTo(fansLabel.mas_right).offset(5);
        
    }];
    fansNumLabel.text = @"200";
    fansNumLabel.textColor = rgb(39, 162, 252);
    fansNumLabel.font = [UIFont systemFontOfSize:14];
    
    
    UILabel *servicelabel = [[UILabel alloc] init];
    [self.contentView addSubview:servicelabel];
    self.servicelabel = servicelabel;
    [servicelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tagView.mas_bottom).offset(35);
        make.left.equalTo(self.fansNumLabel.mas_right).offset(20);
        
    }];
    servicelabel.text = @"服务次数";
    servicelabel.textColor = [UIColor grayColor];
    servicelabel.font = [UIFont systemFontOfSize:13];
    
    
    UILabel *serviceNumLabel = [[UILabel alloc] init];
    [self.contentView addSubview:serviceNumLabel];
    self.serviceNumLabel = serviceNumLabel;
    [serviceNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tagView.mas_bottom).offset(35);
        make.left.equalTo(self.servicelabel.mas_right).offset(5);
        
    }];
    serviceNumLabel.text = @"8000";
    serviceNumLabel.textColor = rgb(39, 162, 252);
    serviceNumLabel.font = [UIFont systemFontOfSize:15];
    
    
    
    
}



@end
