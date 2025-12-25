//
//  FTPublicVC.m
//  project
//
//  Created by 周群 on 2024/8/4.
//

#import "FTPublicVC.h"
#import "FTPublicTipVC.h"
#import "FTAuthenticationMethodVC.h"

@interface FTPublicVC ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong)UIImageView *s_upImageView;
@property (nonatomic, strong)UIImageView *s_downImageView;
@property (nonatomic, strong)UIButton    *s_upBtn;
@property (nonatomic, strong)UIButton    *s_downBtn;
@property (nonatomic, strong)UIButton    *s_nextBtn;
@property (nonatomic, strong)UIView      *s_upView;
@property (nonatomic, strong)UIView      *s_downView;
@property (nonatomic, strong)NSString    *s_appliesStr;
@property (nonatomic, strong)NSArray     *s_believesArr;
@property (nonatomic, strong)NSArray     *s_prequelsArr;
@property (nonatomic, strong)NSString    *s_startTimeStr;

@end

@implementation FTPublicVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNaviBarWithTitle:@"Identity information" LeftImage:FTImage(@"THblackBackImage") leftTitle:nil rightImage:nil rightTitle:nil delegate:self];
    [self addSubViews];
    [self snowssonoya];

}

- (void)snowssonoya
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic safe_setObject:self.m_productIdStr forKey:@"velaryon"];
    WEAK_SELF
    [FTNetting postWithURLServiceString:snowssonoya parameters:dic success:^(FTResponseModel *model) {
        STRONG_SELF
        if (model.success) {
            NSDictionary *dic = (NSDictionary *)model.data;
            NSDictionary *senseDic = [dic dictionaryForKey:@"sense"];
            self.s_upBtn.enabled = ![senseDic boolForKey:@"closer"];
            [self.s_upView setUserInteractionEnabled:![senseDic stringForKey:@"castings"].hasTextContent];
            if ([senseDic stringForKey:@"castings"]) {
                [self.s_upImageView sd_setImageWithURL:[NSURL URLWithString:[senseDic stringForKey:@"castings"]] placeholderImage:FTImage(@"Detail_up_place_Image")];
            }
            NSDictionary *betterDic = [dic dictionaryForKey:@"better"];
            self.s_downBtn.enabled = ![betterDic boolForKey:@"closer"];
            [self.s_downView setUserInteractionEnabled:![betterDic stringForKey:@"castings"].hasTextContent];
            if ([betterDic stringForKey:@"castings"]) {
                [self.s_downImageView sd_setImageWithURL:[NSURL URLWithString:[betterDic stringForKey:@"castings"]] placeholderImage:FTImage(@"Detail_down_place_Image")];
            }
            self.s_appliesStr = [dic stringForKey:@"applies"];
            self.s_believesArr = [dic arrayForKey:@"believes"];
            self.s_prequelsArr = [dic arrayForKey:@"prequels"];
        }else{
            [SVProgressHUD showInfoWithStatus:model.msg];
        }
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];
}

- (void)addSubViews
{
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, NavBarHeight, kSCREEN_WIDTH, 48)];
    topView.backgroundColor = [UIColorFromRGB(0xFFF9E3) colorWithAlphaComponent:0.74];
    [self.view addSubview:topView];
    
    UIImageView *iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, topView.height, topView.height)];
    iconImageView.image = FTImage(@"Detail_tip_place_Image");
    iconImageView.contentMode = UIViewContentModeCenter;
    [topView addSubview:iconImageView];
    
    UILabel *infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(iconImageView.right, 0, topView.width - iconImageView.right - 10, topView.height)];
    infoLabel.text = @"Please fill in your personal data (don't worry, your information and data are protected)";
    infoLabel.numberOfLines = 0;
    infoLabel.font = FTRegularFont(12);
    infoLabel.textColor = UIColorFromRGB(0xE18701);
    [topView addSubview:infoLabel];
    
    self.s_upView = [[UIView alloc]initWithFrame:CGRectMake(15, topView.bottom + 15, kSCREEN_WIDTH - 30, 247)];
    self.s_upView.backgroundColor = UIColorFromRGB(0xE2FDF1);
    [self.s_upView setUserInteractionEnabled:NO];
    [self.s_upView roundedRect:20];
    [self.view addSubview:self.s_upView];
    
    self.s_upImageView = [[UIImageView alloc]initWithFrame:CGRectMake((self.s_upView.width - 311)/2, 20, 311, 172)];
    self.s_upImageView.image = FTImage(@"Detail_up_place_Image");
    self.s_upImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.s_upView addSubview:self.s_upImageView];
    
    self.s_upBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, self.s_upImageView.bottom, self.s_upView.width, self.s_upView.height - self.s_upImageView.bottom)];
    [self.s_upBtn setImage:FTImage(@"Detail_add_place_Image") forState:UIControlStateNormal];
    [self.s_upBtn setTitle:@"Front of ID photo" forState:UIControlStateNormal];
    [self.s_upBtn setTitleColor:UIColorFromRGB(MainText3Color) forState:UIControlStateNormal];
    [self.s_upBtn.titleLabel setFont:FTMediumFont(16)];
    [self.s_upBtn setSemanticContentAttribute:UISemanticContentAttributeForceRightToLeft];
    self.s_upBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [self.s_upBtn setUserInteractionEnabled:NO];
    [self.s_upView addSubview:self.s_upBtn];
    
    self.s_downView = [[UIView alloc]initWithFrame:CGRectMake(15, self.s_upView.bottom + 15, kSCREEN_WIDTH - 30, 203)];
    self.s_downView.backgroundColor = UIColorFromRGB(0xE2FDF1);
    [self.s_downView roundedRect:20];
    [self.s_downView setUserInteractionEnabled:NO];
    [self.view addSubview:self.s_downView];
    
    self.s_downImageView = [[UIImageView alloc]initWithFrame:CGRectMake((self.s_downView.width - 177)/2, 20, 177, 129)];
    self.s_downImageView.image = FTImage(@"Detail_down_place_Image");
    self.s_downImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.s_downView addSubview:self.s_downImageView];
    self.s_downBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, self.s_downImageView.bottom, self.s_downView.width, self.s_downView.height - self.s_downImageView.bottom)];
    [self.s_downBtn setImage:FTImage(@"Detail_add_place_Image") forState:UIControlStateNormal];
    [self.s_downBtn setTitle:@"Face recognition" forState:UIControlStateNormal];
    [self.s_downBtn setTitleColor:UIColorFromRGB(MainText3Color) forState:UIControlStateNormal];
    [self.s_downBtn.titleLabel setFont:FTMediumFont(16)];
    [self.s_downBtn setSemanticContentAttribute:UISemanticContentAttributeForceRightToLeft];
    self.s_downBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [self.s_downBtn setUserInteractionEnabled:NO];
    [self.s_downView addSubview:self.s_downBtn];
    
    self.s_nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(50, kSCREEN_HEIGHT - XBottomHeight - 50 - 16, kSCREEN_WIDTH - 100, 51)];
    [self.s_nextBtn setTitle:@"Next" forState:UIControlStateNormal];
    [self.s_nextBtn.titleLabel setFont:FTBoldFont(20)];
    [self.s_nextBtn roundedRect:self.s_nextBtn.height/2];
    [self.s_nextBtn setBackgroundColor:UIColorFromRGB(0x49C9A5)];
    [self.s_nextBtn addTarget:self action:@selector(nextBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.s_nextBtn];
    
    WEAK_SELF
    [self.s_upView addTapAction:^(UIGestureRecognizer *sender) {
        STRONG_SELF
        [self nextBtnAction];
    }];
    
    [self.s_downView addTapAction:^(UIGestureRecognizer *sender) {
        STRONG_SELF
        [self nextBtnAction];
    }];
    
}

- (void)nextBtnAction
{
    if (self.s_upView.userInteractionEnabled) {
        FTPublicTipVC *vc = [FTPublicTipVC new];
        vc.m_isCardBool = YES;
        WEAK_SELF
        vc.block = ^{
            STRONG_SELF
            FTAuthenticationMethodVC *vc = [FTAuthenticationMethodVC new];
            vc.m_appliesStr = self.s_appliesStr;
            vc.m_believesArr = self.s_believesArr;
            vc.m_prequelsArr = self.s_prequelsArr;
            WEAK_SELF
            vc.blockEventStart = ^{
                self.s_startTimeStr = [FTCommonObject getTimeStampString];
            };
            vc.block = ^{
                STRONG_SELF
                [FTCommonObject postDataWithStartTime:self.s_startTimeStr endTime:[FTCommonObject getTimeStampString] type:@"3" order:nil];
                [self snowssonoya];
            };
            [self.navigationController pushViewController:vc animated:YES];
        };
        UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:vc];
        nc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        [self presentViewController:nc animated:NO completion:nil];
        return;
    }
    if (self.s_downView.userInteractionEnabled) {
        self.s_startTimeStr = [FTCommonObject getTimeStampString];
        FTPublicTipVC *vc = [FTPublicTipVC new];
        WEAK_SELF
        vc.block = ^{
            STRONG_SELF
            [self openSystemCamera];
        };
        UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:vc];
        nc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        [self presentViewController:nc animated:NO completion:nil];
        
        return;
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)openSystemCamera
{
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {//相机权限
        if (granted) {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                picker.delegate = self;
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
                picker.modalPresentationStyle = UIModalPresentationFullScreen;
                [self presentViewController:picker animated:YES completion:nil];
            });
        }else{
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Enable Camera permission" message:@"In order to take photos, please enable your Camera permission. Steps: Go to Setting -> MabilisPera -> Enable Camera" preferredStyle:UIAlertControllerStyleActionSheet];
            
            UIAlertAction *cancelAct = [UIAlertAction actionWithTitle:@"Not now" style:UIAlertActionStyleCancel handler:nil];
            [alertVC addAction:cancelAct];
            
            UIAlertAction *camareAct = [UIAlertAction actionWithTitle:@"Open Settings" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[UIApplication sharedApplication] openURL:[[NSURL alloc] initWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
            }];
            [alertVC addAction:camareAct];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController:alertVC animated:YES completion:nil];
            });
        }
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    WEAK_SELF
    [picker dismissViewControllerAnimated:YES completion:^{
        STRONG_SELF
        WEAK_SELF
        [SVProgressHUD show];
        UIImage *img = (UIImage *)info[@"UIImagePickerControllerOriginalImage"];
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic safe_setObject:@"1" forKey:@"concepts"];
        [dic safe_setObject:@"10" forKey:@"cooke"];
        [FTNetting uploadImage:img parameters:dic success:^(FTResponseModel *model) {
            STRONG_SELF
            if (model.success) {
                    [FTCommonObject postDataWithStartTime:self.s_startTimeStr endTime:[FTCommonObject getTimeStampString] type:@"4" order:nil];
                [SVProgressHUD dismiss];
                [self snowssonoya];
            }else{
                [SVProgressHUD showInfoWithStatus:model.msg];
            }
        } failure:^(NSError *error) {
            [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        }];
    }];
}



/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
