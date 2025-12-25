//
//  GSWebViewVC.m
//  AudioRoomProject
//
//  Created by 周群 on 2021/4/10.
//  Copyright © 2021 周群. All rights reserved.
//

#import "FTWebViewVC.h"
#import <WebKit/WebKit.h>
#import "MainTabViewController.h"
#import "FTLoginVC.h"
#import <StoreKit/StoreKit.h>

@interface FTWebViewVC ()<WKNavigationDelegate,WKScriptMessageHandler,WKUIDelegate>
@property (nonatomic, strong)WKWebView *s_wkWebView;
@property (nonatomic, strong)NSString       *s_startTimeStr;

@end

@implementation FTWebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [SVProgressHUD dismiss];
    [self initNaviBarWithTitle:self.m_titleStr LeftImage:FTImage(@"THblackBackImage") leftTitle:nil rightImage:nil rightTitle:nil delegate:self];
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    [config.userContentController addScriptMessageHandler:self name:@"Game"];
    [config.userContentController addScriptMessageHandler:self name:@"Geoff"];
    [config.userContentController addScriptMessageHandler:self name:@"Thrones"];
    [config.userContentController addScriptMessageHandler:self name:@"jumpToHome"];
    [config.userContentController addScriptMessageHandler:self name:@"closeSyn"];
    [config.userContentController addScriptMessageHandler:self name:@"Graphs"];
    [config.userContentController addScriptMessageHandler:self name:@"Season"];
    [config.userContentController addScriptMessageHandler:self name:@"Episode"];
    [config.userContentController addScriptMessageHandler:self name:@"Phabricator"];
    [config.userContentController addScriptMessageHandler:self name:@"MediaWiki"];
    [config.userContentController addScriptMessageHandler:self name:@"Merchandise"];
    [config.userContentController addScriptMessageHandler:self name:@"Audience"];
    [config.userContentController addScriptMessageHandler:self name:@"Research"];

    self.s_wkWebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, NavBarHeight, kSCREEN_WIDTH, kSCREEN_HEIGHT - NavBarHeight) configuration:config];
    self.s_wkWebView.backgroundColor = UIColorFromRGB(MainGrayBackGroundColor);
    self.s_wkWebView.UIDelegate = self;
    self.s_wkWebView.navigationDelegate = self;
    [self.view addSubview:self.s_wkWebView];

    UIDevice *device = [UIDevice currentDevice];
    NSString *systemVersion = [device systemVersion];
    NSString *modelName = [device model];
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = infoDic[@"CFBundleShortVersionString"];
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@intend=%@&left=%@&hour=%@&capitol=%@&podium=%@&desire=%@&rotunda=%@",self.m_urlStr,[self.m_urlStr containsString:@"?"] ? @"&" : @"?",[FT_Defaults stringForKey:MainToken],[FT_Defaults stringForKey:MainLeft],systemVersion,modelName,[FTCommonObject getUUID],[FT_Defaults stringForKey:MainIDFA],currentVersion];
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.s_wkWebView loadRequest:request];
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"ddd");
    self.huNavigationBar.m_titleLabel.text = webView.title;
    
}
#pragma mark - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([message.name isEqualToString:@"Game"] || [message.name isEqualToString:@"closeSyn"]) {
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
    if ([message.name isEqualToString:@"Geoff"]) {
        self.s_startTimeStr = [FTCommonObject getTimeStampString];
        return;
    }
    if ([message.name isEqualToString:@"Thrones"]) {
        [FTCommonObject postDataWithStartTime:self.s_startTimeStr endTime:[FTCommonObject getTimeStampString] type:@"8" order:@""];
        return;
    }
    if ([message.name isEqualToString:@"jumpToHome"]) {
        MainTabViewController *vc = [[MainTabViewController alloc]init];
        [UIApplication sharedApplication].delegate.window.rootViewController = vc;
        [[UIApplication sharedApplication].delegate.window makeKeyAndVisible];
        return;
    }
    if ([message.name isEqualToString:@"Graphs"]) {
        NSArray *receivedData = (NSArray *)message.body;
        NSString *str = receivedData.firstObject;
        FTWebViewVC *vc = [FTWebViewVC new];
        vc.m_urlStr = str;
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    if ([message.name isEqualToString:@"Season"]) {
        NSArray *receivedData = (NSArray *)message.body;
        NSString *str = receivedData.firstObject;
        if ([str containsString:@"http"]) {
            FTWebViewVC *vc = [FTWebViewVC new];
            vc.m_urlStr = str;
            [self.navigationController pushViewController:vc animated:YES];
        }else if ([str containsString:@"overthrow"]){
            FTSettingVC *vc = [FTSettingVC new];
            [self.navigationController pushViewController:vc animated:YES];
        }else if ([str containsString:@"individually"]){
            AppDelegate *appDelegatE = (AppDelegate*)[UIApplication sharedApplication].delegate;
            MainTabViewController *vc = (MainTabViewController *)appDelegatE.window.rootViewController;
            vc.selectedIndex = 0;
        }else if ([str containsString:@"working"]){
            [FTCommonObject loginAction];
        }else if ([str containsString:@"writers"]){
            AppDelegate *appDelegatE = (AppDelegate*)[UIApplication sharedApplication].delegate;
            MainTabViewController *vc = (MainTabViewController *)appDelegatE.window.rootViewController;
            vc.selectedIndex = 1;
        }else if ([str containsString:@"series"]){
            NSArray *arr = [str componentsSeparatedByString:@"?"];
            NSString *lastStr = arr.lastObject;
            NSArray *lastArr = [lastStr componentsSeparatedByString:@"="];
            FTDetailVC *vc = [FTDetailVC new];
            vc.m_productIdStr = lastArr.lastObject;
            WEAK_SELF
            vc.block = ^(NSString * _Nonnull str) {
                STRONG_SELF
                FTWebViewVC *vc = [FTWebViewVC new];
                vc.m_urlStr = str;
                [self.navigationController pushViewController:vc animated:YES];
            };
        }
        return;
    }
    if ([message.name isEqualToString:@"Episode"]) {
        AppDelegate *appDelegatE = (AppDelegate*)[UIApplication sharedApplication].delegate;
        appDelegatE.m_mainVc = [[MainTabViewController alloc]init];
        appDelegatE.window.rootViewController = [[MainTabViewController alloc]init];
        [appDelegatE.window makeKeyAndVisible];
        return;
    }
    if ([message.name isEqualToString:@"Phabricator"]) {
        AppDelegate *appDelegatE = (AppDelegate*)[UIApplication sharedApplication].delegate;
        appDelegatE.m_mainVc = [[MainTabViewController alloc]init];
        appDelegatE.m_mainVc.selectedIndex = 2;
        appDelegatE.window.rootViewController = [[MainTabViewController alloc]init];
        [appDelegatE.window makeKeyAndVisible];
        return;
    }
    if ([message.name isEqualToString:@"MediaWiki"]) {
        [self.navigationController popToRootViewControllerAnimated:NO];
        [FT_Defaults safe_SetObject:nil forKey:MainToken];
        [FT_Defaults synchronize];
        FTLoginVC *vc = [FTLoginVC new];
        UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:vc];
        nc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:nc animated:YES completion:nil];
        return;
    }
    if ([message.name isEqualToString:@"Merchandise"]) {
        [SKStoreReviewController requestReview];
        return;
    }

    if ([message.name isEqualToString:@"Research"]) {
        NSArray *receivedData = (NSArray *)message.body;
        NSString *str = receivedData.firstObject;
        [FTCommonObject postDataWithStartTime:[FTCommonObject getTimeStampString] endTime:[FTCommonObject getTimeStampString] type:@"10" order:str];
        return;
    }

}

@end
