//
//  NSString+Verify.h
//  Moments
//
//  Created by jiangzhichao on 15/11/10.
//  Copyright © 2015年 jiangzhichao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Verify)

/**
 判断字符串不为 nil，NULL、NSNull 或者为空字符串
 
 */
- (BOOL)isValid;

/**
 判断字符串不为 trim两头空格和换行
 
 */
- (BOOL)hasTextContent;

/**
 判断字符串只包含数字
 
 */
- (BOOL)isOnlyNumbers;

/**
 判断字符串只包含字符
 
 */
- (BOOL)isOnlyLetters;
/**
 是否包含字符串
 @param string 包含的字符串
 */
- (BOOL)containsString:(NSString *)string;

- (BOOL)isBlankString;
- (BOOL)isEmptyOrWhitespace;
/**
 字符串为 nil， NSNull 或者为空字符串
 
 @param string 字符串
 @return YES or NO
 */
+ (BOOL)stringIsNilOrBlank:(NSString *)string;
/**
 stringIsNilOrEmpty 与 isBlankString 的合并判断
 
 @param string input string
 @return YES or NO
 */
+ (BOOL)stringIsNilOrEmpty:(NSString *)string;
/**
 是否是正确的邮箱地址
 
 */
- (BOOL)isEmail;
/**
 是否是符合规格的密码格式
 
 */
- (BOOL)isValidUserPassword;        /* 是否是符合格式的密码 */
/**
 是否是大陆手机号
 
 */
- (BOOL)isPhoneNumber;
/**
 是否是有效身份证号
 
 */
- (BOOL)isIDCardNumberOfPRC;        /* 是否是有效的身份证号码 */
/**
 是否是有效的验证码
 
 */
- (BOOL)isValidVerifyCode;          /* 是否是有效的验证码 */

// 校验用户密码
- (BOOL) isUserPasswd;
// 校验验证码
- (BOOL) isVerifyCode;
// 校验手机号
- (BOOL) isPhoneNum;

@end
