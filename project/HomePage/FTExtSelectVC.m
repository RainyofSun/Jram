//
//  FTExtSelectVC.m
//  project
//
//  Created by 周群 on 2024/8/10.
//

#import "FTExtSelectVC.h"

@interface FTExtSelectVC ()<UIPickerViewDelegate,UIPickerViewDataSource,UIGestureRecognizerDelegate>
@property (nonatomic, strong)UIPickerView   *s_pickerView;
@property (nonatomic, strong)NSDictionary   *s_dic;

@end

@implementation FTExtSelectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColorFromRGB(MainText0Color) colorWithAlphaComponent:0.5];
    
    UIImageView *centerImageView = [[UIImageView alloc]initWithFrame:CGRectMake((kSCREEN_WIDTH - 335)/2, (kSCREEN_HEIGHT - 371)/2 - 20, 335, 371)];
    centerImageView.image = FTImage(@"Detail_seletct_Image");
    [centerImageView setUserInteractionEnabled:YES];
    [self.view addSubview:centerImageView];
    
    UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, centerImageView.width, 25)];
    titLabel.text = self.m_titStr;
    titLabel.textAlignment = NSTextAlignmentCenter;
    titLabel.font = FTBoldFont(18);
    titLabel.textColor = UIColorFromRGB(MainText3Color);
    [centerImageView addSubview:titLabel];
    
    self.s_pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, titLabel.bottom,centerImageView.width,centerImageView.height - titLabel.bottom - 60)];
    self.s_pickerView.delegate = self;
    self.s_pickerView.dataSource = self;
    [centerImageView addSubview:self.s_pickerView];
    [self.s_pickerView selectRow:0 inComponent:0 animated:NO];
    self.s_dic = [self.m_typeArr safe_objectAtIndex:0];
    
    UIButton *cancelBtn = [UIButton new];
    [cancelBtn setImage:FTImage(@"Center_cancel_Image") forState:UIControlStateNormal];
    WEAK_SELF
    [cancelBtn addTapAction:^(UIGestureRecognizer *sender) {
        STRONG_SELF
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
    [self.view addSubview:cancelBtn];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(32);
        make.bottom.equalTo(centerImageView.mas_top).offset(0);
        make.right.equalTo(centerImageView.mas_right).offset(8);
    }];
    
    UIButton *confirmBtn = [UIButton new];
    [confirmBtn setBackgroundImage:FTImage(@"login_btn_back_Image") forState:UIControlStateNormal];
    [confirmBtn setTitle:@"Next" forState:UIControlStateNormal];
    [confirmBtn.titleLabel setFont:FTBoldFont(20)];
    [confirmBtn addTarget:self action:@selector(serviceloginlogout) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmBtn];
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(247);
        make.height.mas_equalTo(54);
        make.top.equalTo(centerImageView.mas_bottom).offset(15);
        make.centerX.equalTo(centerImageView);
    }];
}

- (void)serviceloginlogout
{
    WEAK_SELF
    [self dismissViewControllerAnimated:NO completion:^{
        STRONG_SELF
        if (self.block) {
            self.block(self.s_dic);
        }
    }];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return 343;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.s_dic = [self.m_typeArr safe_objectAtIndex:row];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.m_typeArr.count;
}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *pickerLabel = (UILabel *)view;
    if (pickerLabel == nil) {
        CGRect frame = CGRectMake(0.0, 0.0, 343, 35);
        pickerLabel = [[UILabel alloc] initWithFrame:frame];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
    }
    NSDictionary *dic = [self.m_typeArr safe_objectAtIndex:row];
    pickerLabel.font = FTMediumFont(14);
    pickerLabel.textColor = UIColorFromRGB(0x2FBEA0);
    pickerLabel.text = [dic stringForKey:@"projects"];
    return pickerLabel;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 35;
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    NSLog(@"%@",NSStringFromClass([touch.view class]));//
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UIView"]){
        return NO;
    }
    return YES;
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
