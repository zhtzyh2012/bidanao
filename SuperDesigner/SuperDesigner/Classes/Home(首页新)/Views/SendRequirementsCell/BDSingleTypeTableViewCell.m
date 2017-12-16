//
//  BDSingleTypeTableViewCell.m
//  SuperDesigner
//
//  Created by Julia on 2017/12/7.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDSingleTypeTableViewCell.h"
static NSString *reusedId = @"singleTypeCell";
@implementation BDSingleTypeTableViewCell

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






























































