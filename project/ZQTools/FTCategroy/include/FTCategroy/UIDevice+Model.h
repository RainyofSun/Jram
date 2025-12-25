//
//  UIDevice+Model.h
//  YueWan
//
//  Created by jiangzhichao on 15/8/21.
//  Copyright (c) 2015年 jiangzhichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Model)

+ (BOOL)isIphone4;
+ (BOOL)isIphone5;
+ (BOOL)isIphone6;
+ (BOOL)isIphone6P;
+ (BOOL)isIphone4Hardware;

+ (NSString*_Nullable)hardwareString;

#pragma mark - ** 设备基本信息 **

+ (BOOL)isiPad;
+ (BOOL)isiPhone;
+ (BOOL)isiPod;
+ (BOOL)isSimulator;

+ (nonnull NSString *)deviceName;               /* iPhone SE、iPad Pro ...*/
+ (nonnull NSString *)devicePlatform;

/*
 *  下面两个方法返回系统存储空间的相关信息
 */
+ (nonnull NSNumber *)totalDiskSpace;
+ (nonnull NSNumber *)freeDiskSpace;


#pragma mark - ** iOS版本号相关 **

+ (CGFloat)systemVision;

+ (BOOL)systemVisionGreaterThanOrEqualTo:(CGFloat) anotherSystemVision;


#pragma mark - ** 屏幕大小相关 **

+ (CGSize)screenSize;

+ (BOOL)isIphone4Screen;
+ (BOOL)isIphone5Screen;
+ (BOOL)isIphone6Screen;
+ (BOOL)isIphone6PScreen;

@end
