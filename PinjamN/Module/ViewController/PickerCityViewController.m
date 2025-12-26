//
//  PickerCityViewController.m
//  PinjamN
//
//  Created by Yu Chen  on 2025/12/27.
//

#import "PickerCityViewController.h"

@interface PickerCityViewController ()<UIPickerViewDelegate,UIPickerViewDataSource,UIGestureRecognizerDelegate>
@property (nonatomic, strong)UIPickerView   *s_pickerView;
@property (nonatomic, strong)NSDictionary   *s_municipalityDic;
@property (nonatomic, strong)NSDictionary   *s_provinceDic;
@property (nonatomic, strong)NSDictionary   *s_districtDic;
@property (nonatomic, strong)NSMutableArray *s_textfieldArr;
@property (nonatomic, strong)NSArray        *s_arr;
@property (nonatomic, assign)int             s_index;

@end

@implementation PickerCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColorFromRGB(MainText0Color) colorWithAlphaComponent:0.5];
    self.s_arr = [OSLW_Defaults arrayForKey:MainCity];
    self.s_index = 0;
    UIImageView *centerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, kSCREEN_HEIGHT - 501, kSCREEN_WIDTH, 501)];
    centerImageView.image = OSLWImage(@"Detail_address_Image");
    [centerImageView setUserInteractionEnabled:YES];
    [self.view addSubview:centerImageView];
    
    UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, centerImageView.width, 25)];
    titLabel.text = @"Address";
    titLabel.textAlignment = NSTextAlignmentCenter;
    titLabel.font = OSLWBoldFont(18);
    titLabel.textColor = UIColorFromRGB(MainText3Color);
    [centerImageView addSubview:titLabel];
    self.s_textfieldArr = [NSMutableArray array];
    NSArray *titArr = [NSArray arrayWithObjects:@"Province",@"Municipality",@"District", nil];
    for (int k = 0; k < titArr.count; k++) {
        UILabel *titLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 92 + 38*k, 100, 22)];
        titLabel.text = [titArr safe_objectAtIndex:k];
        titLabel.font = OSLWRegularFont(16);
        titLabel.textColor = UIColorFromRGB(MainText3Color);
        [centerImageView addSubview:titLabel];
        
        __block UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(centerImageView.width - 240,titLabel.top - 10, 200, titLabel.height + 20)];
        textfield.textColor = UIColorFromRGB(MainText3Color);
        textfield.font = OSLWRegularFont(16);
        textfield.tag = k;
        textfield.textAlignment = NSTextAlignmentRight;
        textfield.backgroundColor = [UIColor clearColor];
        NSAttributedString *accountAttrString = [[NSAttributedString alloc] initWithString:@"Please choose" attributes:@{NSForegroundColorAttributeName:UIColorFromRGB(MainText9Color),NSFontAttributeName:OSLWRegularFont(16)}];
        textfield.attributedPlaceholder = accountAttrString;
        [centerImageView addSubview:textfield];
        [self.s_textfieldArr safe_addObject:textfield];
        if (k == 0) {
            self.s_provinceDic = self.s_arr.firstObject;
            textfield.text = [self.s_provinceDic stringForKey:@"projects"];
        }
        WEAK_SELF
        [textfield addTapAction:^(UIGestureRecognizer *sender) {
            STRONG_SELF
            __block UITextField *selectTextfield = (UITextField *)[sender view];
            self.s_index = (int)selectTextfield.tag;
            [selectTextfield resignFirstResponder];
            if (selectTextfield.tag == 0) {
                self.s_arr = [OSLW_Defaults arrayForKey:MainCity];
                self.s_provinceDic = self.s_arr.firstObject;
                selectTextfield.text = [self.s_provinceDic stringForKey:@"projects"];
            }else if (selectTextfield.tag == 1) {
                UITextField *textfield = [self.s_textfieldArr safe_objectAtIndex:0];
                if (!textfield.text.hasTextContent) {
                    [SVProgressHUD showInfoWithStatus:@"Please choose Province"];
                    return;
                }
                self.s_arr = [self.s_provinceDic arrayForKey:@"alicent"];
                self.s_municipalityDic = self.s_arr.firstObject;
                selectTextfield.text = [self.s_municipalityDic stringForKey:@"projects"];
            }else if (selectTextfield.tag == 2) {
                UITextField *textfield = [self.s_textfieldArr safe_objectAtIndex:1];
                if (!textfield.text.hasTextContent) {
                    [SVProgressHUD showInfoWithStatus:@"Please choose Municipality"];
                    return;
                }
                self.s_arr = [self.s_municipalityDic arrayForKey:@"alicent"];
                self.s_districtDic = self.s_arr.firstObject;
                selectTextfield.text = [self.s_districtDic stringForKey:@"projects"];
            }
            [self.s_pickerView reloadAllComponents];
            [self.s_pickerView selectRow:0 inComponent:0 animated:NO];
        }];
    }
    
    self.s_pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 200,centerImageView.width,200)];
    self.s_pickerView.delegate = self;
    self.s_pickerView.dataSource = self;
    [centerImageView addSubview:self.s_pickerView];
    [self.s_pickerView selectRow:0 inComponent:0 animated:NO];
//    self.s_dic = [self.m_typeArr safe_objectAtIndex:0];
    
    UIButton *cancelBtn = [UIButton new];
    [cancelBtn setImage:OSLWImage(@"Center_cancel_Image") forState:UIControlStateNormal];
    WEAK_SELF
    [cancelBtn addTapAction:^(UIGestureRecognizer *sender) {
        STRONG_SELF
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
    [self.view addSubview:cancelBtn];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(32);
        make.bottom.equalTo(centerImageView.mas_top).offset(0);
        make.right.equalTo(centerImageView.mas_right).offset(0);
    }];
    
    UIButton *confirmBtn = [UIButton new];
    [confirmBtn roundedRect:27];
    [confirmBtn setBackgroundColor:UIColorFromRGB(0x49C9A5)];
    [confirmBtn setTitle:@"Next" forState:UIControlStateNormal];
    [confirmBtn.titleLabel setFont:OSLWBoldFont(20)];
    [confirmBtn addTarget:self action:@selector(serviceloginlogout) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmBtn];
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kSCREEN_WIDTH - 70);
        make.height.mas_equalTo(54);
        make.bottom.equalTo(centerImageView.mas_bottom).offset(-40);
        make.centerX.equalTo(centerImageView);
    }];
}

- (void)serviceloginlogout
{
    if (!self.s_municipalityDic.hasContent) {
        UITextField *textField = [self.s_textfieldArr safe_objectAtIndex:1];
        self.s_arr = [self.s_provinceDic arrayForKey:@"alicent"];
        self.s_municipalityDic = self.s_arr.firstObject;
        textField.text = [self.s_municipalityDic stringForKey:@"projects"];
        [self.s_pickerView reloadAllComponents];
        [self.s_pickerView selectRow:0 inComponent:0 animated:NO];
        return;
    }
    if (!self.s_districtDic.hasContent) {
        UITextField *textField = [self.s_textfieldArr safe_objectAtIndex:2];
        self.s_arr = [self.s_municipalityDic arrayForKey:@"alicent"];
        self.s_districtDic = self.s_arr.firstObject;
        textField.text = [self.s_districtDic stringForKey:@"projects"];
        [self.s_pickerView reloadAllComponents];
        [self.s_pickerView selectRow:0 inComponent:0 animated:NO];
        return;
    }
    WEAK_SELF
    [self dismissViewControllerAnimated:NO completion:^{
        STRONG_SELF
        NSMutableArray *arr = [NSMutableArray array];
        [arr safe_addObject:self.s_provinceDic];
        [arr safe_addObject:self.s_municipalityDic];
        [arr safe_addObject:self.s_districtDic];
        if (self.block) {
            self.block(arr);
        }
    }];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return 343;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    UITextField *textField = [self.s_textfieldArr safe_objectAtIndex:self.s_index];
    NSDictionary *dic = [self.s_arr safe_objectAtIndex:row];
    textField.text = [dic stringForKey:@"projects"];
    if (self.s_index == 0) {
        self.s_provinceDic = dic;
    }else if (self.s_index == 1) {
        self.s_municipalityDic = dic;
    }else if (self.s_index == 2) {
        self.s_districtDic = dic;
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.s_arr.count;
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
    NSDictionary *dic = [self.s_arr safe_objectAtIndex:row];
    pickerLabel.font = OSLWMediumFont(14);
    pickerLabel.textColor = UIColorFromRGB(MainText3Color);
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

@end
