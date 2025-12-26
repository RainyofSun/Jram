//
//  MineViewController.m
//  PinjamN
//
//  Created by Yu Chen  on 2025/12/26.
//

#import "MineViewController.h"

@interface MineViewController ()
@property (nonatomic, strong)UIScrollView   *s_scrollView;

@property (nonatomic, strong)UIImageView *s_headImageView;
@property (nonatomic, strong)UILabel     *s_idLabel;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubViews];
    [self snowsarcy];
    
}

- (void)snowsarcy
{
    WEAK_SELF
    [BaseNetRequest getWithURLServiceString:snowsarcy parameters:nil success:^(BaseResponseModel *model) {
        STRONG_SELF
        if (model.success) {
            NSDictionary *dic = model.data;
            NSDictionary *userInfoDic = [dic dictionaryForKey:@"userInfo"];
            [self.s_headImageView sd_setImageWithURL:[NSURL URLWithString:[userInfoDic stringForKey:@"occurring"]] placeholderImage:OSLWImage(@"Center_head_Image")];
            self.s_idLabel.text = [userInfoDic stringForKey:@"userphone"];
            [self addSubViewWithArr:[dic arrayForKey:@"alicent"]];
        }
    } failure:nil];
}

- (void)addSubViews
{
    UIImageView *backImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    backImageView.image = OSLWImage(@"Center_back_Image");
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:backImageView];
    
    self.s_scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, StatusbarHeight, kSCREEN_WIDTH, kSCREEN_HEIGHT - TabBarHeight - StatusbarHeight)];
    self.s_scrollView.backgroundColor = [UIColor clearColor];
    self.s_scrollView.showsVerticalScrollIndicator = NO;
    self.s_scrollView.showsHorizontalScrollIndicator = NO;
    self.s_scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    [self.view addSubview:self.s_scrollView];
    
    UIImageView *topView = [[UIImageView alloc]initWithFrame:CGRectMake((kSCREEN_WIDTH - 343)/2, 60, 343, 229)];
    [topView setUserInteractionEnabled:YES];
    topView.image = OSLWImage(@"Center_top_Image");
    [self.s_scrollView addSubview:topView];
    
    self.s_headImageView = [[UIImageView alloc]initWithFrame:CGRectMake((kSCREEN_WIDTH - 60)/2, topView.top - 40, 60, 60)];
    self.s_headImageView.image = OSLWImage(@"Center_head_Image");
    [self.s_headImageView roundedRect:self.s_headImageView.height/2];
    self.s_headImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.s_scrollView addSubview:self.s_headImageView];
    
    self.s_idLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 32, topView.width, 23)];
    self.s_idLabel.textColor = UIColorFromRGB(MainText3Color);
    self.s_idLabel.textAlignment = NSTextAlignmentCenter;
    self.s_idLabel.font = OSLWBoldFont(20);
    [topView addSubview:self.s_idLabel];
    
    UILabel *infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.s_idLabel.bottom + 5, topView.width, 21)];
    infoLabel.text = @"Welcome To MabilisPera";
    infoLabel.textColor = UIColorFromRGB(MainText3Color);
    infoLabel.textAlignment = NSTextAlignmentCenter;
    infoLabel.font = OSLWRegularFont(15);
    [topView addSubview:infoLabel];
    
    NSArray *titArr = [NSArray arrayWithObjects:@"Apply",@"Repayment",@"Finished", nil];
    CGFloat x = 15;
    for (int k = 0; k < titArr.count; k++) {
        NSString *str = [titArr safe_objectAtIndex:k];
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(x, 140, (topView.width - 30)/3, 88)];
        [topView addSubview:backView];
        [backView addTapAction:^(UIGestureRecognizer *sender) {
            NSMutableDictionary *dic = [NSMutableDictionary dictionary];
            [dic safe_setObject:@(k) forKey:@"index"];
            [FT_Notification postNotificationName:MainIndex object:dic];
        }];
        x = backView.right;
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((backView.width - 46)/2, 0, 46, 46)];
        imageView.image = OSLWImage(str);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [backView addSubview:imageView];
        
        UILabel *infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, imageView.bottom + 7, backView.width, 20)];
        infoLabel.text = str;
        infoLabel.textColor = UIColorFromRGB(MainText3Color);
        infoLabel.textAlignment = NSTextAlignmentCenter;
        infoLabel.font = OSLWRegularFont(14);
        [backView addSubview:infoLabel];
    }
}

- (void)addSubViewWithArr:(NSArray *)arr
{
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake((kSCREEN_WIDTH - 343)/2, 305, 343, 340)];
    bottomView.backgroundColor = UIColorFromRGB(MainWhiteColor);
    [bottomView roundedRect:20 borderWidth:1 borderColor:UIColorFromRGB(0x0BB0A6)];
    [self.s_scrollView addSubview:bottomView];
    
    for (int k = 0; k < arr.count; k++) {
        NSDictionary *dic = [arr safe_objectAtIndex:k];
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 66*k, bottomView.width, 66)];
        [backView addTapAction:^(UIGestureRecognizer *sender) {
            NSString *str = [dic stringForKey:@"castings"];
            if ([str containsString:@"http"]) {
                WebViewViewController *vc = [WebViewViewController new];
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
                [CommenObject loginAction];
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
                    WebViewViewController *vc = [WebViewViewController new];
                    vc.m_urlStr = str;
                    [self.navigationController pushViewController:vc animated:YES];
                };
            }
        }];
        [bottomView addSubview:backView];
        NSString *str = [dic stringForKey:@"ackie"];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, (backView.height - 41)/2, 41, 41)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [imageView sd_setImageWithURL:[NSURL URLWithString:[dic stringForKey:@"smith"]] placeholderImage:OSLWImage(@"Detail_icon_Image1")];
        [backView addSubview:imageView];
        
        UILabel *infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(imageView.right + 15, imageView.top, backView.width, imageView.height)];
        infoLabel.text = str;
        infoLabel.textColor = UIColorFromRGB(MainText3Color);
        infoLabel.font = OSLWRegularFont(14);
        [backView addSubview:infoLabel];
        
        if (k == arr.count - 1) {
            bottomView.height = backView.bottom;
        }
    }
    
    if (bottomView.bottom > self.s_scrollView.height) {
        [self.s_scrollView setContentSize:CGSizeMake(self.s_scrollView.width, bottomView.bottom + 15)];
    }else{
        [self.s_scrollView setContentSize:CGSizeMake(self.s_scrollView.width, self.s_scrollView.height + 1)];
    }
}

@end
