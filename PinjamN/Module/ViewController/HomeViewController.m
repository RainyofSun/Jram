//
//  HomeViewController.m
//  PinjamN
//
//  Created by Yu Chen  on 2025/12/26.
//

#import "HomeViewController.h"
#import "ChanPinViewController.h"
#import "SettingViewController.h"
#import "UserLoginViewController.h"

@interface HomeViewController ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong)UIScrollView   *s_scrollView;
@property (nonatomic, assign)BOOL   s_isSmallBool;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[OSLW_Defaults stringForKey:MainLeft] isEqualToString:@"2"] && (![CLLocationManager locationServicesEnabled])) {
        [self showLocationAlert];
    }
}

- (void)showLocationAlert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Location Permission Required" message:@"This app requires location access to function properly. Please enable location services in Settings." preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *settingsAction = [UIAlertAction actionWithTitle:@"Go to Settings" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        }
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:settingsAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self aboutcollapse];
    [self aboutgently];

    [CommenObject postData];
}

- (void)aboutgently
{
    [BaseNetRequest getWithURLServiceString:aboutgently parameters:nil success:^(BaseResponseModel *model) {
        if (model.success) {
            NSDictionary *dic = (NSDictionary *)model.data;
            [OSLW_Defaults safe_SetObject:[dic arrayForKey:@"alicent"] forKey:MainCity];
            [OSLW_Defaults synchronize];
        }
    } failure:nil];
}

- (void)pushActionWithUrl:(NSString *)str
{
    if (![OSLW_Defaults stringForKey:MainToken]) {
        UserLoginViewController *vc = [UserLoginViewController new];
        WEAK_SELF
        vc.block = ^{
            STRONG_SELF
            [self viewWillAppear:YES];
        };
        UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:vc];
        nc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:nc animated:YES completion:nil];
        return;
    }
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
        
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)aboutcollapse
{
    WEAK_SELF
    [BaseNetRequest getWithURLServiceString:aboutcollapse parameters:nil success:^(BaseResponseModel *model) {
        [SVProgressHUD dismiss];
        STRONG_SELF
        [self.s_scrollView.mj_header endRefreshing];
        if(model.success){
            NSDictionary *dic = (NSDictionary *)model.data;
            [self resetSubViewsWith:dic];
        }
    } failure:^(NSError *error) {
        STRONG_SELF
        [self.s_scrollView.mj_header endRefreshing];
        self.s_scrollView.contentOffset = CGPointZero;
    }];
}

- (void)resetSubViewsWith:(NSDictionary *)dic
{
    [self.s_scrollView removeFromSuperview];
    self.s_scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, kSCREEN_HEIGHT - TabBarHeight)];
    self.s_scrollView.backgroundColor = [UIColor clearColor];
    self.s_scrollView.showsVerticalScrollIndicator = NO;
    self.s_scrollView.showsHorizontalScrollIndicator = NO;
    self.s_scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    [self.view addSubview:self.s_scrollView];
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    header.stateLabel.hidden = YES;
    header.lastUpdatedTimeLabel.hidden = YES;
    self.s_scrollView.mj_header = header;
    
    UIImageView *topImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 300)];
    topImageView.image = OSLWImage(@"HomePage_top_large_back_Image");
    topImageView.contentMode = UIViewContentModeScaleAspectFill;
    [topImageView roundedRect:0];
    [self.s_scrollView addSubview:topImageView];
    
    UIImageView *cardImageView = [[UIImageView alloc]initWithFrame:CGRectMake((kSCREEN_WIDTH - 343)/2, topImageView.bottom, 343, 174)];
    cardImageView.image = OSLWImage(@"HomePage_top_backLarge_Image");
    [self.s_scrollView addSubview:cardImageView];

    UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(16, 20, cardImageView.width, 20)];
    titLabel.text = @"Loan amount";
    titLabel.textColor = UIColorFromRGB(0x2A3E40);
    titLabel.font = OSLWBoldFont(14);
    [cardImageView addSubview:titLabel];
    
    UILabel *priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(22, titLabel.bottom + 5, titLabel.width, 42)];
    priceLabel.textColor = UIColorFromRGB(0x2A3E40);
    priceLabel.font = OSLWBoldFont(28);
    [cardImageView addSubview:priceLabel];
        
    UILabel *leftTitLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, priceLabel.bottom + 18, cardImageView.width/2, 12)];
    leftTitLabel.textColor = UIColorFromRGB(0x60827B);
    leftTitLabel.font = OSLWRegularFont(12);
    leftTitLabel.textAlignment = NSTextAlignmentCenter;
    [cardImageView addSubview:leftTitLabel];
    
    UILabel *leftValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, leftTitLabel.bottom + 6, cardImageView.width/2, 16)];
    leftValueLabel.textColor = UIColorFromRGB(0x41574F);
    leftValueLabel.font = OSLWMediumFont(12);
    leftValueLabel.textAlignment = NSTextAlignmentCenter;
    [cardImageView addSubview:leftValueLabel];
    
    UILabel *rightValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(leftValueLabel.right , leftValueLabel.top, leftValueLabel.width, leftValueLabel.height)];
    rightValueLabel.textColor = leftValueLabel.textColor;
    rightValueLabel.font = leftValueLabel.font;
    rightValueLabel.textAlignment = NSTextAlignmentCenter;
    [cardImageView addSubview:rightValueLabel];
    
    UILabel *rightTitLabel = [[UILabel alloc]initWithFrame:CGRectMake(leftTitLabel.right, leftTitLabel.top, leftTitLabel.width, leftTitLabel.height)];
    rightTitLabel.textColor = leftTitLabel.textColor;
    rightTitLabel.font = leftTitLabel.font;
    rightTitLabel.textAlignment = NSTextAlignmentCenter;
    [cardImageView addSubview:rightTitLabel];
    
    UIButton *topBtn = [UIButton new];
    [topBtn setBackgroundImage:OSLWImage(@"login_btn_back_Image") forState:UIControlStateNormal];
    [topBtn.titleLabel setFont:OSLWBoldFont(18)];
    [topBtn setTitleColor:UIColorFromRGB(0xD8FB50) forState:UIControlStateNormal];
    [self.s_scrollView addSubview:topBtn];
    [topBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(236);
        make.height.mas_equalTo(54);
        make.centerX.equalTo(cardImageView);
        make.top.equalTo(cardImageView.mas_bottom).offset(-25);
    }];
    
    NSArray *alicentArr = [dic arrayForKey:@"abe"];
    NSArray *topLargeArr;
    NSArray *topSmallArr;
    NSArray *productListArr;
    for (int k = 0; k < alicentArr.count; k++) {
        NSDictionary *subDic = [alicentArr safe_objectAtIndex:k];
        if ([[subDic stringForKey:@"bother"] isEqualToString:@"cheapb"]) {
            topLargeArr = [subDic arrayForKey:@"lincoln"];
            self.s_isSmallBool = NO;
        }

        if ([[subDic stringForKey:@"bother"] isEqualToString:@"cheapc"]) {
            topSmallArr = [subDic arrayForKey:@"lincoln"];
            self.s_isSmallBool = YES;
        }
        
        if ([[subDic stringForKey:@"bother"] isEqualToString:@"cheapd"]) {
            productListArr = [subDic arrayForKey:@"lincoln"];
        }
    }

    if (topLargeArr.count > 0) {
        NSDictionary *subDic = [topLargeArr safe_objectAtIndex:0];
        priceLabel.text = [subDic stringForKey:@"gotten"];
        [topBtn setTitle:[subDic stringForKey:@"treatment"] forState:UIControlStateNormal];
        leftTitLabel.text = [subDic stringForKey:@"wash"];
        leftValueLabel.text = [subDic stringForKey:@"electric"];
        rightValueLabel.text = [subDic stringForKey:@"placards"];
        rightTitLabel.text = [subDic stringForKey:@"carrying"];
        
        UIImageView *leOSLWImageView = [[UIImageView alloc]initWithFrame:CGRectMake((kSCREEN_WIDTH - 164 - 164 - 15)/2, cardImageView.bottom + 45, 164, 80)];
        leOSLWImageView.image = OSLWImage(@"HomePage_top_left_product_Image");
        [self.s_scrollView addSubview:leOSLWImageView];
        
        UIImageView *rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(leOSLWImageView.right + 15, leOSLWImageView.top, 164, 80)];
        rightImageView.image = OSLWImage(@"HomePage_top_right_product_Image");
        [self.s_scrollView addSubview:rightImageView];
        
        UIImageView *image1 = [[UIImageView alloc]initWithFrame:CGRectMake((kSCREEN_WIDTH - 343)/2, leOSLWImageView.bottom + 15, 343, 234)];
        image1.image = OSLWImage(@"HomePage_Image1");
        [self.s_scrollView addSubview:image1];

        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake((kSCREEN_WIDTH - 343)/2, image1.bottom + 15, 343, 200)];
        image.image = OSLWImage(@"HomePage_Image");
        [self.s_scrollView addSubview:image];
        
        [self.s_scrollView addSubview:image];
        if (image.bottom > self.s_scrollView.height) {
            [self.s_scrollView setContentSize:CGSizeMake(self.s_scrollView.width, image.bottom + 15)];
        }else{
            [self.s_scrollView setContentSize:CGSizeMake(self.s_scrollView.width, self.s_scrollView.height + 1)];
        }
        [cardImageView addTapAction:^(UIGestureRecognizer *sender) {
            [self aboutlawrencenovember:[subDic stringForKey:@"dismissed"]];
        }];
        [topBtn addTapAction:^(UIGestureRecognizer *sender) {
            [self aboutlawrencenovember:[subDic stringForKey:@"dismissed"]];
        }];
    }else if (topSmallArr.count > 0){
        topImageView.height = 262;
        topImageView.image = OSLWImage(@"HomePage_top_small_back_Image");
        cardImageView.top = topImageView.bottom - 70;
        NSDictionary *subDic = [topSmallArr safe_objectAtIndex:0];
        priceLabel.text = [subDic stringForKey:@"gotten"];
        [topBtn setTitle:[subDic stringForKey:@"treatment"] forState:UIControlStateNormal];
        leftValueLabel.text = [subDic stringForKey:@"electric"];
        leftTitLabel.text = [subDic stringForKey:@"wash"];
        rightTitLabel.text = [subDic stringForKey:@"carrying"];
        rightValueLabel.text = [subDic stringForKey:@"placards"];

//        if (productListArr.count > 0) {
//            UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(topImageView.left, top + 15, 200, 22)];
//            titLabel.text = @"Hot Recommendations";
//            titLabel.textColor = UIColorFromRGB(MainText3Color);
//            titLabel.font = OSLWMediumFont(16);
//            [self.s_scrollView addSubview:titLabel];
//            top = titLabel.bottom;
//            for (int k = 0; k < productListArr.count; k++) {
//                NSDictionary *ssubdic = [productListArr safe_objectAtIndex:k];
//                UIImageView *backView = [[UIImageView alloc]initWithFrame:CGRectMake(topImageView.left - 5, top + 10, topImageView.width + 10, 140)];
//                backView.image = OSLWImage(@"HomePage_back_Image");
//                [self.s_scrollView addSubview:backView];
//                top = backView.bottom;
//                WEAK_SELF
//                [backView addTapAction:^(UIGestureRecognizer *sender) {
//                    STRONG_SELF
//                    [self aboutlawrencenovember:[ssubdic stringForKey:@"dismissed"]];
//                }];
//
//                UIImageView *productIconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(17, 17, 36, 36)];
//                [productIconImageView roundedRect:8];
//                [backView addSubview:productIconImageView];
//                [productIconImageView sd_setImageWithURL:[NSURL URLWithString:[ssubdic stringForKey:@"latter"]] placeholderImage:OSLWImage(@"logoImage")];
//
//                UILabel *productTitLabel = [[UILabel alloc]initWithFrame:CGRectMake(productIconImageView.right + 8, productIconImageView.top, 200, productIconImageView.height)];
//                productTitLabel.textColor = UIColorFromRGB(MainText3Color);
//                productTitLabel.font = OSLWMediumFont(14);
//                [backView addSubview:productTitLabel];
//                productTitLabel.text = [ssubdic stringForKey:@"begun"];
//
//                UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(backView.width - 120, productIconImageView.top, 103, productIconImageView.height)];
//                [btn setUserInteractionEnabled:NO];
//                [btn roundedRect:12];
//                [btn setBackgroundColor:UIColorFromRGB(0x15A77E)];
//                [btn.titleLabel setFont:OSLWBoldFont(16)];
//                [backView addSubview:btn];
//                [btn setTitle:[ssubdic stringForKey:@"gerardis"] forState:UIControlStateNormal];
//
//                NSArray *titArr = [NSArray arrayWithObjects:@"Loan Amount",@"Loan Time",@"Interest Term", nil];
//                for (int m = 0; m < titArr.count; m++) {
//                    UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(backView.width*m/3, 80, backView.width/3, 17)];
//                    titLabel.textAlignment = NSTextAlignmentCenter;
//                    titLabel.font = OSLWRegularFont(12);
//                    titLabel.textColor = UIColorFromRGB(0x555555);
//                    titLabel.text = [titArr safe_objectAtIndex:m];
//                    [backView addSubview:titLabel];
//
//                    UILabel *valueLabel = [[UILabel alloc]initWithFrame:CGRectMake(titLabel.left, titLabel.bottom + 3, titLabel.width, 22)];
//                    valueLabel.textAlignment = NSTextAlignmentCenter;
//                    valueLabel.font = OSLWMediumFont(16);
//                    valueLabel.textColor = UIColorFromRGB(MainText3Color);
//                    [backView addSubview:valueLabel];
//                    if (m == 0) {
//                        valueLabel.textColor = UIColorFromRGB(0x006D54);
//                        valueLabel.text = [ssubdic stringForKey:@"vince"];
//                    }else if (m == 1){
//                        valueLabel.text = [ssubdic stringForKey:@"close"];
//                    }else if (m == 2){
//                        valueLabel.text = [ssubdic stringForKey:@"sheila"];
//                    }
//                }
//            }
//        }
//
//        if (top > self.s_scrollView.height) {
//            [self.s_scrollView setContentSize:CGSizeMake(self.s_scrollView.width, top + 10)];
//        }else{
//            [self.s_scrollView setContentSize:CGSizeMake(self.s_scrollView.width, self.s_scrollView.height + 1)];
//        }
        [cardImageView addTapAction:^(UIGestureRecognizer *sender) {
            [self aboutlawrencenovember:[subDic stringForKey:@"dismissed"]];
        }];
        [topBtn addTapAction:^(UIGestureRecognizer *sender) {
            [self aboutlawrencenovember:[subDic stringForKey:@"dismissed"]];
        }];
    }
}

- (void)aboutlawrencenovember:(NSString *)productIdStr
{
    if (![OSLW_Defaults stringForKey:MainToken]) {
        UserLoginViewController *vc = [UserLoginViewController new];
        WEAK_SELF
        vc.block = ^{
            STRONG_SELF
            [self viewWillAppear:YES];
        };
        UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:vc];
        nc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:nc animated:YES completion:nil];
        return;
    }
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic safe_setObject:productIdStr forKey:@"classes"];
    [SVProgressHUD show];
    [BaseNetRequest postWithURLServiceString:aboutlawrencenovember parameters:dic success:^(BaseResponseModel *model) {
        if (model.success) {
            NSDictionary *dic = (NSDictionary *)model.data;
            NSString *str = [dic stringForKey:@"bribe"];
            [CommenObject pushActionWithUrlStr:str];
        }else{
        }
    } failure:^(NSError *error) {
    }];
    
}

- (void)loadNewData
{
    [self viewWillAppear:YES];
}

@end
