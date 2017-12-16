//
//  BDMyCollectTableViewCell.m
//  SuperDesigner
//
//  Created by Julia on 2017/10/27.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDMyCollectTableViewCell.h"
static NSString *reusedWorkId = @"collectCellId";

@interface BDMyCollectTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *collectName;
@property (weak, nonatomic) IBOutlet UILabel *collecTime;
@property (weak, nonatomic) IBOutlet UIImageView *collectOneImg;
@property (weak, nonatomic) IBOutlet UIImageView *collectTwoImg;

@end

@implementation BDMyCollectTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(instancetype) collectCellWithTableView:(UITableView *)tableView {
    
    BDMyCollectTableViewCell *collectCell = [tableView dequeueReusableCellWithIdentifier:reusedWorkId];
    if (collectCell == nil) {
        collectCell = [[[NSBundle mainBundle] loadNibNamed:@"BDMyCollectTableViewCell" owner:nil options:nil] lastObject];
        
        collectCell.selectionStyle = UITableViewCellSelectionStyleBlue;
        
        
    }
    return collectCell;
}

-(void)setMyCollectModel:(BDMyCollectModel *)myCollectModel {
    
    _myCollectModel = myCollectModel;
    self.collectName.text = myCollectModel.collectName;
    self.collecTime.text = myCollectModel.collectTime;
    self.collectOneImg.image = myCollectModel.firstCollectImage;
    self.collectTwoImg.image = myCollectModel.secondCollectImage;
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end





















