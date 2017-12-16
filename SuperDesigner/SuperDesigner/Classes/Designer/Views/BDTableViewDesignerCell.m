//
//  BDTableViewDesignerCell.m
//  SuperDesigner
//
//  Created by Julia on 2017/8/2.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDTableViewDesignerCell.h"

#import "BDNCase.h"

static NSString *reusedId = @"designerCellID";

@interface BDTableViewDesignerCell()

@property (weak, nonatomic) IBOutlet UIImageView *IconImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UIImageView *sexImageView;
@property (weak, nonatomic) IBOutlet UILabel *rankLabel;

@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@property (weak, nonatomic) IBOutlet UILabel *campusLabel;
@property (weak, nonatomic) IBOutlet UILabel *experienceLabel;

@property (weak, nonatomic) IBOutlet UIButton *attentionLabel;
@property (weak, nonatomic) IBOutlet UILabel *skilledLabel;
@property (weak, nonatomic) IBOutlet UILabel *buildTypeLabel;

@end

@implementation BDTableViewDesignerCell


-(void)setRankLabel:(UILabel *)rankLabel {
    //_rankLabel.BDBorderWidth(1).BDBorderCornderRadius(5).BDBorderColor(ThemeColor).BDTextFont(12).BDTextAlignment(NSTextAlignmentCenter).BDTextColor(ThemeColor).BDText(@"3星 ");
    
    self.rankLabel.layer.borderWidth = 1;
    self.rankLabel.layer.cornerRadius = 5;
    self.rankLabel.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor blueColor]);
    
    [_rankLabel sizeToFit];

}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)setCaseList:(BDNCase *)caseList {
    
    _caseList = caseList;
    
    self.IconImageView.image = caseList.image;
    self.nameLabel.text = caseList.name;
    self.sexImageView.image = caseList.sexImage;
    
    self.rankLabel.text = caseList.rank;
    self.locationLabel.text = caseList.city;
    
    self.campusLabel.text = caseList.campus;
    self.experienceLabel.text = caseList.experience;
    self.buildTypeLabel.text = caseList.buildType;
    self.skilledLabel.text = caseList.skilled;
    
    
}



+(instancetype)designerCell:(UITableView *)tableView {
    
    BDTableViewDesignerCell *designerCell = [tableView dequeueReusableCellWithIdentifier:reusedId];
    if(designerCell == nil) {
        
        designerCell = [[[NSBundle mainBundle] loadNibNamed:@"BDTableViewDesignerCell" owner:nil options:nil] lastObject];
        designerCell.selectionStyle = UITableViewCellSelectionStyleNone;

        
    }

    
    return designerCell;
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end










































