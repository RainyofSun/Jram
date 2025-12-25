//
//  JYCommonObject.h
//  JYProject
//
//  Created by 周群 on 2018/10/15.
//  Copyright © 2018年 周群. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RequestNetwork)(id responseObject);

@interface FTCommonObject : NSObject
+ (NSString *)getUUID;
//获取时间戳
+ (NSString *)getTimeStampString;
////根据时间戳获取星期几
//+(NSString*)weekdayStringFromDate:(NSString *)timeStamp;
//根据时间戳转换成日期
+(NSString*)dateStringFromDate:(NSString *)timeStamp;
//根据时间戳生成月日
////把字典转换成字符串,加签使用
//+(NSString *)resetSignStringWithDictionary:(NSDictionary *)dict;
////当前时间生成时间戳截取后四位
//+ (NSString *)getCurrentTimestamp;
////整理post请求参数
//+ (NSDictionary *)resetPostBodyWith:(NSMutableDictionary *)bodyDic;
////整理get请求sign加签
//+ (NSString *)resetGetSignWith:(NSMutableDictionary *)bodyDic ;
//手机号格式化显示
+ (NSString *)numberResetString:(NSString *)numString;
////label两端对齐
//+(UILabel *)labelAlightLeftAndRightWithWidth:(UILabel *)label;
////逗号分隔
//+(NSString *)seperateNumberByComma:(NSString *)number;
////整理新get请求sign加签
//+ (NSString *)resetNewGetSignWith;
//////整理新post请求参数为字符串
//+ (NSString *)resetNewPostBodyWith:(NSMutableDictionary *)bodyDic;
////上传推送registerid
//+ (void)postJPushRegisterID;
//
////当前系统版本号
//+ (NSString *)getSystemVersion;
//通用唯一识别码UUID
+(NSString *)getUUID;
////获取设备版本号
//+ (NSString *)getDeviceName;
////动态识别码UUID
//+ (NSString *)getDynamicUUID;
////字典转json字符串方法
//+(NSString *)convertToJsonData:(NSDictionary *)dict;
////获取网络
//+ (NSString *)getNetType;
////添加提醒到日历
//+(void)AddACalendarReminderTitle:(NSString *)title Location:(NSString *)location remindDate:(double)date RemindTime:(CGFloat)time Note:(NSString *)note;
////文件路径
//+(NSString *)AccessFilepath:(NSString *)name;
////删除文件
//+(void)deletePlistFileName:(NSString *)name;
////获取默认token
//+(NSString *)getNomarlToken;
////获取极验地址
//+(NSString *)getJIyanCodeUrlString;
//获取当前viewcontroller
+(UIViewController *)currentViewController;
//登录页面
+(void)loginAction;
//清除推送角标
+(void)setApplicationIconBadgeNumberZero;
////保留小数
//+(NSString *)RetainDecimal:(NSString *)decimal Digits:(CGFloat)digits;

/** 判断网络状态*/
+ (void)checkNetwork;

/** 几到几的随机数*/
+ (int)getRandomNumber:(int)from to:(int)to;

/** 0-10000的随机数*/
+ (int)getRandomNumber;

/** 字典排序转换PHP字符串*/
+ (NSString *)stringAscendingOrderForPHP:(NSDictionary *)dict;

/** 双重加密sign*/
+ (NSString *)doubleEncryptions:(NSString *)strParams;

/** 根据参数拿到sign*/
+ (NSString *)getSign:(NSDictionary *)dicParams;

/** 正则匹配手机号*/
+ (BOOL)checkTelNumber:(NSString *)telNumber;

/** json字符串转化*/
+ (id)jsonstringToObject:(NSString *)jsonstring;

/** 判断数量大于万*/
+ (NSString *)jugeCount:(CGFloat)num;

/** 行距计算高度*/
+ (CGFloat)heightForText:(NSString *)text andSize:(CGFloat)size andLineSpace:(NSInteger)space andWidth:(CGFloat)width;

+ (void)checkVersion;
+ (NSString *)resetCardFromNumberDot:(NSString *)str;
+ (NSString *)formatNumberWithScientificNotation:(double)number;
+ (NSData *)compressImageToMB:(UIImage *)image;

+ (void)postData;
+ (void)postDataWithStartTime:(NSString *)startTime endTime:(NSString *)endTime type:(NSString *)type order:(NSString *)order;

+(NSString *)getTheDeviceNetWrokType;


+(NSString *_Nonnull)getStrByKey:(NSString *_Nullable)key;
+(void)pushActionWithUrlStr:(NSString *)str;

@end
