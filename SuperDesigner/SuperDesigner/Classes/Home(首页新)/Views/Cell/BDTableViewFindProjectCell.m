//
//  BDTableViewFindProjectCell.m
//  SuperDesigner
//
//  Created by Julia on 2017/12/4.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDTableViewFindProjectCell.h"
#import "TagView.h"
#import "BDInsetLabel.h"

static NSString *cellId = @"homeProCell";


@interface BDTableViewFindProjectCell()

//项目名字
@property(nonatomic, weak) UILabel *nameLabel;
//发布时间
@property(nonatomic, weak) UILabel *sendLabel;
//发布时间数字
@property(nonatomic, weak) UILabel *sendNumLabel;
//标签tag
@property(nonatomic, strong) TagView *tagView;

//工期
@property(nonatomic, weak) UILabel *dateLabel;
//工期的num
@property(nonatomic, weak) UILabel *dateNumLabel;
//预算
@property(nonatomic, weak) UILabel *sumLabel;
//预算的num
@property(nonatomic, weak) UILabel *sumNumLabel;

//招标中
@property(nonatomic, weak) BDInsetLabel *callLabel;

@end

@implementation BDTableViewFindProjectCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:cellId];
    if (self) {
        [self setUpUI];
    }
    return self;
    
}

-(void) setUpUI {
    
    //分割线
    UIView *lineOneView = [[UIView alloc] init];
    [self.contentView addSubview:lineOneView];
    [lineOneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(0);
        make.left.right.equalTo(self.contentView).offset(0);
        make.height.mas_equalTo(10);
    }];
    lineOneView.backgroundColor = rgb(238, 238, 238);
    
    
    UILabel *nameLabel = [[UILabel alloc] init];
    self.nameLabel = nameLabel;
    [self.contentView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineOneView.mas_bottom).offset(17);
        make.left.equalTo(self.contentView).offset(20);
    
    }];
    nameLabel.text = @"味全多酒店项目";
    
    UILabel *sendLabel = [[UILabel alloc] init];
    self.sendLabel = sendLabel;
    [self.contentView addSubview:sendLabel];
    [sendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineOneView.mas_bottom).offset(17);
        make.right.equalTo(self.contentView).offset(-20);
        
    }];
    sendLabel.text = @"发布时间";
    sendLabel.textColor = [UIColor grayColor];
    
    //发布时间的数字
    UILabel *sendNumLabel = [[UILabel alloc] init];
    self.sendNumLabel = sendNumLabel;
    [self.contentView addSubview:sendNumLabel];
    [sendNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sendLabel.mas_bottom).offset(5);
        make.right.equalTo(self.contentView).offset(-20);
        
    }];
    sendNumLabel.text = @"10:12";
    sendNumLabel.textColor = [UIColor grayColor];
    
    //分割线
    UIView *lineView = [[UIView alloc] init];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameLabel.mas_bottom).offset(30);
        make.left.right.equalTo(self.contentView).offset(0);
        make.height.mas_equalTo(1);
    }];
    lineView.backgroundColor = rgb(238, 238, 238);
    
    
    self.tagView = [[TagView alloc]initWithFrame:CGRectMake(10, 93, self.contentView.bounds.size.width, 0)];
    [self.contentView addSubview:self.tagView];
    NSString *str = @"道路桥梁,规划设计,景观设计";
    NSArray *flagArray = [str componentsSeparatedByString:@","];
    //[cell.tagView setTagWithTagArray:flagArray];
    
    [self.tagView setTagWithTagArray:flagArray andWith:self.contentView.bounds.size.width];
    
    //工期的label
    UILabel *timeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:timeLabel];
    self.dateLabel = timeLabel;
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tagView.mas_bottom).offset(47);
        make.left.equalTo(self.contentView).offset(20);
        
    }];
    timeLabel.text = @"工期:";
    timeLabel.textColor = [UIColor grayColor];
    timeLabel.font = [UIFont systemFontOfSize:13];
    
    
    
    UILabel *dateNumLabel = [[UILabel alloc] init];
    [self.contentView addSubview:dateNumLabel];
    self.dateNumLabel = dateNumLabel;
    [dateNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tagView.mas_bottom).offset(45);
        make.left.equalTo(timeLabel.mas_right).offset(5);
        
    }];
    dateNumLabel.text = @"1个月";
    dateNumLabel.textColor = [UIColor grayColor];
    dateNumLabel.font = [UIFont systemFontOfSize:16];
    
    
    UILabel *sumLabel = [[UILabel alloc] init];
    [self.contentView addSubview:sumLabel];
    self.sumLabel = sumLabel;
    [sumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tagView.mas_bottom).offset(47);
        make.left.equalTo(self.dateNumLabel.mas_right).offset(20);
        
    }];
    sumLabel.text = @"预算:";
    sumLabel.textColor = [UIColor grayColor];
    sumLabel.font = [UIFont systemFontOfSize:13];
    
    UILabel *sumNumLabel = [[UILabel alloc] init];
    [self.contentView addSubview:sumNumLabel];
    self.sumNumLabel = sumNumLabel;
    [sumNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tagView.mas_bottom).offset(45);
        make.left.equalTo(self.sumLabel.mas_right).offset(5);
        
    }];
    sumNumLabel.text = @"¥18000";
    sumNumLabel.textColor = [UIColor redColor];
    sumNumLabel.font = [UIFont systemFontOfSize:16];
    
    //招标中
    BDInsetLabel *callLabel = [[BDInsetLabel alloc] init];
    [self.contentView addSubview:callLabel];
    self.callLabel = callLabel;
    [callLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(45);
        make.right.equalTo(self.contentView).offset(-15);
        make.size.mas_equalTo(CGSizeMake(80, 40));
    }];
    callLabel.text = @"招标中";
    callLabel.textColor = [UIColor blackColor];
    callLabel.font = [UIFont systemFontOfSize:18];
    callLabel.layer.cornerRadius = 18;
    callLabel.backgroundColor = [UIColor whiteColor];
    callLabel.layer.masksToBounds = YES;
    callLabel.layer.borderWidth = 0.5f;
    callLabel.layer.borderColor = [[UIColor grayColor]CGColor];
    callLabel.insets = UIEdgeInsetsMake(10, 10, 8, 8);//设置内边距
    [callLabel sizeToFit];
    
    
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
