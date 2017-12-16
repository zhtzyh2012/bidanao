//
//  BDHomeStatusCell.m
//  SuperDesigner
//
//  Created by Julia on 2017/8/17.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDHomeStatusCell.h"
#import "BDHomeCase.h"

@interface BDHomeStatusCell()

//占位的view
@property (nonatomic, weak) UIView *placeView;

//原创微博的view
@property(nonatomic, weak) UIView *originView;
//找设计师的名称
@property(nonatomic, weak) UILabel *findDesignerLabel;
//预算的label
@property(nonatomic, weak) UILabel *budgetLabel;

//预算的金钱
@property(nonatomic, weak) UILabel *budgetMoneyLabel;
//需求编号label
@property(nonatomic, weak) UILabel *demandLabel;
//需求编号的实际数字
@property(nonatomic, weak) UILabel *demandLabelNum;
//时间的label
@property(nonatomic, weak) UILabel *timeLabel;
//描述的需求文字label
@property(nonatomic, weak) UILabel *desTextLabel;


@end

@implementation BDHomeStatusCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addOriginalDesignerView];

    }
    return self;
    
}


-(void)addOriginalDesignerView {
    
    //背景的view
    UIView *originV = [[UIView alloc] init];
    originV.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:originV];
    self.originView = originV;
    
    //空白的view
    UIView *placeView = [[UIView alloc] init];
    placeView.backgroundColor = rgb(245, 245, 246);
    [self.originView addSubview:placeView];
    self.placeView = placeView;
    placeView.frame = CGRectMake(0, 0, KScreen_WIDTH, 10);
    
    
    //找设计师的label
    UILabel *findLabel = [[UILabel alloc] init];
    findLabel.backgroundColor = [UIColor whiteColor];
    findLabel.font = [UIFont systemFontOfSize:15];
    findLabel.text = @"找设计师";
    findLabel.font = [UIFont systemFontOfSize:17];
    self.findDesignerLabel = findLabel;
    [self.originView addSubview:findLabel];
    
    //预算的label
    UILabel *budgetLabel = [[UILabel alloc] init];
    [self.originView addSubview:budgetLabel];
    budgetLabel.backgroundColor = [UIColor whiteColor];
    budgetLabel.font = [UIFont systemFontOfSize:15];
    budgetLabel.text = @"预算";
    self.budgetLabel = budgetLabel;
   
    //预算的数字
    UILabel *budgetNumLabel = [[UILabel alloc] init];
    [self.originView addSubview:budgetNumLabel];
    budgetNumLabel.backgroundColor = [UIColor lightGrayColor];
    budgetNumLabel.font = [UIFont systemFontOfSize:15];
    self.budgetMoneyLabel = budgetNumLabel;
    
    //需求编号
    UILabel *demandLabel = [[UILabel alloc] init];
    [self.originView addSubview:demandLabel];
    demandLabel.backgroundColor = [UIColor lightGrayColor];
    demandLabel.font = [UIFont systemFontOfSize:14];
    demandLabel.text = @"需求编号";
    demandLabel.textColor = rgb(129, 135, 135);
    self.demandLabel = demandLabel;
    
    //需求编号的数字
    UILabel *demandNumLabel = [[UILabel alloc] init];
    [self.originView addSubview:demandNumLabel];
    demandNumLabel.font = [UIFont systemFontOfSize:14];
    demandNumLabel.textColor = rgb(129, 135, 135);
    demandNumLabel.text = @"1232131";
    self.demandLabelNum = demandNumLabel;
    
    //时间的label
    UILabel *timeLabel = [[UILabel alloc] init];
    [self.originView addSubview:timeLabel];
    timeLabel.backgroundColor = [UIColor lightGrayColor];
    timeLabel.font = [UIFont systemFontOfSize:14];
    timeLabel.text = @"2017.8.19";
    self.timeLabel = timeLabel;
    
    //文本描述的label
    UILabel *desLabel = [[UILabel alloc] init];
    [self.originView addSubview:desLabel];
    self.desTextLabel = desLabel;
    desLabel.backgroundColor = [UIColor whiteColor];
    desLabel.font = [UIFont systemFontOfSize:15];
    desLabel.text = @"大型商业街建筑,找设计师.时间较短,酬劳非常丰厚少电话撒旦教案话肯定 大王卡电话肯定哈我觉得哈维";
    desLabel.numberOfLines = 0;
    

    
}



-(void)setHomecase:(BDHomeCase *)homecase {
    //1.给成员属性赋值
    _homecase = homecase;
    //2.给控件设置属性以及数据
    [self setMySubviewsData];
    
    //3.给子控件设置frame
    [self setMySubviewsFrame];
    
    
}

#pragma mark -- 给控件设置属性以及数据
-(void)setMySubviewsData {
    
    self.findDesignerLabel.text = self.homecase.findDesignerLabel;
    self.budgetLabel.text = self.homecase.budgetLabel;
    self.budgetMoneyLabel.text = self.homecase.budgetLabelNum;
    self.demandLabel.text = self.homecase.demandLabel;
    self.demandLabelNum.text = self.homecase.demandLabelNum;
    self.timeLabel.text = self.homecase.timeLabel;
    self.desTextLabel.text = self.homecase.desLabel;
    
    
}

#pragma mark -- 给子控件设置frame
#define kPadding 10
-(void)setMySubviewsFrame {
    
    self.originView.frame = CGRectMake(0, 0, KScreen_WIDTH, 200);
    
    self.findDesignerLabel.frame = CGRectMake(kPadding, 20, 100, 20);
    
    [self.budgetMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self).offset(10);
        make.size.mas_equalTo(CGSizeMake(60, 30));
        
    }];
    
    [self.budgetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(15);
        make.right.equalTo(self.self.budgetMoneyLabel.mas_left).offset(-3);
        make.size.mas_equalTo(CGSizeMake(40, 20));
        
    }];
    
    [self.demandLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self.findDesignerLabel.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(70, 20));
        
        
    }];
    
    [self.demandLabelNum mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.findDesignerLabel.mas_bottom).offset(5);
        make.left.equalTo(self.demandLabel.mas_right).offset(-2);
        make.size.mas_equalTo(CGSizeMake(110, 20));
        
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.budgetMoneyLabel.mas_bottom).offset(5);
        make.right.equalTo(self).offset(10);
        make.size.mas_equalTo(CGSizeMake(120, 20));
        
    }];
    
    [self.desTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.demandLabel.mas_bottom).offset(-3);
        make.left.equalTo(self).offset(10);
        make.size.mas_equalTo(CGSizeMake(KScreen_WIDTH- 2*kPadding, 80));
        
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end





























