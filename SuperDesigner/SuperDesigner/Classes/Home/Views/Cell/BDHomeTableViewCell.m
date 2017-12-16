//
//  BDHomeTableViewCell.m
//  SuperDesigner
//
//  Created by Julia on 2017/8/21.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDHomeTableViewCell.h"
#import "BDHomeCase.h"

static NSString *reusedHomeID = @"homeCellID";

@interface BDHomeTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *findDesignerLAbel;
@property (weak, nonatomic) IBOutlet UILabel *budgetLabel;

@property (weak, nonatomic) IBOutlet UILabel *budgetNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *demandLabel;
@property (weak, nonatomic) IBOutlet UILabel *demandNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *descTextLabel;
@property (weak, nonatomic) IBOutlet UIButton *replayButton;
@property (weak, nonatomic) IBOutlet UIButton *checkButton;


@end

@implementation BDHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(instancetype) homeCellWithTableView:(UITableView *)tableView {
    
    BDHomeTableViewCell *homeCell = [tableView dequeueReusableCellWithIdentifier:reusedHomeID];
    if(homeCell == nil) {
        
        homeCell = [[[NSBundle mainBundle] loadNibNamed:@"BDHomeTableViewCell" owner:nil options:nil] lastObject];
        homeCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    
    return homeCell;

}

-(void)setHomeList:(BDHomeCase *)homeList {
    
    _homeList = homeList;
//    
//    self.findDesignerLAbel.text = self.homeList.findDesignerLabel;
//    self.budgetLabel.text = self.homeList.budgetLabel;
//    self.budgetNumLabel.text = self.homeList.budgetLabelNum;
//    self.demandLabel.text = self.homeList.demandLabel;
//    self.demandNumLabel.text = self.homeList.demandLabelNum;
//    self.timeLabel.text = self.homeList.timeLabel;
//    self.descTextLabel.text = self.homeList.desLabel;
    
    
    self.findDesignerLAbel.text = self.homeList.findDesignerLabel;
    self.budgetLabel.text = self.homeList.budgetLabel;
    self.budgetNumLabel.text = self.homeList.budgetLabelNum;
    self.demandLabel.text = self.homeList.demandLabel;
    self.demandNumLabel.text = self.homeList.demandLabelNum;
    self.timeLabel.text = self.homeList.timeLabel;
    self.descTextLabel.text = self.homeList.desLabel;

    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end




















