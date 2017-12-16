//
//  URL.h
//  SuperDesigner
//
//  Created by Julia on 2017/8/2.
//  Copyright © 2017年 Julia. All rights reserved.
//

//NSString *verifyCodeUrl = @"http://192.168.1.3:8080/sjs_webserver/sendSMS";

#ifndef URL_h
#define URL_h

//#define BaseURL @"http://192.168.1.5:8080/" /**本地*/

#define BaseURL @"http://123.56.183.204:8080" /**服务器*/

//==============前端h5页面=================
#define url_topicCommitUrl @"designer/judge.html" /**前端的web页面评委会*/


//==============登录注册相关=================
#define url_registUrl @"sjs_webserver/regist" /**注册接口*/
#define url_verifyCodeUrl @"sjs_webserver/sendSMS"  /**注册的时候短信验证的接口*/
#define url_loginUrl @"sjs_webserver/login"  /**登录的接口*/
#define url_resetPwdUrl @"sjs_webserver/getpwd"  /**重置密码的接口,找回密码*/

#define url_changePwdUrl @"sjs_webserver/changePwd" /**修改密码*/
#define url_changePhone @"sjs_webserver/updatePhone" /**修改手机号*/


//==============查询用户基本信息=================
//http://192.168.1.3:8080/sjs_webserver/selectuser




//=================我的个人资料==================
#define url_changeUserIcon @"sjs_webserver/updateimage"   /**修改用户个人图像*/
#define url_changeUserNickName @"sjs_webserver/updateusername"   /**修改用户昵称*/
#define url_changeUserSex @"sjs_webserver/updatesex"   /**修改用户性别*/
#define url_changeUserBackImag @"sjs_webserver/updatebgimage"   /**修改用户背景图片*/
#define url_changeUserArea @"sjs_webserver/updatearea"   /**修改用户地区*/
#define url_changeUserSing @"sjs_webserver/updatesign"   /**需改用户的签名*/
#define url_changeUserHeight @"sjs_webserver/updateheight"  /**修改用户的身高*/
#define url_changeUserWeight @"sjs_webserver/updateweight"  /**修改用户的体重*/
#define url_changeUserBirthday @"sjs_webserver/updatebirthday"  /**修改用户的生日*/
#define url_changeUserJob @"sjs_webserver/updatevocation"  /**修改用户的职业*/
#define url_changeUserHobby @"sjs_webserver/updatehobby"  /**修改用户的爱好*/
#define url_changeUserPersonalInfo @"sjs_webserver/selecthomepage"  /**修改用户的个人主页资料*/


#define url_chenkUserBasicInfo @"sjs_webserver/selectuser"  /**查询用户的基本信息*/

#define url_checkUserPurse @"sjs_webserver/selectmoney"  /**查询钱包的余额*/
#define url_checkUserPersonalInfo @"sjs_webserver/selecthomepage"   /**查询用户的个人主页*/



#define url_checkUserPersonalNeeds @"sjs_webserver/selectNeed"   /**查询用户我的需求*/
#define url_checkUserPersonalCollects @"sjs_webserver/selectCollect"   /**查询用户的我的收藏*/
#define url_checkUserPersonalTasks @"sjs_webserver/selectneeds"   /**查询用户的个人我的任务*/
#define url_checkUserPersonalFollowers @"sjs_webserver/selectfollow"   /**查询用户的个人我的关注*/
#define url_checkUserPersonalComments @"sjs_webserver/selectcomment"   /**查询用户的个人我的点评*/
#define url_checkUserPersonalWorks @"sjs_webserver/selectWorks"   /**查询作品的列表*/



#define url_checkUserPersonalLatestNeeds @"sjs_webserver/selectNewNeed"   /**查询用户的最新需求信息*/
#define url_checkUserPersonalBestWork @"sjs_webserver/selectByGrade"   /**查询精品作品列表*/
#define url_checkProjectMan @"sjs_webserver/selectgcs"  /**查询工程商列表*/
#define url_sendNeed @"sjs_webserver/setNeed"  /**发布需求*/
#define url_sendworks @"sjs_webserver/setWorks"  /**发布作品*/

//设计师
#define url_fancyDesigner @"sjs_webserver/selectsjdk"  /**大咖列表*/
#define url_fancyDesigner @"sjs_webserver/selectsjdk"  /**全部设计师列表*/




//发现tabBar
//http://192.168.1.5:8080/sjs_webserver/selectsjy设计院列表
#define url_designerInstitute @"sjs_webserver/selectsjy"    /**设计院列表*/






//==================================
#define ure_homeListUrl @"sjs_webserver/index"   /**首页的列表数据*/






//===========以前的==============
#define url_changUserPhoneNum @"sjs_webserver/updatePhone" /**修改手机号*/
#define url_changUserIcon @"sjs_webserver/updateimage"  /**修改用户头像*/
#define url_changeUserNickName @"sjs_webserver/updateusername"  /**修改用户的昵称*/
#define url_changeUserSex @"sjs_webserver/updatesex"  /**修改用户的性别*/
#define url_changeUserGoodAt @"sjs_webserver/updategoodnees"  /**修改用户的个人优势*/
#define url_changeUserDatailIntro @"sjs_webserver/updatedetail"  /**修改用户的详情介绍*/
#define url_applyAddVip @"sjs_webserver/updateisv"  /**申请加V(--1是Vip--2不是Vip--)*/
#define url_sendRequirement @"sjs_webserver/sendNeed"  /**发需求的接口*/
#define url_takeRequirement @"sjs_webserver/updateNeedtype"  /**接需求的接口*/
#define url_designerList @"sjs_webserver/selectAllShejishi"  /**设计师列表的接口*/

#define url_uploadImage @"sjs_webserver/imgUpload"  /**图片图像上传*/


#define url_weiCharPay @"sjs_webserver/weChatPay"  /**微信支付*/
#define url_weiChatHuiDiao @"sjs_webserver/weChatPayNotifyUrl" /**微信支付回调*/




#endif /* URL_h */


















