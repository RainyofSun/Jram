//
//  NSObject+Swizzle.h
//  BAFCategories
//
//  Created by jackiehoo on 27/09/2017.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (Swizzle)

#pragma mark - ** Associated Objects **
/**
 获取 associated object
 
 @param key key
 @return associated object
 */
- (id)getAssociatedObjectForKey:(const char *)key;
/**
 设置 associated object，copy方式
 
 @param obj associated object
 @param key key
 @return 原先的associated object(old value)
 */
- (id)copyAssociatedObject:(id)obj forKey:(const char *)key;
/**
 设置 associated object，retain方式
 
 @param obj associated object
 @param key key
 @return 原先的associated object(old value)
 */
- (id)retainAssociatedObject:(id)obj forKey:(const char *)key;
/**
 设置 associated object，assign方式
 
 @param obj associated object
 @param key key
 @return 原先的associated object(old value)
 */
- (id)assignAssociatedObject:(id)obj forKey:(const char *)key;
/**
 移除 key 下的 associated object
 
 @param key key
 */
- (void)removeAssociatedObjectForKey:(const char *)key;
/**
 移除所有 associated object
 */
- (void)removeAllAssociatedObjects;

#pragma mark - ** Swizzle Method **

/**
 多参数 performSelector
 
 @param aSelector selector
 @param objs 参数 Array
 @return 调用返回值，全以对象形式
 */
- (id)performSelector:(SEL)aSelector withObjects: (NSArray *)objs;
/**
 覆盖实例方法
 
 @param aClass 类
 @param aOrigSel 原始方法
 @param aAltSel 覆盖方法
 @return YES - 成功， NO - 失败
 */
+ (BOOL)overrideClass:(Class)aClass method:(SEL)aOrigSel withMethod:(SEL)aAltSel;
/**
 覆盖类方法
 
 @param aClass 类
 @param aOrigSel 原始方法
 @param aAltSel 覆盖方法
 @return YES - 成功， NO - 失败
 */
+ (BOOL)overrideClass:(Class)aClass classMethod:(SEL)aOrigSel withClassMethod:(SEL)aAltSel;
/**
 交换实例方法
 
 @param aClass 类
 @param aOrigSel 原始方法
 @param aAltSel 交换方法
 @return YES - 成功， NO - 失败
 */
+ (BOOL)exchangeClass:(Class)aClass method:(SEL)aOrigSel withMethod:(SEL)aAltSel;
/**
 交换类方法
 
 @param aClass 类
 @param aOrigSel 原始方法
 @param aAltSel 交换方法
 @return YES - 成功， NO - 失败
 */
+ (BOOL)exchangeClass:(Class)aClass classMethod:(SEL)aOrigSel withClassMethod:(SEL)aAltSel;
/**
添加方法
 
 @param newMethod 新方法
 @param klass 宿主类型
 */
+ (void)appendMethod:(SEL)newMethod fromClass:(Class)klass;
@end
