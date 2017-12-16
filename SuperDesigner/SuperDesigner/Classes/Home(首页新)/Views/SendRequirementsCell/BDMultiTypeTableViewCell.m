//
//  BDMultiTypeTableViewCell.m
//  SuperDesigner
//
//  Created by Julia on 2017/12/12.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDMultiTypeTableViewCell.h"
static NSString *reusedId = @"mutilTypeCell";

@interface  BDMultiTypeTableViewCell()

@property(nonatomic, strong) NSArray *arr;

@end


@implementation BDMultiTypeTableViewCell

-(NSArray *)arr {
    if (_arr == nil) {
        _arr = @[@"建筑面积",@"项目预算",@"项目地址",@"需求说明",@"截止时间",@"建筑设计",@"景观设计",@"规划设计", @"设计咨询"];
    }
    return _arr;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpUI];
    }
    return self;
}

-(void) setUpUI {
    
    UILabel *nameLabel = [[ UILabel alloc] init];
    [self.contentView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(20);
        make.left.equalTo(self.contentView).offset(15);
        
    }];
    nameLabel.text = @"项目类型:";
    
    
}



@end
