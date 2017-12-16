//
//  BDIconHeadView.m
//  SuperDesigner
//
//  Created by Julia on 2017/9/4.
//  Copyright © 2017年 Julia. All rights reserved.
//

#import "BDIconHeadView.h"

@interface BDIconHeadView()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property(nonatomic, strong) UIButton *iconImageBtn;
//当前的时间
@property(nonatomic, copy) NSString *CurrentTime;

//头像
@property(nonatomic, strong) UIImageView *imageIcon;
@end

@implementation BDIconHeadView

-(instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        [self setHeadViewUI];
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
    
}

-(void) setHeadViewUI {
    
    self.frame = CGRectMake(0, 0, KScreen_WIDTH, 110);
    self.userInteractionEnabled = YES;
    
    UILabel *nameLabel = [[UILabel alloc] init];
    [self addSubview:nameLabel];
    nameLabel.frame = CGRectMake(17, 40, 50, 30);
    nameLabel.text = @"头像";
    
//    UIButton *iconImageBtn = [[UIButton alloc] init];
//    iconImageBtn.backgroundColor = [UIColor grayColor];
//    [self addSubview:iconImageBtn];
//    self.iconImageBtn = iconImageBtn;
//    [iconImageBtn setBackgroundImage:[UIImage imageNamed:@"userIcon"] forState:UIControlStateNormal];
//    [iconImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self).offset(15);
//        make.right.equalTo(self).offset(-40);
//        make.size.mas_equalTo(CGSizeMake(80, 80));
//
//    }];
//    iconImageBtn.layer.cornerRadius = 40;
//    iconImageBtn.layer.masksToBounds = YES;
//
//    [iconImageBtn addTarget:self action:@selector(iconButtonClickFunc) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *imageIcon = [[UIImageView alloc] init];
    imageIcon.backgroundColor = [UIColor grayColor];
    [self addSubview:imageIcon];
    self.imageIcon = imageIcon;
    imageIcon.image = [UIImage imageNamed:@"userIcon"];
    [imageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(15);
        make.right.equalTo(self).offset(-40);
        make.size.mas_equalTo(CGSizeMake(80, 80));

    }];
    imageIcon.layer.cornerRadius = 40;
    imageIcon.layer.masksToBounds = YES;

    //[imageIcon addTarget:self action:@selector(iconButtonClickFunc) forControlEvents:UIControlEventTouchUpInside];

    //添加点击

    UITapGestureRecognizer *iconClick = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(iconButtonClickFunc)];
    self.imageIcon.userInteractionEnabled = YES;
    [self.imageIcon addGestureRecognizer:iconClick];
    
    
    
    
    
    UIImageView *backImage = [[UIImageView alloc] init];
    [self addSubview:backImage];
    //iconImage.backgroundColor = [UIColor grayColor];
    [backImage setImage:[UIImage imageNamed:@"backArrow"]];
    [self addSubview:backImage];
    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(55);
        make.right.equalTo(self).offset(-20);
        make.size.mas_equalTo(CGSizeMake(7, 14));
        
    }];

}

#pragma mark ---"头像"点击触发的方法，完成跳转 
-(void) tapAvatarView:(UITapGestureRecognizer *)gesture {
    NSLog(@"yongdsasdadadia  点击了");
}

-(void)iconButtonClickFunc {
    
//    if ([self.delegate respondsToSelector:@selector(iconButtonClick)]) {
//        
//        [self.delegate iconButtonClick];
//        NSLog(@"萨达");
//        
//    }
    
    UIActionSheet *sheet;
    
    // 判断是否支持相机
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        sheet  = [[UIActionSheet alloc] initWithTitle:@"选择图像" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"拍照", @"从相册选择", nil];
    }
    else {
        sheet = [[UIActionSheet alloc] initWithTitle:@"选择图像" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"从相册选择", nil];
    }
    
    sheet.tag = 255;
    
    [sheet showInView:self];


}


//弹框代理
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (actionSheet.tag == 255) {
        NSUInteger sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            switch (buttonIndex) {
                case 0:
                    return;
                case 1: //相机
                    sourceType = UIImagePickerControllerSourceTypeCamera;
                    break;
                case 2: //相册
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    break;
            }
        }
        else {
            if (buttonIndex == 0) {
                return;
            } else {
                sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            }
        }
        // 跳转到相机或相册页面
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = YES;
        imagePickerController.sourceType = sourceType;
        
                if ([self.delegate respondsToSelector:@selector(pushPickControllerWithSourCeType:)]) {
        
                    [self.delegate pushPickControllerWithSourCeType:imagePickerController];
                }
    }
}




- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
    NSLog(@"访问相册回来了");
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    //self.iconImageBtn.imageView.image = image;
    
    
     dispatch_async(dispatch_get_main_queue(), ^{

        //[self.iconImageBtn setImage:image forState:UIControlStateNormal];
         self.imageIcon.image = image;
    });

    //[self uploadImageWithUserIcon];
    
    [self userImageUpLoad];
    
    
    
}


-(NSString*)getCurrentTime {
    
    NSDateFormatter*formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyMMddHHmmss"];
    
    NSString*dateTime = [formatter stringFromDate:[NSDate date]];
    
    self.CurrentTime= dateTime;
    
    NSLog(@"当前时间是===%@",_CurrentTime);
    
    return _CurrentTime;
    
}





- (void)uploadImageWithUserIcon
{
    
    //NSString *cusUseCode = [[NSUserDefaults standardUserDefaults]objectForKey:PreCusCode];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",
                                                                              @"text/html",
                                                                              @"text/json",
                                                                              @"text/plain",
                                                                              @"text/javascript",
                                                                              @"text/xml",
                                                                              @"image/*",
                                                                              @"application/octet-stream",

                                                                              @"application/zip"]];
    
    
    
    //NSDictionary *dict = @{@"uploadFile": self.iconImageBtn.imageView.image};
    //http://192.168.1.5:8080/sjs_webserver/imgUpload
    //http://123.56.183.204:8080/sjs_webserver/updateimage
    //http://123.56.183.204:8080/sjs_webserver/imgUpload

    NSString *urlPic = @"http://123.56.183.204:8080/sjs_webserver/imgUpload";

    NSString *cusUseCode = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_Id"];
    NSDictionary *dict = @{@"id":cusUseCode};
    
    [manager POST:urlPic parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        //// 可以在上传时使用当前的系统事件作为文件名
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        // 设置时间格式
        formatter.dateFormat            = @"yyyyMMddHHmmss";
        NSString *str                         = [formatter stringFromDate:[NSDate date]];
        NSString *fileName              = [NSString stringWithFormat:@"%@.png", str];
        
        /*
         此方法参数
         1. 要上传的[二进制数据]
         2. 要保存在服务器上的[文件名]
         3. 上传文件的[mimeType]
         */
        
        NSData *imageData = UIImageJPEGRepresentation(self.imageIcon.image, 0.1);
        NSLog(@"这个这个是图片的信息---->%@", imageData);
        [formData appendPartWithFileData:imageData name:@"image" fileName:fileName mimeType:@"jpeg/png"];
        
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        NSLog(@"上传参数%@", responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"上传失败..%@", error);
        
    }];
    
}


#pragma mark -- 上传用户的头像
-(void) userImageUpLoad {
    
    NSData *imageData = UIImageJPEGRepresentation(self.imageIcon.image, 0.1);
    NSLog(@"这个是生死时速图片的信息--->%@", imageData);
    
    //http://123.56.183.204:8080/sjs_webserver/updateimage
    NSString *urluploadImage = @"http://123.56.183.204:8080/sjs_webserver/imgUpload";

    NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_Id"];
    NSLog(@"用户的id----%@", userID);
    
    NSDictionary *params = @{
                             
                             @"id": userID,
                             
                             };
    
    NSDictionary * dict =@{
                           @"id": userID,
                           @"image":self.imageIcon.image,
                           @"name": @"1229292000"
                           
                           };
    NSArray * arr = @[dict];                                 //dict
                                                            //params
    [[BDBaseHttpTool sharedInstance] postImage:arr parameters:nil url:urluploadImage sucess:^(id json) {
        
        NSLog(@"上传的code值--%@", json);
        //NSLog(@"上传成功!!!!!---图片");

    } failure:^(NSError *error) {
        NSLog(@"上传失败");
    } andProgress:^(NSInteger progressNum) {
        
        NSLog(@"正在上传");
    }];
    
}


@end



























