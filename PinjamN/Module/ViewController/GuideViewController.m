//
//  GuideViewController.m
//  PinjamN
//
//  Created by Yu Chen  on 2025/12/27.
//

#import "GuideViewController.h"

@interface GuideViewController ()

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *backImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:backImageView];
    backImageView.image = OSLWImage(@"LaunchImage");
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self aboutbolivia];

}

- (void)aboutbolivia
{
    WEAK_SELF
    [BaseNetRequest getWithURLServiceString:aboutbolivia parameters:nil success:^(BaseResponseModel *model) {
        STRONG_SELF
        if (model.success) {
            NSDictionary *dic = (NSDictionary *)model.data;
            [OSLW_Defaults safe_SetObject:[dic stringForKey:@"left"] forKey:MainLeft];
            [OSLW_Defaults synchronize];
            NSDictionary *sonoyaDic = [dic dictionaryForKey:@"collapse"];
            FBSDKSettings.sharedSettings.appID = [sonoyaDic stringForKey:@"disinformation"];
            FBSDKSettings.sharedSettings.clientToken = [sonoyaDic stringForKey:@"descend"];
            FBSDKSettings.sharedSettings.displayName = [sonoyaDic stringForKey:@"lawrencejanuary"];
            FBSDKSettings.sharedSettings.appURLSchemeSuffix = [sonoyaDic stringForKey:@"lawrencenovember"];
            [[FBSDKApplicationDelegate sharedInstance] application:self.m_application didFinishLaunchingWithOptions:self.m_wewwlaunchOptions];
            AppDelegate *appDelegatE = (AppDelegate*)[UIApplication sharedApplication].delegate;
            appDelegatE.m_mainVc = [[BaseTabbarViewController alloc]init];
            appDelegatE.m_mainVc.selectedIndex = 0;
            appDelegatE.window.rootViewController = [[BaseTabbarViewController alloc]init];
            [appDelegatE.window makeKeyAndVisible];
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
    [headerDic safe_setObject:[CommenObject getUUID] forKey:@"residences"];
    [headerDic safe_setObject:systemVersion forKey:@"hour"];
    [headerDic safe_setObject:[OSLW_Defaults stringForKey:MainLeft] forKey:@"left"];
    [headerDic safe_setObject:[OSLW_Defaults stringForKey:MainIDFA] forKey:@"desire"];
    
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
            NSString *str = [OSLW_Defaults stringForKey:MainMainUrl];
            if (![str isEqualToString:[dic stringForKey:@"efl"]]) {
                [OSLW_Defaults safe_SetObject:[dic stringForKey:@"efl"] forKey:MainMainUrl];
            }
        }
        [self aboutbolivia];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self aboutbolivia];
        });
    }];
}

@end
