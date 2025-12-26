//
//  CommenObject.h
//  PinjamN
//
//  Created by 一刻 on 2025/12/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommenObject : NSObject

//获取时间戳
+ (NSString *)getTimeStampString;
//通用唯一识别码UUID
+(NSString *)getUUID;

//获取当前viewcontroller
+(UIViewController *)currentViewController;
//登录页面
+(void)loginAction;

/** 判断网络状态*/
+ (void)checkNetwork;

/** 行距计算高度*/
+ (CGFloat)heightForText:(NSString *)text andSize:(CGFloat)size andLineSpace:(NSInteger)space andWidth:(CGFloat)width;

+ (NSData *)compressImageToMB:(UIImage *)image;

+ (void)postData;
+ (void)postDataWithStartTime:(NSString *)startTime endTime:(NSString *)endTime type:(NSString *)type order:(NSString *)order;

+(NSString *)getTheDeviceNetWrokType;
+(NSString *_Nonnull)getStrByKey:(NSString *_Nullable)key;
+(void)pushActionWithUrlStr:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
