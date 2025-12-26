//
//  AppDelegate.m
//  PinjamN
//
//  Created by 一刻 on 2025/12/26.
//

#import "AppDelegate.h"
#import "MainTabViewController.h"
#import "FTLoginVC.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <AdSupport/AdSupport.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import "FTGuideVC.h"

@interface AppDelegate ()<CLLocationManagerDelegate>
@property (nonatomic, strong)CLLocationManager     *s_lcManager;
@property (nonatomic, strong)CLLocation            *s_location;
@property (nonatomic, strong)UIApplication         *s_application;
@property (nonatomic, strong)NSDictionary          *s_launchOptions;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.s_application = application;
    self.s_launchOptions = launchOptions;
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    [self initTabbarRootController];
    [FT_Notification addObserver:self selector:@selector(locationStart) name:MainNotification object:nil];
    WEAK_SELF
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        STRONG_SELF
        if ([CLLocationManager locationServicesEnabled]) {
            self.s_lcManager = [CLLocationManager new];
            self.s_lcManager.delegate = self;
            [self.s_lcManager requestWhenInUseAuthorization];
            self.s_lcManager.distanceFilter = 5;
            self.s_lcManager.desiredAccuracy = kCLLocationAccuracyBest;
            [self.s_lcManager startUpdatingLocation];

        }
    });

//    [self getNetworkStates];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
      if (status != AFNetworkReachabilityStatusNotReachable) {
//        [[NSNotificationCenter defaultCenter] postNotificationName:CashUPDATECASHDATA object:nil];
      }
    }];

    
//    [self aboutbolivia];
    return YES;
}

- (void)getNetworkStates {
    // 监控网络状态
    AFNetworkReachabilityManager *reachability = [AFNetworkReachabilityManager sharedManager];
    [reachability setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"状态不知道");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WIFI");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"流量");
                break;
            default:
                break;
        }
    }];
    //开始监控
    [reachability startMonitoring];
}

- (void)aboutbolivia
{
    WEAK_SELF
    [FTNetting getWithURLServiceString:aboutbolivia parameters:nil success:^(FTResponseModel *model) {
        STRONG_SELF
        if (model.success) {
            NSDictionary *dic = (NSDictionary *)model.data;
            [FT_Defaults safe_SetObject:[dic stringForKey:@"left"] forKey:MainLeft];
            [FT_Defaults synchronize];
            NSDictionary *sonoyaDic = [dic dictionaryForKey:@"collapse"];
            FBSDKSettings.sharedSettings.appID = [sonoyaDic stringForKey:@"disinformation"];
            FBSDKSettings.sharedSettings.clientToken = [sonoyaDic stringForKey:@"descend"];
            FBSDKSettings.sharedSettings.displayName = [sonoyaDic stringForKey:@"lawrencejanuary"];
            FBSDKSettings.sharedSettings.appURLSchemeSuffix = [sonoyaDic stringForKey:@"lawrencenovember"];
            [[FBSDKApplicationDelegate sharedInstance] application:self.s_application didFinishLaunchingWithOptions:self.s_launchOptions];
        }else{
            [self snowsoliviaUrl];
        }
    } failure:^(NSError *error) {
        STRONG_SELF
        [self snowsoliviaUrl];
    }];
}

- (void)snowsoliviaUrl
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    /**
     *  可以接受的类型
     */
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 60;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",
                                                                              @"text/html",
                                                                              @"text/json",
                                                                              @"text/plain",
                                                                              @"text/javascript",
                                                                              @"text/xml",
                                                                              @"image/*"]];
    NSMutableDictionary *headerDic = [NSMutableDictionary dictionary];
    UIDevice *device = [UIDevice currentDevice];
    NSString *systemVersion = [device systemVersion];
    NSString *modelName = [device model];
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = infoDic[@"CFBundleShortVersionString"];
    [headerDic safe_setObject:currentVersion forKey:@"rotunda"];
    [headerDic safe_setObject:modelName forKey:@"capitol"];
    [headerDic safe_setObject:[FTCommonObject getUUID] forKey:@"podium"];
    [headerDic safe_setObject:systemVersion forKey:@"hour"];
    [headerDic safe_setObject:[FT_Defaults stringForKey:MainToken] forKey:@"intend"];
    [headerDic safe_setObject:[FT_Defaults stringForKey:MainLeft] forKey:@"left"];
    [headerDic safe_setObject:[FT_Defaults stringForKey:MainIDFA] forKey:@"desire"];

    NSString *urlString =snowsoliviaUrl;
    WEAK_SELF
    [manager GET:urlString parameters:headerDic headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        STRONG_SELF
        NSDictionary *dict = nil;
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            dict = responseObject;
        } else {
            dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        }
        NSArray *arr = (NSArray *)dict;
        for (int k = 0; k < arr.count; k++) {
            NSDictionary *dic = [arr safe_objectAtIndex:k];
            NSString *str = [FT_Defaults stringForKey:MainMainUrl];
            if (![str isEqualToString:[dic stringForKey:@"mpera"]]) {
                [FT_Defaults safe_SetObject:[dic stringForKey:@"mpera"] forKey:MainMainUrl];
            }
        }
        [self aboutbolivia];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self aboutbolivia];
        });
    }];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    WEAK_SELF
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
       dispatch_after(delayTime, dispatch_get_main_queue(), ^{
           STRONG_SELF
           [self getIDFA];
       });
}

- (void)getIDFA
{
    WEAK_SELF
    ATTrackingManagerAuthorizationStatus authorStatus = ATTrackingManager.trackingAuthorizationStatus;
    if (authorStatus == ATTrackingManagerAuthorizationStatusNotDetermined) { //用户未做选择或未弹窗
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            STRONG_SELF
                NSString *str = [[[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString] uppercaseString];
                [FT_Defaults safe_SetObject:str forKey:MainIDFA];
                [FT_Defaults synchronize];
        }];
    }
    
}

- (void)locationStart {
    [self.s_lcManager stopUpdatingHeading];

    [self.s_lcManager startUpdatingLocation];

    
}

- (void)postData
{
    if (self.s_location) {
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        [geocoder reverseGeocodeLocation:self.s_location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            if (error == nil && [placemarks count] > 0) {
                CLPlacemark *placemark = [placemarks lastObject];
                
                NSString *country = placemark.country;
                NSString *countryCode = placemark.ISOcountryCode;
                NSString *province = placemark.administrativeArea;
                NSString *city = placemark.locality;
                NSString *district = placemark.subLocality;
                NSString *street = placemark.thoroughfare;
                CLLocation *location = placemark.location;
                
                NSMutableDictionary *dic = [NSMutableDictionary dictionary];
                [dic safe_setObject:province forKey:@"visited"];
                [dic safe_setObject:countryCode forKey:@"traveling"];
                [dic safe_setObject:country forKey:@"resin"];
                [dic safe_setObject:street forKey:@"wristwatch"];
                [dic safe_setObject:[NSString stringWithFormat:@"%.6f",location.coordinate.latitude] forKey:@"nardin"];
                [dic safe_setObject:[NSString stringWithFormat:@"%.6f",location.coordinate.longitude] forKey:@"ulysse"];
                [dic safe_setObject:city forKey:@"apparel"];
                [dic safe_setObject:district forKey:@"ommegang"];
                [FTNetting postWithURLServiceString:snowscooke parameters:dic success:nil failure:nil];
                [FT_Defaults safe_SetObject:[NSString stringWithFormat:@"%.6f",location.coordinate.latitude] forKey:MainLati];
                [FT_Defaults safe_SetObject:[NSString stringWithFormat:@"%.6f",location.coordinate.longitude] forKey:MainLong];
                [FT_Defaults synchronize];
            }
        }];
        [self.s_lcManager stopUpdatingLocation];
    }
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    self.s_location = [locations lastObject];
    
    [self postData];
    
}

- (void)showTrackingPermissionAlert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"启用跟踪权限"
                                                                             message:@"请前往设置页面启用跟踪权限，以便我们为您提供更个性化的广告体验。"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *settingsAction = [UIAlertAction actionWithTitle:@"前往设置"
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * _Nonnull action) {
        [self openAppSettings];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    [alertController addAction:settingsAction];
    [alertController addAction:cancelAction];
    
    [[FTCommonObject currentViewController] presentViewController:alertController animated:YES completion:nil];
}

- (void)openAppSettings {
    NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:settingsURL]) {
        [[UIApplication sharedApplication] openURL:settingsURL options:@{} completionHandler:nil];
    }
}

- (void)initTabbarRootController
{
    FTGuideVC *vc = [FTGuideVC new];
    vc.m_application = self.s_application;
    vc.m_wewwlaunchOptions = self.s_launchOptions;
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
        return;
}
@end
