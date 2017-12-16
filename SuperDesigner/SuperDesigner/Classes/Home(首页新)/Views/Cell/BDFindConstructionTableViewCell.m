//
//  BDFindConstructionTableViewCell.m
//  SuperDesigner
//
//  Created by Julia on 2017/12/4.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDFindConstructionTableViewCell.h"
static NSString *cellId = @"findConstCell";

@interface BDFindConstructionTableViewCell()

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


@end

@implementation BDFindConstructionTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:cellId];
    if (self) {
        [self setUpUI];
    }
    return self;
    
}

-(void)setUpUI {
    
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
    self.nameImageView.backgroundColor = [UIColor redColor];
    
    //名字
    UILabel *nameLabel = [[UILabel alloc] init];
    self.nameLable = nameLabel;
    [self.contentView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.nameImageView.mas_right).offset(10);
        
    }];
    nameLabel.font = [UIFont systemFontOfSize:15];
    nameLabel.text = @"北京世纪佳缘建筑有限公司";
    
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
    
    
    NSString *str = @"公共建筑,园林设计,景观设计";
    NSArray *flagArray = [str componentsSeparatedByString:@","];
    //[cell.tagView setTagWithTagArray:flagArray];
    
    [self.tagView setTagWithTagArray:flagArray andWith:self.contentView.bounds.size.width];
    
    UILabel *timeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:timeLabel];
    self.dateLabel = timeLabel;
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tagView.mas_bottom).offset(37);
        make.left.equalTo(self.nameImageView.mas_right).offset(10);
        
    }];
    timeLabel.text = @"工期:";
    timeLabel.textColor = [UIColor grayColor];
    timeLabel.font = [UIFont systemFontOfSize:13];
    
    UILabel *dateNumLabel = [[UILabel alloc] init];
    [self.contentView addSubview:dateNumLabel];
    self.dateNumLabel = dateNumLabel;
    [dateNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tagView.mas_bottom).offset(35);
        make.left.equalTo(timeLabel.mas_right).offset(5);
        
    }];
    dateNumLabel.text = @"1个月";
    dateNumLabel.textColor = [UIColor grayColor];
    dateNumLabel.font = [UIFont systemFontOfSize:15];
    
    

    
}
@end









































