//
//  BDMyHomeTableViewCell.m
//  SuperDesigner
//
//  Created by Julia on 2017/11/30.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDMyHomeTableViewCell.h"
static NSString *reusedId = @"homeCell";
#import "TagView.h"

@interface BDMyHomeTableViewCell()

//类型标签的tagView
@property(nonatomic, strong) TagView *tagView;

//设计师图片
@property(nonatomic, weak) UIImageView *nameImageView;
//设计师傅名字
@property(nonatomic, weak) UILabel *nameLable;
//标签
@property(nonatomic, weak) UILabel *typeLabel;
//工期
@property(nonatomic, weak) UILabel *dateLabel;
//工期的num
@property(nonatomic, weak) UILabel *dateNumLabel;
//预算
@property(nonatomic, weak) UILabel *sumLabel;
//预算的num
@property(nonatomic, weak) UILabel *sumNumLabel;

//时间
@property(nonatomic, weak) UILabel *timeNumLabel;

//类型
@property (nonatomic, copy) NSString *typeStr;

@end

@implementation BDMyHomeTableViewCell

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
    nameImageView.layer.cornerRadius = 5;
    [nameImageView.layer setMasksToBounds:YES];
    
    //self.nameImageView.backgroundColor = [UIColor redColor];
    
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
    
    //名字
    UILabel *timeNumLabel = [[UILabel alloc] init];
    self.timeNumLabel = timeNumLabel;
    [self.contentView addSubview:timeNumLabel];
    [timeNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        
    }];
    timeNumLabel.font = [UIFont systemFontOfSize:15];
    timeNumLabel.textColor = [UIColor grayColor];
    timeNumLabel.text = @"09-28";
    
    
    self.tagView = [[TagView alloc]initWithFrame:CGRectMake(94, 40, self.bounds.size.width, 0)];
    [self.contentView addSubview:self.tagView];
    
    
//    NSString *str = @"公共建筑,园林设计,景观设计";
//    self.typeStr = str;
//    NSArray *flagArray = [str componentsSeparatedByString:@","];
//
//    [self.tagView setTagWithTagArray:flagArray andWith:self.contentView.bounds.size.width];
    
//    NSString *str = @"公共建筑,园林设计,景观设计";
//    NSString *str = @"公共建筑,园林设计,景观设计";
    //NSLog(@"这是项目类型%@", _model.xmlx);
    //self.typeStr = str;
//    NSArray *flagArray = [self.typeStr componentsSeparatedByString:@","];
//
//    [self.tagView setTagWithTagArray:flagArray andWith:self.contentView.bounds.size.width];
    

    UILabel *timeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:timeLabel];
    self.dateLabel = timeLabel;
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tagView.mas_bottom).offset(35);
        make.left.equalTo(self.nameImageView.mas_right).offset(10);
        
    }];
    timeLabel.text = @"截止时间:";
    timeLabel.textColor = [UIColor grayColor];
    timeLabel.font = [UIFont systemFontOfSize:12];
    
    UILabel *dateNumLabel = [[UILabel alloc] init];
    [self.contentView addSubview:dateNumLabel];
    self.dateNumLabel = dateNumLabel;
    [dateNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tagView.mas_bottom).offset(35);
        make.left.equalTo(timeLabel.mas_right).offset(5);
        
    }];
    dateNumLabel.text = @"2018-10-12";
    dateNumLabel.textColor = [UIColor grayColor];
    dateNumLabel.font = [UIFont systemFontOfSize:14];
    
    
    UILabel *sumLabel = [[UILabel alloc] init];
    [self.contentView addSubview:sumLabel];
    self.sumLabel = sumLabel;
    [sumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tagView.mas_bottom).offset(35);
        make.left.equalTo(self.dateNumLabel.mas_right).offset(20);
        
    }];
    sumLabel.text = @"预算:";
    sumLabel.textColor = [UIColor grayColor];
    sumLabel.font = [UIFont systemFontOfSize:13];
    
    UILabel *sumNumLabel = [[UILabel alloc] init];
    [self.contentView addSubview:sumNumLabel];
    self.sumNumLabel = sumNumLabel;
    [sumNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tagView.mas_bottom).offset(35);
        make.left.equalTo(self.sumLabel.mas_right).offset(5);
        
    }];
    sumNumLabel.text = @"¥18000";
    sumNumLabel.textColor = [UIColor redColor];
    sumNumLabel.font = [UIFont systemFontOfSize:15];
    

}

-(void)setDateNumLabel:(UILabel *)dateNumLabel {
    _dateNumLabel = dateNumLabel;
    
  
    
}

-(void)setNameImageView:(UIImageView *)nameImageView {
    
    _nameImageView = nameImageView;
    
    
}

//设置模型数据
-(void)setModel:(BDHomeLatestNeedModel *)model {

    _model = model;
    
    [self.nameImageView sd_setImageWithURL:[NSURL URLWithString:model.img_head] placeholderImage:[UIImage imageNamed:@"homeIcon1"]];
    
    
    self.nameLable.text = model.xmjs;
    self.timeNumLabel.text = model.fbtime;
    self.typeStr = model.xmlx;
    
    self.sumNumLabel.text = model.xmys;
    self.dateNumLabel.text = model.jztime;
    
    
    //项目的类型
    NSArray *flagArray = [self.typeStr componentsSeparatedByString:@","];
    [self.tagView setTagWithTagArray:flagArray andWith:self.contentView.bounds.size.width];
    
    NSLog(@"项目的类型%@", model.xmlx);
    NSLog(@"项目的类型-->%@", self.typeStr);
    
    
    

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end













































































