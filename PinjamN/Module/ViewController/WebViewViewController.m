//
//  WebViewViewController.m
//  PinjamN
//
//  Created by Yu Chen  on 2025/12/26.
//

#import "WebViewViewController.h"
#import <WebKit/WebKit.h>
#import "BaseTabbarViewController.h"
#import "UserLoginViewController.h"
#import <StoreKit/StoreKit.h>
#import "SettingViewController.h"
#import "UserLoginViewController.h"
#import "ChanPinViewController.h"

@interface WebViewViewController ()<WKNavigationDelegate,WKScriptMessageHandler,WKUIDelegate>

@property (nonatomic, strong)WKWebView *s_wkWebView;
@property (nonatomic, strong)NSString       *s_startTimeStr;

@end

@implementation WebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [SVProgressHUD dismiss];
    [self initNaviBarWithTitle:self.m_titleStr LeOSLWImage:OSLWImage(@"THblackBackImage") leftTitle:nil rightImage:nil rightTitle:nil delegate:self];
    
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
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@intend=%@&left=%@&hour=%@&capitol=%@&podium=%@&desire=%@&rotunda=%@",self.m_urlStr,[self.m_urlStr containsString:@"?"] ? @"&" : @"?",[OSLW_Defaults stringForKey:MainToken],[OSLW_Defaults stringForKey:MainLeft],systemVersion,modelName,[CommenObject getUUID],[OSLW_Defaults stringForKey:MainIDFA],currentVersion];
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
        self.s_startTimeStr = [CommenObject getTimeStampString];
        return;
    }
    if ([message.name isEqualToString:@"Thrones"]) {
        [CommenObject postDataWithStartTime:self.s_startTimeStr endTime:[CommenObject getTimeStampString] type:@"8" order:@""];
        return;
    }
    if ([message.name isEqualToString:@"jumpToHome"]) {
        BaseTabbarViewController *vc = [[BaseTabbarViewController alloc]init];
        [UIApplication sharedApplication].delegate.window.rootViewController = vc;
        [[UIApplication sharedApplication].delegate.window makeKeyAndVisible];
        return;
    }
    if ([message.name isEqualToString:@"Graphs"]) {
        NSArray *receivedData = (NSArray *)message.body;
        NSString *str = receivedData.firstObject;
        WebViewViewController *vc = [WebViewViewController new];
        vc.m_urlStr = str;
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    if ([message.name isEqualToString:@"Season"]) {
        NSArray *receivedData = (NSArray *)message.body;
        NSString *str = receivedData.firstObject;
        if ([str containsString:@"http"]) {
            WebViewViewController *vc = [WebViewViewController new];
            vc.m_urlStr = str;
            [self.navigationController pushViewController:vc animated:YES];
        }else if ([str containsString:@"overthrow"]){
            SettingViewController *vc = [SettingViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }else if ([str containsString:@"individually"]){
            AppDelegate *appDelegatE = (AppDelegate*)[UIApplication sharedApplication].delegate;
            BaseTabbarViewController *vc = (BaseTabbarViewController *)appDelegatE.window.rootViewController;
            vc.selectedIndex = 0;
        }else if ([str containsString:@"working"]){
            [CommenObject loginAction];
        }else if ([str containsString:@"writers"]){
            AppDelegate *appDelegatE = (AppDelegate*)[UIApplication sharedApplication].delegate;
            BaseTabbarViewController *vc = (BaseTabbarViewController *)appDelegatE.window.rootViewController;
            vc.selectedIndex = 1;
        }else if ([str containsString:@"series"]){
            NSArray *arr = [str componentsSeparatedByString:@"?"];
            NSString *lastStr = arr.lastObject;
            NSArray *lastArr = [lastStr componentsSeparatedByString:@"="];
            ChanPinViewController *vc = [ChanPinViewController new];
            vc.m_productIdStr = lastArr.lastObject;
            WEAK_SELF
            vc.block = ^(NSString * _Nonnull str) {
                STRONG_SELF
                WebViewViewController *vc = [WebViewViewController new];
                vc.m_urlStr = str;
                [self.navigationController pushViewController:vc animated:YES];
            };
        }
        return;
    }
    if ([message.name isEqualToString:@"Episode"]) {
        AppDelegate *appDelegatE = (AppDelegate*)[UIApplication sharedApplication].delegate;
        appDelegatE.m_mainVc = [[BaseTabbarViewController alloc]init];
        appDelegatE.window.rootViewController = [[BaseTabbarViewController alloc]init];
        [appDelegatE.window makeKeyAndVisible];
        return;
    }
    if ([message.name isEqualToString:@"Phabricator"]) {
        AppDelegate *appDelegatE = (AppDelegate*)[UIApplication sharedApplication].delegate;
        appDelegatE.m_mainVc = [[BaseTabbarViewController alloc]init];
        appDelegatE.m_mainVc.selectedIndex = 2;
        appDelegatE.window.rootViewController = [[BaseTabbarViewController alloc]init];
        [appDelegatE.window makeKeyAndVisible];
        return;
    }
    if ([message.name isEqualToString:@"MediaWiki"]) {
        [self.navigationController popToRootViewControllerAnimated:NO];
        [OSLW_Defaults safe_SetObject:nil forKey:MainToken];
        [OSLW_Defaults synchronize];
        UserLoginViewController *vc = [UserLoginViewController new];
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
        [CommenObject postDataWithStartTime:[CommenObject getTimeStampString] endTime:[CommenObject getTimeStampString] type:@"10" order:str];
        return;
    }

}


@end
