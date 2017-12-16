//
//  BDRightTableViewCell.m
//  SuperDesigner
//
//  Created by Julia on 2017/11/23.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDRightTableViewCell.h"

@interface BDRightTableViewCell()
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

@end

@implementation BDRightTableViewCell

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
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.mas_equalTo(KScreen_HEIGHT *0.6);
    
    }];
    bigImage.image = [UIImage imageNamed:@"userBigImage"];
    
    UILabel *singLabel = [[UILabel alloc] init];
    self.singLabel = singLabel;
    [self.contentView addSubview:singLabel];
    [singLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bigImage.mas_bottom);
        make.left.equalTo(self.contentView).offset(12);
        make.right.equalTo(self.contentView).offset(-12);
        make.height.mas_equalTo(40);
        
    }];
    singLabel.numberOfLines = 0;
    singLabel.backgroundColor = [UIColor orangeColor];
    singLabel.text = @"但愿人长久啊,千里共婵娟,你是猴子派来的救兵吗,长得这么卡哇伊☺,原来你真的是一个逗比(=@__@=)";
    singLabel.font = [UIFont systemFontOfSize:13];
    singLabel.textColor = rgb(145, 144, 144);
    
    UILabel *nameLael = [[UILabel alloc] init];
    self.nameLabel = nameLael;
    [self.contentView addSubview:nameLael];
    nameLael.text = @"时间是最好的证明";
    NSString *nameStr = self.nameLabel.text;
    CGRect userNameBounds = [ nameStr boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
    
    [nameLael mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.singLabel.mas_bottom).offset(14);
        make.left.equalTo(self.contentView).offset(12);
        make.width.mas_equalTo(userNameBounds.size.width);
        make.height.mas_equalTo(userNameBounds.size.height);
        
    }];
    
    
}

@end


































