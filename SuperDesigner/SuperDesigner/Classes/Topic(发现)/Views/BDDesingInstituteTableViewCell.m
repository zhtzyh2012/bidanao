//
//  BDDesingInstituteTableViewCell.m
//  SuperDesigner
//
//  Created by Julia on 2017/11/20.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDDesingInstituteTableViewCell.h"
#import "TagView.h"

static NSString *reusedId = @"designerCellID";

@interface  BDDesingInstituteTableViewCell ()

//类型标签的tagView
@property(nonatomic, strong) TagView *tagView;


//设计师图片
@property(nonatomic, weak) UIImageView *nameImageView;
//设计师傅名字
@property(nonatomic, weak) UILabel *nameLable;

// 综合评分
@property(nonatomic, weak) UILabel *sumLabel;
//综合评分的num
@property(nonatomic, weak) UILabel *sumNumLabel;
//类型
@property (nonatomic, copy) NSString *typeStr;

@end

@implementation BDDesingInstituteTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setUIFunc];
        
    }
    return self;
    
}

-(void) setUIFunc {
    
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
    nameImageView.layer.cornerRadius = 5;
    [nameImageView.layer setMasksToBounds:YES];
    
    //名字
    UILabel *nameLabel = [[UILabel alloc] init];
    self.nameLable = nameLabel;
    [self.contentView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.nameImageView.mas_right).offset(10);
        
    }];
    nameLabel.font = [UIFont systemFontOfSize:15];
    nameLabel.text = @"齐天大圣孙悟空";
    
    
    UILabel *sumNumLabel = [[UILabel alloc] init];
    [self.contentView addSubview:sumNumLabel];
    self.sumNumLabel = sumNumLabel;
    [sumNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(5);
        make.right.equalTo(self.contentView).offset(-5);
        
    }];
    sumNumLabel.text = @"7.8分";
    sumNumLabel.textColor = rgb(43, 43, 43);
    sumNumLabel.font = [UIFont systemFontOfSize:15];
    
    
    UILabel *sumLabel = [[UILabel alloc] init];
    [self.contentView addSubview:sumLabel];
    self.sumLabel = sumLabel;
    [sumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(5);
        make.right.equalTo(self.sumNumLabel.mas_left).offset(-5);
        
    }];
    sumLabel.text = @"综合评分:";
    sumLabel.textColor = [UIColor grayColor];
    sumLabel.font = [UIFont systemFontOfSize:15];
    
    
    //建筑类型
    self.tagView = [[TagView alloc]initWithFrame:CGRectMake(94, 40, self.bounds.size.width, 0)];
    [self.contentView addSubview:self.tagView];
    
    
    
}


-(void)setInstituteListModel:(BDDesignInstituteModel *)instituteListModel {
    
    _instituteListModel = instituteListModel;
    
    //[self.nameImageView sd_setImageWithURL:[NSURL URLWithString:model.img_head] placeholderImage:[UIImage imageNamed:@"homeIcon1"]];
    
    [self.nameImageView sd_setImageWithURL:[NSURL URLWithString:instituteListModel.img_head] placeholderImage:[UIImage imageNamed:@"homeIcon1"]];
    self.nameLable.text = instituteListModel.username;
    
    //类型问题-- > NSNumber 转换成字符串
    NSString *str = [NSString stringWithFormat:@"%@ 分", instituteListModel.grade];
    self.sumNumLabel.text = str;
    
    self.typeStr = instituteListModel.ican;
    //项目的类型
    NSArray *flagArray = [self.typeStr componentsSeparatedByString:@","];
    [self.tagView setTagWithTagArray:flagArray andWith:self.contentView.bounds.size.width - 50];
    
    NSLog(@"项目的类型%@", instituteListModel.ican);
    NSLog(@"项目的类型-->%@", self.typeStr);
    
    
}

@end







