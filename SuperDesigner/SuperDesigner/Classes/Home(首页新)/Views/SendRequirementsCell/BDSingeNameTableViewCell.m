//
//  BDSingeNameTableViewCell.m
//  SuperDesigner
//
//  Created by Julia on 2017/12/7.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDSingeNameTableViewCell.h"
static NSString *reusedId = @"singleCell";
@interface BDSingeNameTableViewCell()
//

@end

@implementation BDSingeNameTableViewCell

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
    nameLabel.text = @"项目名称:";
    
    UITextField *textF = [[UITextField alloc] init];
    [self.contentView addSubview:textF];
    [textF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(20);
        make.left.equalTo(nameLabel.mas_right).offset(10);
        //make.right.equalTo(self.contentView).offset(-10);
    }];
    //textF.backgroundColor = [UIColor orangeColor];
    textF.placeholder = @"请输入名称";
    
    
}


@end
























































