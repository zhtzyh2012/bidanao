//
//  BDDesignerDetailTableView.m
//  SuperDesigner
//
//  Created by Guo JingRui on 2017/8/11.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDDesignerDetailTableView.h"
#import "BDDesignerDetailTableViewCell.h"
#import "BDDesignerDetailCellFrame.h"
@interface BDDesignerDetailTableView()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray * arr;
@property(nonatomic,strong)NSArray * detailArr;
@property(nonatomic,strong)UIView * headView;
@property(nonatomic,weak)BDBaseLabel * cerDetailLabel;
@end
@implementation BDDesignerDetailTableView
-(NSArray *)arr{
    if (_arr == nil) {
        _arr = [[NSArray alloc]init];
        _arr = @[@"所在城市",@"工作单位",@"工作年限",@"毕业学校",@"详细介绍"];
    }
    return _arr;
}
-(NSArray *)detailArr{
    if (_detailArr == nil) {
        _detailArr = @[@"中国广东省深证市",@"北京比大脑网络科技有限公司",@"十年工作经验",@"北京理工大学",@"非常乐观开朗,从事设计工作已有十年,具有专业的设计知识,以及高级的审美水平,能够根据用户的需求设计出让用户满意的作品!欢迎联系我!"];
        NSMutableArray * nmArr = [[NSMutableArray alloc]init];
        for (NSString * str in _detailArr) {
            BDDesignerDetailCellFrame * frame = [[BDDesignerDetailCellFrame alloc]init];
            frame.detailStr = str;
            [nmArr addObject:frame];
        }
        _detailArr = nmArr;
    }
    return _detailArr;
}
-(UIView *)headView{
    if (_headView == nil) {
        _headView = [[UIView alloc]init];
        _headView.frame = CGRectMake(0, 0, KScreen_WIDTH, 55);
        _headView.backgroundColor = RGB(245, 246, 246, 1.0);
        UIView * certificationView = [[UIView alloc]init];
        certificationView.backgroundColor = [UIColor whiteColor];
        [_headView addSubview:certificationView];
        [certificationView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(_headView);
            make.height.offset(45);
        }];
        BDBaseLabel * certificationLabel = [[BDBaseLabel alloc]init];
        [certificationView addSubview:certificationLabel];
        [certificationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(certificationView);
            make.left.equalTo(certificationView).offset(10);
            make.size.mas_equalTo(CGSizeMake(70, 20));
        }];
        certificationLabel.BDTextFont(15).BDTextColor([UIColor lightGrayColor]).BDText(@"身份认证");
        UIImageView * cerImageView = [[UIImageView alloc]init];
        [certificationView addSubview:cerImageView];
        [cerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(15, 15));
            make.centerY.equalTo(certificationView);
            make.left.equalTo(certificationLabel.mas_right).offset(10);
        }];
        cerImageView.image = [UIImage imageNamed:@"vrenzheng"];
        BDBaseLabel * cerDetailLabel = [[BDBaseLabel alloc]init];
        [certificationView addSubview:cerDetailLabel];
        [cerDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cerImageView.mas_right).offset(2);
            make.centerY.equalTo(certificationView);
            make.right.equalTo(certificationView).offset(-10);
            make.height.offset(20);
        }];
        cerDetailLabel.BDTextFont(15).BDTextColor(RGB(103, 103, 103, 1.0));
        cerDetailLabel.BDText(@"已认证");
        NSString * str = @"已认证(具备接需求资质)";
        NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc]initWithString:str];
        NSRange rangeStar = [str rangeOfString:@"("];
        [attStr addAttribute:NSForegroundColorAttributeName  //文字颜色
                              value:ThemeColor
                              range:NSMakeRange(rangeStar.location, str.length-rangeStar.location)];
        cerDetailLabel.attributedText = attStr;
        self.cerDetailLabel = cerDetailLabel;
        UIView * lineView = [[UIView alloc]init];
        [certificationView addSubview:lineView];
        lineView.backgroundColor = RGB(247, 247, 247, 1.0);
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(certificationView);
            make.height.offset(0.5);
        }];
        
        
    }
    return _headView;
}
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if(self){
        [self setUpUI];
    }
    return self;
}
-(void)setUpUI{
    self.dataSource = self;
    self.delegate = self;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.estimatedRowHeight = UITableViewAutomaticDimension;
    [self registerClass:[BDDesignerDetailTableViewCell class] forCellReuseIdentifier:@"designerDetail"];
    self.tableHeaderView = self.headView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BDDesignerDetailTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"designerDetail" forIndexPath:indexPath];
    cell.title = self.arr[indexPath.row];
    cell.Detailframe = self.detailArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BDDesignerDetailCellFrame * frame = self.detailArr[indexPath.row];
    return frame.height;
}

@end
