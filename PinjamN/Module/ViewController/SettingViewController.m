//
//  SettingViewController.m
//  PinjamN
//
//  Created by Yu Chen  on 2025/12/26.
//

#import "SettingViewController.h"
#import "UserSignOutViewController.h"
#import "UserCancelViewController.h"
@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNaviBarWithTitle:@"Set up" LeOSLWImage:OSLWImage(@"THblackBackImage") leftTitle:nil rightImage:nil rightTitle:nil delegate:self];
    [self addSubViews];
    
}

- (void)addSubViews
{
    UIImageView *iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake((kSCREEN_WIDTH - 61)/2, NavBarHeight + 40, 61, 61)];
    iconImageView.image = OSLWImage(@"logoImage");
    [iconImageView roundedRect:14];
    [self.view addSubview:iconImageView];
    
    UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, iconImageView.bottom + 13, kSCREEN_WIDTH, 22)];
    titLabel.text = @"MabilisPera";
    titLabel.textColor = UIColorFromRGB(MainText3Color);
    titLabel.textAlignment = NSTextAlignmentCenter;
    titLabel.font = OSLWMediumFont(16);
    [self.view addSubview:titLabel];
    
    UIView *versionView = [[UIView alloc]initWithFrame:CGRectMake(16, titLabel.bottom + 18, kSCREEN_WIDTH - 32, 52)];
    versionView.backgroundColor = UIColorFromRGB(0xE2FDF1);
    [versionView roundedRect:20];
    [self.view addSubview:versionView];
    
    UILabel *versionTitLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, kSCREEN_WIDTH, versionView.height)];
    versionTitLabel.text = @"Version";
    versionTitLabel.textColor = UIColorFromRGB(0x006D54);
    versionTitLabel.font = OSLWRegularFont(16);
    [versionView addSubview:versionTitLabel];
    
    UILabel *versionLabel = [[UILabel alloc]initWithFrame:CGRectMake(versionView.width - 115, 0, 100, versionView.height)];
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = [infoDic stringForKey:@"CFBundleShortVersionString"];
    versionLabel.text = [NSString stringWithFormat:@"V%@",currentVersion];
    versionLabel.textColor = UIColorFromRGB(0x006D54);
    versionLabel.font = OSLWRegularFont(16);
    versionLabel.textAlignment = NSTextAlignmentRight;
    [versionView addSubview:versionLabel];
    
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(15, versionView.bottom + 15, kSCREEN_WIDTH - 30, 340)];
    bottomView.backgroundColor = UIColorFromRGB(MainWhiteColor);
    [bottomView roundedRect:20 borderWidth:1 borderColor:UIColorFromRGB(0x0BB0A6)];
    [self.view addSubview:bottomView];
    
    NSArray *bottomTitArr = [NSArray arrayWithObjects:@"Account cancellation",@"Sign out", nil];
    for (int k = 0; k < bottomTitArr.count; k++) {
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 66*k, bottomView.width, 66)];
        WEAK_SELF
        [backView addTapAction:^(UIGestureRecognizer *sender) {
            STRONG_SELF
            if (k == 0) {
                [self accountCancellation];
            }else{
                [self signOut];
            }
        }];
        [bottomView addSubview:backView];
        NSString *str = [bottomTitArr safe_objectAtIndex:k];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, (backView.height - 41)/2, 41, 41)];
        imageView.image = OSLWImage(str);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [backView addSubview:imageView];
        
        UILabel *infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(imageView.right + 15, imageView.top, backView.width, imageView.height)];
        infoLabel.text = str;
        infoLabel.textColor = UIColorFromRGB(MainText3Color);
        infoLabel.font = OSLWRegularFont(14);
        [backView addSubview:infoLabel];
        
        if (k == bottomTitArr.count - 1) {
            bottomView.height = backView.bottom;
        }
    }
}

- (void)signOut
{
    UserSignOutViewController *vc = [UserSignOutViewController new];
    UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:vc];
    nc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:nc animated:NO completion:nil];
}

- (void)accountCancellation
{
    UserCancelViewController *vc = [UserCancelViewController new];
    UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:vc];
    nc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:nc animated:NO completion:nil];
}

@end
