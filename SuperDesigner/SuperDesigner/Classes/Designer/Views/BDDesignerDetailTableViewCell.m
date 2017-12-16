//
//  BDDesignerDetailTableViewCell.m
//  SuperDesigner
//
//  Created by Guo JingRui on 2017/8/11.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDDesignerDetailTableViewCell.h"
@interface BDDesignerDetailTableViewCell()
@property(nonatomic,strong)BDBaseLabel * titleLabel;//标题
@property(nonatomic,strong)BDBaseLabel * detailLabel;//详情
@end
@implementation BDDesignerDetailTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setUpUI];
    }
    return self;
}
-(void)setUpUI{
    self.titleLabel = [[BDBaseLabel alloc]init];
    [self.contentView addSubview:self.titleLabel];
    self.titleLabel.BDTextFont(15).BDTextColor([UIColor lightGrayColor]);

    self.detailLabel = [[BDBaseLabel alloc]init];
    [self.contentView addSubview:self.detailLabel];
    self.detailLabel.numberOfLines = 0;
    self.detailLabel.font = [UIFont systemFontOfSize:15];
    self.detailLabel.textColor = rgb(103, 103, 103);
    
    //self.detailLabel.BDTextFont(15).BDTextColor(rgb(103, 103, 103, 1.0));
 
}
-(void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = title;
}
-(void)setDetailframe:(BDDesignerDetailCellFrame *)Detailframe{
    _Detailframe = Detailframe;
    self.titleLabel.frame = Detailframe.titleFrame;
    self.detailLabel.frame = Detailframe.detailFrame;
    self.detailLabel.text = Detailframe.detailStr;
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











