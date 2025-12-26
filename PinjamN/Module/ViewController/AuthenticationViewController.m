//
//  AuthenticationViewController.m
//  PinjamN
//
//  Created by Yu Chen  on 2025/12/27.
//

#import "AuthenticationViewController.h"
#import "AuthenticationInfoConfirmViewController.h"

@interface AuthenticationViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong)UIScrollView   *s_scrollView;
@property (nonatomic, assign)BOOL            s_isCamaraBool;
@property (nonatomic, strong)NSString       *s_typeStr;
@property (nonatomic, strong)NSString       *s_startTimeStr;

@end

@implementation AuthenticationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNaviBarWithTitle:@"Authentication" LeOSLWImage:OSLWImage(@"THblackBackImage") leftTitle:nil rightImage:nil rightTitle:nil delegate:self];
    [self addSubViews];
    self.s_startTimeStr = [CommenObject getTimeStampString];
    
}

- (void)addSubViews
{
    UIButton *titBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, NavBarHeight, kSCREEN_WIDTH - 15, 50)];
    [titBtn setUserInteractionEnabled:NO];
    [titBtn setImage:OSLWImage(@"Detail_up_Image") forState:UIControlStateNormal];
    [titBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [titBtn setTitle:@" Select an id to verify your identity" forState:UIControlStateNormal];
    [titBtn.titleLabel setFont:OSLWMediumFont(16)];
    [titBtn setTitleColor:UIColorFromRGB(MainText3Color) forState:UIControlStateNormal];
    [self.view addSubview:titBtn];
    
    self.s_scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, titBtn.bottom, kSCREEN_WIDTH, kSCREEN_HEIGHT - titBtn.bottom)];
    self.s_scrollView.backgroundColor = [UIColor clearColor];
    self.s_scrollView.showsVerticalScrollIndicator = NO;
    self.s_scrollView.showsHorizontalScrollIndicator = NO;
    self.s_scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    [self.view addSubview:self.s_scrollView];
    
    UIView *blueView = [[UIView alloc]initWithFrame:CGRectMake(15, 0, kSCREEN_WIDTH - 30, 100)];
    blueView.backgroundColor = UIColorFromRGB(0x2FBEA0);
    [blueView roundedRect:20];
    [self.s_scrollView addSubview:blueView];
    
    UILabel *blueTitLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, blueView.width, 48)];
    blueTitLabel.text = @"Recommended lD Type";
    blueTitLabel.font = OSLWMediumFont(16);
    blueTitLabel.textColor = UIColorFromRGB(MainWhiteColor);
    [blueView addSubview:blueTitLabel];
    
    UIImageView *iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(blueView.width - blueTitLabel.height, 0, blueTitLabel.height, blueTitLabel.height)];
    iconImageView.image = OSLWImage(@"Detail_down_Image");
    iconImageView.contentMode = UIViewContentModeCenter;
    [blueView addSubview:iconImageView];
    
    UIView *whiteView = [[UIView alloc]initWithFrame:CGRectMake(0, blueTitLabel.bottom, blueView.width, 100)];
    whiteView.backgroundColor = UIColorFromRGB(MainWhiteColor);
    [whiteView roundedRect:20 borderWidth:1 borderColor:UIColorFromRGB(0x2FBEA0)];
    [blueView addSubview:whiteView];
    
    for (int k = 0; k < self.m_believesArr.count; k++) {
        NSString *str = [self.m_believesArr safe_objectAtIndex:k];
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(15, 52*k, whiteView.width - 30, 52)];
        backView.backgroundColor = UIColorFromRGB(MainWhiteColor);
        [whiteView addSubview:backView];
        WEAK_SELF
        [backView addTapAction:^(UIGestureRecognizer *sender) {
            STRONG_SELF
            [self photoActionWithStr:str];
        }];
        
        UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, backView.height)];
        titLabel.text = str;
        titLabel.textColor = UIColorFromRGB(MainText3Color);
        titLabel.font = OSLWRegularFont(15);
        [backView addSubview:titLabel];
        
        UIImageView *iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(backView.width - 22, 0, 22, backView.height)];
        iconImageView.image = OSLWImage(@"Detail_arrow_Image");
        iconImageView.contentMode = UIViewContentModeCenter;
        [backView addSubview:iconImageView];
        
        UIImageView *lineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, backView.height - 2, backView.width, 2)];
        lineImageView.image = OSLWImage(@"Detail_line_Image");
        [backView addSubview:lineImageView];
        if (k == self.m_believesArr.count - 1) {
            lineImageView.hidden = YES;
            whiteView.height = backView.bottom;
            blueView.height = whiteView.bottom;
            [self addPrequelsWithView:blueView];
        }
    }
}

- (void)addPrequelsWithView:(UIView *)view
{
    UIView *blueView = [[UIView alloc]initWithFrame:CGRectMake(15, view.bottom + 15, kSCREEN_WIDTH - 30, 100)];
    blueView.backgroundColor = UIColorFromRGB(0x2FBEA0);
    [blueView roundedRect:20];
    [self.s_scrollView addSubview:blueView];
    
    UILabel *blueTitLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, blueView.width, 48)];
    blueTitLabel.text = @"Recommended lD Type";
    blueTitLabel.font = OSLWMediumFont(16);
    blueTitLabel.textColor = UIColorFromRGB(MainWhiteColor);
    [blueView addSubview:blueTitLabel];
    
    UIImageView *iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(blueView.width - blueTitLabel.height, 0, blueTitLabel.height, blueTitLabel.height)];
    iconImageView.image = OSLWImage(@"Detail_down_Image");
    iconImageView.contentMode = UIViewContentModeCenter;
    [blueView addSubview:iconImageView];
    
    UIView *whiteView = [[UIView alloc]initWithFrame:CGRectMake(0, blueTitLabel.bottom, blueView.width, 100)];
    whiteView.backgroundColor = UIColorFromRGB(MainWhiteColor);
    [whiteView roundedRect:20 borderWidth:1 borderColor:UIColorFromRGB(0x2FBEA0)];
    [blueView addSubview:whiteView];
    
    for (int k = 0; k < self.m_prequelsArr.count; k++) {
        NSString *str = [self.m_prequelsArr safe_objectAtIndex:k];
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(15, 52*k, whiteView.width - 30, 52)];
        backView.backgroundColor = UIColorFromRGB(MainWhiteColor);
        [whiteView addSubview:backView];
        WEAK_SELF
        [backView addTapAction:^(UIGestureRecognizer *sender) {
            STRONG_SELF
            [self photoActionWithStr:str];
        }];
        
        UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, backView.height)];
        titLabel.text = str;
        titLabel.textColor = UIColorFromRGB(MainText3Color);
        titLabel.font = OSLWRegularFont(15);
        [backView addSubview:titLabel];
        
        UIImageView *iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(backView.width - 22, 0, 22, backView.height)];
        iconImageView.image = OSLWImage(@"Detail_arrow_Image");
        iconImageView.contentMode = UIViewContentModeCenter;
        [backView addSubview:iconImageView];
        
        UIImageView *lineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, backView.height - 2, backView.width, 2)];
        lineImageView.image = OSLWImage(@"Detail_line_Image");
        [backView addSubview:lineImageView];
        if (k == self.m_prequelsArr.count - 1) {
            lineImageView.hidden = YES;
            whiteView.height = backView.bottom;
            blueView.height = whiteView.bottom;
            [self.s_scrollView setContentSize:CGSizeMake(self.s_scrollView.width, blueView.bottom + 15 + XBottomHeight)];
        }
    }
}

- (void)photoActionWithStr:(NSString *)str
{
    [CommenObject postDataWithStartTime:self.s_startTimeStr endTime:[CommenObject getTimeStampString] type:@"2" order:nil];
    self.s_typeStr = str;
    if ([self.m_appliesStr isEqualToString:@"0"]) {
        [self alertSelectAction];
    }else{
        [self openSystemCamera];
    }
}

- (void)alertSelectAction
{
    if (self.blockEventStart) {
        self.blockEventStart();
    }
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *camareAct = [UIAlertAction actionWithTitle:@"Album" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self openSystemAlbum];
    }];
    
    UIAlertAction *cancelAct = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self openSystemCamera];
    }];
    [alertVC addAction:cancelAct];
    [alertVC addAction:camareAct];
    
    UIAlertAction *cancel1Act = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alertVC addAction:cancel1Act];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertVC animated:YES completion:nil];
    });
}

- (void)openSystemCamera
{
    self.s_isCamaraBool = YES;
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {//相机权限
        if (granted) {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                picker.delegate = self;
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                //                picker.mediaTypes = @[(NSString*)kUTTypeImage];
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

- (void)openSystemAlbum
{
    self.s_isCamaraBool = NO;
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        if (status == PHAuthorizationStatusAuthorized) {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                picker.delegate = self;
                picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                //                picker.mediaTypes = @[(NSString*)kUTTypeImage];
                picker.navigationBar.tintColor = [UIColor blackColor];
                picker.navigationBar.barTintColor = [UIColor whiteColor];
                [picker.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
                picker.modalPresentationStyle = UIModalPresentationFullScreen;
                [self presentViewController:picker animated:YES completion:nil];
            });
        }else{
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Enable Photos permission" message:@"In order to select photos, please enable your Photos permission. Steps: Go to Setting -> MabilisPera -> Photos -> Enable All Photos" preferredStyle:UIAlertControllerStyleAlert];
            
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
        [dic safe_setObject:self.s_isCamaraBool ? @"1" : @"2" forKey:@"concepts"];
        [dic safe_setObject:@"11" forKey:@"cooke"];
        [dic safe_setObject:self.s_typeStr forKey:@"offs"];
        [BaseNetRequest uploadImage:img parameters:dic success:^(BaseResponseModel *model) {
            STRONG_SELF
            if (model.success) {
                [SVProgressHUD dismiss];
                AuthenticationInfoConfirmViewController *vc = [AuthenticationInfoConfirmViewController new];
                vc.m_dic = (NSDictionary *)model.data;
                vc.m_typeStr = self.s_typeStr;
                WEAK_SELF
                vc.block = ^{
                    STRONG_SELF
                    if (self.block) {
                        self.block();
                    }
                    [self.navigationController popViewControllerAnimated:NO];
                };
                UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:vc];
                nc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
                [self presentViewController:nc animated:NO completion:nil];
            }else{
                [SVProgressHUD showInfoWithStatus:model.msg];
            }
        } failure:^(NSError *error) {
            [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        }];
    }];
}

@end
