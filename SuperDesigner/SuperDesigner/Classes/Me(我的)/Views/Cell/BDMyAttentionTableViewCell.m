//
//  BDMyAttentionTableViewCell.m
//  SuperDesigner
//
//  Created by Julia on 2017/10/30.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDMyAttentionTableViewCell.h"

static NSString *cellAttID = @"attentionID";

@interface BDMyAttentionTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *designerIcon;

@property (weak, nonatomic) IBOutlet UILabel *designerNiciName;
@property (weak, nonatomic) IBOutlet UIImageView *rankImag;
@property (weak, nonatomic) IBOutlet UILabel *scorLabel;

@property (weak, nonatomic) IBOutlet UILabel *buildStyle;
@property (weak, nonatomic) IBOutlet UILabel *fansLabel;
@property (weak, nonatomic) IBOutlet UILabel *serviceCount;

@end

@implementation BDMyAttentionTableViewCell

+(instancetype) attentionCellWithTableView:(UITableView *)tableView {
    
    BDMyAttentionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellAttID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BDMyAttentionTableViewCell" owner:nil options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    }
    
    return cell;
}


-(void)setAttentionModel:(BDMyAttentionModel *)attentionModel {
    
    _attentionModel = attentionModel;
    self.designerIcon.image = attentionModel.iconImg;
    self.designerNiciName.text = attentionModel.designerName;
    self.rankImag.image = attentionModel.rankImage;
    self.scorLabel.text = attentionModel.designerScor;
    self.buildStyle.text = attentionModel.designerStyle;
    self.fansLabel.text = attentionModel.designerFans;
    self.serviceCount.text = attentionModel.designerSevCount;
    
}

@end



















