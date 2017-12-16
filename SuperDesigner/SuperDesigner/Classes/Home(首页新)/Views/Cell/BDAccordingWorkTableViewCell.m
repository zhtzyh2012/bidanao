//
//  BDAccordingWorkTableViewCell.m
//  SuperDesigner
//
//  Created by Julia on 2017/12/6.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDAccordingWorkTableViewCell.h"
static NSString *reusedId = @"accordWorkCell";

@interface BDAccordingWorkTableViewCell()
//作品名称
@property(nonatomic, weak) UILabel *nameLabel;
//作品时间
@property(nonatomic, weak) UILabel *timeLabel;
//作品图片
@property(nonatomic, weak) UIImageView *imageOne;
//作品图片2
@property(nonatomic, weak) UIImageView *imageTwo;


@end

@implementation BDAccordingWorkTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reusedId];
    if (self) {
        [self setUpUI];
        
    }
    return self;
}

-(void) setUpUI {
    
    //分割线
    UIView *lineView = [[UIView alloc] init];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(1);
        make.centerX.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(1, KScreen_HEIGHT));
    }];
    lineView.backgroundColor = [UIColor clearColor];
    
    //名称
    UILabel *nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(13);
        make.left.equalTo(self.contentView).offset(10);
    }];
    nameLabel.text = @"高迪大教堂";
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.font = [UIFont systemFontOfSize:15];
    
    //时间
    UILabel *timeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:timeLabel];
    self.timeLabel = timeLabel;
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(13);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    timeLabel.text = @"10-21";
    timeLabel.textColor = [UIColor blackColor];
    timeLabel.font = [UIFont systemFontOfSize:15];
    
    
    //图片一
    UIImageView *imageOne = [[UIImageView alloc] init];
    [self.contentView addSubview:imageOne];
    [imageOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameLabel.mas_bottom).offset(13);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(lineView.mas_left).offset(-5);
    }];
    imageOne.backgroundColor = [UIColor orangeColor];
    imageOne.image = [UIImage imageNamed:@"zp_image_03"];
    
    //图片二
    UIImageView *imageTwo = [[UIImageView alloc] init];
    [self.contentView addSubview:imageTwo];
    [imageTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameLabel.mas_bottom).offset(13);
        make.left.equalTo(lineView.mas_right).offset(5);
        make.right.equalTo(self.contentView).offset(-10);
       
    }];
    imageTwo.backgroundColor = [UIColor orangeColor];
    imageTwo.image = [UIImage imageNamed:@"zp_image_03"];
    
    
}

@end






























































