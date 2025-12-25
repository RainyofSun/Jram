//
//  JYCommonObject.m
//  JYProject
//
//  Created by 周群 on 2018/10/15.
//  Copyright © 2018年 周群. All rights reserved.
//

#import "FTCommonObject.h"
#import "QSKeyChainStore.h"
#import "FTLoginVC.h"
#import "AppDelegate.h"
#define  KEY_USERNAME_PASSWORD @"com.jinyudsd.yujin.jinyuusernamepassword"
#import <sys/utsname.h>//要导入头文件
#import <mach/mach.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import "FTWebViewVC.h"
#import "FTSettingVC.h"

@implementation FTCommonObject

+ (NSString *)resetCardFromNumberDot:(NSString *)str
{
    NSMutableArray *arr = [NSMutableArray array];
    int length = (int)str.length;
    for (int k = 0; k < length; k++) {
        NSString *newStr = [str substringWithRange:NSMakeRange(k, 1)];
        if (k < 2 || k > length - 5) {
            [arr safe_addObject:newStr];
        }else{
            [arr safe_addObject:@"*"];
        }
    }
    return [arr componentsJoinedByString:@""];
}

+ (NSString *)formatNumberWithScientificNotation:(double)number {
    // 创建并配置 NSNumberFormatter 以使用逗号分隔
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setGroupingSeparator:@","];
    [formatter setGroupingSize:3];
    [formatter setUsesGroupingSeparator:YES];
    NSString *formattedNumber = [formatter stringFromNumber:[NSNumber numberWithDouble:number]];
    return formattedNumber;
}


+ (NSString *)getUUID
{
    NSString *strUUID = (NSString *)[QSKeyChainStore load:KEY_USERNAME_PASSWORD];
    if (!strUUID.hasTextContent)
    {
        strUUID = [[NSUUID UUID] UUIDString];
        [QSKeyChainStore save:KEY_USERNAME_PASSWORD data:strUUID];
    }
    return strUUID;
}
//获取时间戳
+ (NSString *)getTimeStampString
{
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval time = [date timeIntervalSince1970];  //  *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeStamp = [NSString stringWithFormat:@"%.0f", time]; //转为字符型
    return timeStamp;
}

//根据时间戳转换成日期
+(NSString*)dateStringFromDate:(NSString *)timeStamp
{
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:[timeStamp doubleValue]];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString * dateStr = [formatter stringFromDate:date2];
    return dateStr;
}

//获取当前viewcontroller
+(UIViewController *)currentViewController
{
    UIViewController * currVC = nil;
    UIViewController * Rootvc = [UIApplication sharedApplication].delegate.window.rootViewController;
    do {
        if ([Rootvc isKindOfClass:[UINavigationController class]]) {
            UINavigationController * nav = (UINavigationController *)Rootvc;
            UIViewController * v = [nav.viewControllers lastObject];
            currVC = v;
            Rootvc = v.presentedViewController;
            continue;
        }else if([Rootvc isKindOfClass:[UITabBarController class]]){
            UITabBarController * tabVC = (UITabBarController *)Rootvc;
            currVC = tabVC;
            Rootvc = [tabVC.viewControllers objectAtIndex:tabVC.selectedIndex];
            continue;
        }
    } while (Rootvc!=nil);
    
    return currVC;
}




#pragma mark - 几到几的随机数

+ (int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to - from + 1)));
}

#pragma mark - 0到10000的随机数

+ (int)getRandomNumber
{
    return (int)(0 + (arc4random() % (10000 - 0) + 1));
}

#pragma mark - 获取签名

+ (NSString *)getSign:(NSDictionary *)dicParams
{
    NSString *strSort = [FTCommonObject stringAscendingOrderForPHP:dicParams];
    NSString *strEncrypt = [FTCommonObject doubleEncryptions:strSort];
    return strEncrypt;
}

#pragma mark - 正则匹配手机号

+ (BOOL)checkTelNumber:(NSString *)telNumber
{
    NSString *pattern = @"^1+[3456789]+\\d{9}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:telNumber];
    return isMatch;
}

#pragma mark - json字符串转化

+ (id)jsonstringToObject:(NSString *)jsonstring
{
    NSData * jsonData = [jsonstring dataUsingEncoding:NSUTF8StringEncoding];
    id obj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    return obj;
}

#pragma mark - 判断数量大于万

+ (NSString *)jugeCount:(CGFloat)num
{
    if (num > 99999999)
    {
        return [NSString stringWithFormat:@"%.2f亿",num / 100000000.0];
    }
    else if (num > 9999)
    {
        return [NSString stringWithFormat:@"%.2fw",num / 10000.0];
    }
    else
    {
        return [NSString stringWithFormat:@"%.0f",num];
    }
}

//字体  行距计算高度
+ (CGFloat)heightForText:(NSString *)text andSize:(CGFloat)size andLineSpace:(NSInteger)space andWidth:(CGFloat)width
{
    NSMutableParagraphStyle *paraghStyle = [[NSMutableParagraphStyle alloc] init];
    [paraghStyle setLineSpacing:space];
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:size],NSParagraphStyleAttributeName:paraghStyle};
    CGSize size1 = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return ceil(size1.height) + 1;
}
//登录页面
+ (void)loginAction
{
    [FT_Defaults safe_SetObject:nil forKey:MainToken];
    [FT_Defaults safe_SetObject:nil forKey:MainPhone];
    [FT_Defaults safe_SetObject:nil forKey:MainLeft];
    [FT_Defaults synchronize];
    AppDelegate *appDelegatE = (AppDelegate*)[UIApplication sharedApplication].delegate;
    FTLoginVC *mainVc = [[FTLoginVC alloc]init];
    UINavigationController *mainNC = [[UINavigationController alloc] initWithRootViewController:mainVc];
    [appDelegatE.m_mainVc presentViewController:mainNC animated:YES completion:nil];
}

+ (NSData *)compressImageToMB:(UIImage *)image{
    // 将 maxFileSizeKB 转换为字节
    NSUInteger maxFileSize = 200 * 1024;
    
    // 初始压缩质量
    CGFloat compression = 1.0;
    
    // 压缩图片
    NSData *compressedData = UIImageJPEGRepresentation(image, compression);
    
    // 如果图片的大小超过了指定大小，则逐步减少压缩质量
    while ([compressedData length] > maxFileSize && compression > 0.01) {
        compression -= 0.1;
        compressedData = UIImageJPEGRepresentation(image, compression);
    }
    
    // 返回压缩后的图片数据
    return compressedData;
}

+ (void)postData
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic safe_setObject:[FT_Defaults stringForKey:MainIDFA] forKey:@"funko"];
    [dic safe_setObject:[FTCommonObject getUUID] forKey:@"beer"];
    [FTNetting postWithURLServiceString:snowscastings parameters:dic success:nil failure:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [FTCommonObject snowsolivia];

    });
    
}

+ (NSMutableDictionary *)getStorageInfo {
    NSError *error = nil;
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    
    if (error) {
        NSLog(@"Error retrieving storage info: %@", error.localizedDescription);
        return nil;
    }
    NSNumber *totalSize = attributes[NSFileSystemSize];
    NSNumber *freeSize = attributes[NSFileSystemFreeSize];
    NSMutableDictionary *worksDic = [NSMutableDictionary dictionary];
    [worksDic safe_setObject:[self getTheDeviceTotalStorage] forKey:@"measurement"];
    [worksDic safe_setObject:[self getTheDeviceLeftStorage] forKey:@"performed"];
    
    mach_port_t host_port;
    mach_msg_type_number_t host_size;
    vm_size_t pagesize;
    
    host_port = mach_host_self();
    host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    host_page_size(host_port, &pagesize);
    
    vm_statistics_data_t vm_stat;
    if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
        NSLog(@"Failed to fetch vm statistics");
    }
    
    natural_t mem_used = (vm_stat.active_count +
                          vm_stat.inactive_count +
                          vm_stat.wire_count) * pagesize;
    natural_t mem_free = vm_stat.free_count * pagesize;
    natural_t mem_total = mem_used + mem_free;
    
    [worksDic safe_setObject:[self getTheDeviceTotalMemory] forKey:@"mediawiki"];
    [worksDic safe_setObject:[self getTheDeviceLeftMemory] forKey:@"phabricator"];
    
    return worksDic;
}

+(NSString *)getTheDeviceLeftStorage{
    
    NSError *error = nil;
    NSDictionary *results = [[[NSURL alloc] initFileURLWithPath:NSTemporaryDirectory()] resourceValuesForKeys:@[NSURLVolumeAvailableCapacityForImportantUsageKey] error:&error];
    if(error){return @"-1";}
    return results[NSURLVolumeAvailableCapacityForImportantUsageKey];
}

+(NSString *)getTheDeviceTotalStorage{
    
    NSError *error = nil;
    NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (error) return @"-1";
    int64_t space =  [[attrs objectForKey:NSFileSystemSize] longLongValue];
    if (space < 0) space = -1;
    return [NSString stringWithFormat:@"%lld",space];
}

+(NSString *)getTheDeviceTotalMemory{
    
    int64_t totalMemory = [[NSProcessInfo processInfo] physicalMemory];
    if (totalMemory < -1) totalMemory = -1;
    return [NSString stringWithFormat:@"%lld",totalMemory];
}

+(NSString *)getTheDeviceLeftMemory{
    
    mach_port_t host_port = mach_host_self();
    mach_msg_type_number_t count = HOST_VM_INFO64_COUNT;
 
    vm_size_t page_size;
    vm_statistics64_data_t vminfo;
    host_page_size(host_port, &page_size);
    host_statistics64(host_port, HOST_VM_INFO64, (host_info64_t)&vminfo,&count);
 
    uint64_t free_size = (vminfo.free_count + vminfo.external_page_count + vminfo.purgeable_count - vminfo.speculative_count) * page_size;
    return [NSString stringWithFormat:@"%llu",free_size];
}



+ (NSMutableDictionary *)getBatteryInfo {
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    float batteryLevel = [UIDevice currentDevice].batteryLevel;
    UIDeviceBatteryState batteryState = [UIDevice currentDevice].batteryState;
    BOOL isCharging = batteryState == UIDeviceBatteryStateCharging || batteryState == UIDeviceBatteryStateFull;
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic safe_setObject:@(batteryLevel * 100) forKey:@"issues"];
    [dic safe_setObject:isCharging ? @"1" : @"0" forKey:@"technical"];
    return dic;
}

+ (NSMutableDictionary *)getDeviceInfo {
    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
    NSString *deviceName = [[UIDevice currentDevice] name];
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    UIScreen *screen = [UIScreen mainScreen];
    CGRect screenBounds = screen.bounds;
    CGFloat screenScale = screen.scale;
    CGSize screenPhysicalSize = CGSizeMake(screenBounds.size.width * screenScale, screenBounds.size.height * screenScale);
    CGFloat diagonalSize = sqrt(pow(screenBounds.size.width, 2) + pow(screenBounds.size.height, 2)) / screenScale;
    NSString *logicalResolution = [NSString stringWithFormat:@"%.0fX%.0f", screenBounds.size.width, screenBounds.size.height];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic safe_setObject:systemVersion forKey:@"graphs"];
    [dic safe_setObject:deviceName forKey:@"millions"];
    [dic safe_setObject:deviceModel forKey:@"declined"];
    [dic safe_setObject:@(screenPhysicalSize.width) forKey:@"warnermedia"];
    [dic safe_setObject:@(screenPhysicalSize.height) forKey:@"revenue"];
    [dic safe_setObject:logicalResolution forKey:@"parent"];
    [dic safe_setObject:@(diagonalSize) forKey:@"cancel"];
    return dic;
}

+ (BOOL)isSimulator {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *model = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return [model isEqualToString:@"x86_64"] || [model isEqualToString:@"i386"];
}

+ (BOOL)isJailbroken {
    NSArray *jailbreakPaths = @[@"/Applications/Cydia.app",
                                @"/Library/MobileSubstrate/MobileSubstrate.dylib",
                                @"/bin/bash",
                                @"/usr/sbin/sshd",
                                @"/etc/apt"];
    
    for (NSString *path in jailbreakPaths) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            return YES;
        }
    }
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://package/com.example.package"]]) {
        return YES;
    }
    
    return NO;
}

+ (NSDictionary *)getLocaleInfo {
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    NSString *timeZoneID = [timeZone name];
    
    NSString *language = [[NSLocale preferredLanguages] firstObject];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic safe_setObject:timeZoneID forKey:@"demographic"];
    [dic safe_setObject:language forKey:@"nielsen"];
    
    [dic safe_setObject:[self getTheDeviceNetWrokType] forKey:@"demand"];
    [dic safe_setObject:[FT_Defaults stringForKey:MainIDFA] forKey:@"funko"];
    [dic safe_setObject:[FTCommonObject getUUID] forKey:@"beer"];
    return dic;
}


+(NSString *)getTheDeviceNetWrokType{
    AFNetworkReachabilityStatus internetStatus = [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus;
    switch (internetStatus) {
      case AFNetworkReachabilityStatusReachableViaWiFi:
        return @"WIFI";
        break;
      case AFNetworkReachabilityStatusReachableViaWWAN:
      {
        CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
        NSString *currentStatus = info.currentRadioAccessTechnology;
        if ([currentStatus isEqualToString:CTRadioAccessTechnologyGPRS]) {
          return @"GPRS";
        }else if ([currentStatus isEqualToString:CTRadioAccessTechnologyEdge]) {
          return @"2.75G EDGE";
        }else if ([currentStatus isEqualToString:CTRadioAccessTechnologyWCDMA]){
          return @"3G";
        }else if ([currentStatus isEqualToString:CTRadioAccessTechnologyHSDPA]){
          return @"3.5G HSDPA";
        }else if ([currentStatus isEqualToString:CTRadioAccessTechnologyHSUPA]){
          return @"3.5G HSUPA";
        }else if ([currentStatus isEqualToString:CTRadioAccessTechnologyCDMA1x]){
          return @"2G";
        }else if ([currentStatus isEqualToString:CTRadioAccessTechnologyCDMAEVDORev0]||[currentStatus isEqualToString:CTRadioAccessTechnologyCDMAEVDORevA]||[currentStatus isEqualToString:CTRadioAccessTechnologyCDMAEVDORevB]){
          return @"3G";
        }else if ([currentStatus isEqualToString:CTRadioAccessTechnologyeHRPD]){
          return @"HRPD";
        }else if ([currentStatus isEqualToString:CTRadioAccessTechnologyLTE]){
          return @"4G";
        }else {
          if (@available(iOS 14.1, *)) {
            if ([currentStatus isEqualToString:CTRadioAccessTechnologyNRNSA]){
              return @"5G NSA";
            }else if ([currentStatus isEqualToString:CTRadioAccessTechnologyNR]){
              return @"5G";
            }
          } else {
            return @"None";
          }
        }
      }
        break;
      case AFNetworkReachabilityStatusNotReachable:
        return @"NotReachable";
      default:
        return @"Unknown";
        break;
    }
    return @"Unknown";
}


+ (NSDictionary *)fetchCurrentWiFiInfo {
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    NSDictionary *wifiInfo = nil;
    for (NSString *ifnam in ifs) {
        wifiInfo = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
    }
    NSString *ssid = wifiInfo[(NSString *)kCNNetworkInfoKeySSID];
    NSString *bssid = wifiInfo[(NSString *)kCNNetworkInfoKeyBSSID];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic safe_setObject:ssid forKey:@"projects"];
    [dic safe_setObject:bssid forKey:@"cumulative"];

    return dic;
}



+ (void)snowsolivia
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic safe_setObject:[FTCommonObject getStorageInfo] forKey:@"works"];
    [dic safe_setObject:[FTCommonObject getBatteryInfo] forKey:@"info"];
    [dic safe_setObject:[FTCommonObject getDeviceInfo] forKey:@"unavailable"];
    NSMutableDictionary *subDic = [NSMutableDictionary dictionary];
    [subDic safe_setObject:[FTCommonObject isSimulator] ? @"1" : @"0" forKey:@"grew"];
    [subDic safe_setObject:[FTCommonObject isJailbroken] ? @"1" : @"0" forKey:@"dvr"];
    [dic safe_setObject:subDic forKey:@"might"];
    [dic safe_setObject:[FTCommonObject getLocaleInfo] forKey:@"shifting"];
    NSMutableDictionary *sub1Dic = [NSMutableDictionary dictionary];
    [sub1Dic safe_setObject:[FTCommonObject fetchCurrentWiFiInfo] forKey:@"involving"];
    [dic safe_setObject:sub1Dic forKey:@"analytics"];
    NSMutableDictionary *parentDic = [NSMutableDictionary dictionary];
    [parentDic safe_setObject:dic.JSONString forKey:@"steven"];
    [FTNetting postWithURLServiceString:snowsolivia parameters:parentDic success:nil failure:nil];
}

+ (void)postDataWithStartTime:(NSString *)startTime endTime:(NSString *)endTime type:(NSString *)type order:(NSString *)order
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic safe_setObject:[FT_Defaults stringForKey:MainIDFA] forKey:@"desire"];
    [dic safe_setObject:[FTCommonObject getUUID] forKey:@"replica"];
    [dic safe_setObject:type forKey:@"jewelry"];
    [dic safe_setObject:@"2" forKey:@"weapons"];
    [dic safe_setObject:[FT_Defaults stringForKey:MainLong] forKey:@"ulysse"];
    [dic safe_setObject:[FT_Defaults stringForKey:MainLati] forKey:@"nardin"];
    [dic safe_setObject:startTime forKey:@"games"];
    [dic safe_setObject:endTime forKey:@"merchandise"];
    [dic safe_setObject:order forKey:@"selection"];
    [FTNetting postWithURLServiceString:snowsemma parameters:dic success:nil failure:nil];
    
}

+(NSString *_Nonnull)getStrByKey:(NSString *_Nullable)key
{
    //1是英文   其他是西班牙
    NSString *typeStr = [FT_Defaults stringForKey:MainLeft];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"en" ofType:@"lproj"];
    if([typeStr isEqualToString:@"2"]){
         path = [[NSBundle mainBundle] pathForResource:@"fi" ofType:@"lproj"];
    }
    NSString *labelString = [[NSBundle bundleWithPath:path] localizedStringForKey:key value:nil table:@"language"];
    return labelString;
}

+(void)pushActionWithUrlStr:(NSString *)str
{
    if ([str containsString:@"http"]) {
        FTWebViewVC *vc = [FTWebViewVC new];
        vc.m_urlStr = str;
        [[FTCommonObject currentViewController].navigationController pushViewController:vc animated:YES];
    }else if ([str containsString:@"running"]){
        FTSettingVC *vc = [FTSettingVC new];
        [[FTCommonObject currentViewController].navigationController pushViewController:vc animated:YES];
    }else if ([str containsString:@"all"]){
        AppDelegate *appDelegatE = (AppDelegate*)[UIApplication sharedApplication].delegate;
        MainTabViewController *vc = (MainTabViewController *)appDelegatE.window.rootViewController;
        vc.selectedIndex = 0;
    }else if ([str containsString:@"theme"]){
        [FTCommonObject loginAction];
    }else if ([str containsString:@"big"]){
        AppDelegate *appDelegatE = (AppDelegate*)[UIApplication sharedApplication].delegate;
        MainTabViewController *vc = (MainTabViewController *)appDelegatE.window.rootViewController;
        vc.selectedIndex = 1;
    }else if ([str containsString:@"across"]){
        NSArray *arr = [str componentsSeparatedByString:@"?"];
        NSString *lastStr = arr.lastObject;
        NSArray *lastArr = [lastStr componentsSeparatedByString:@"="];
        FTDetailVC *vc = [FTDetailVC new];
        vc.m_productIdStr = lastArr.lastObject;
        vc.block = ^(NSString * _Nonnull str) {
            FTWebViewVC *vc = [FTWebViewVC new];
            vc.m_urlStr = str;
            [[FTCommonObject currentViewController].navigationController pushViewController:vc animated:YES];
        };
        [[FTCommonObject currentViewController].navigationController pushViewController:vc animated:YES];
    }
}

@end
