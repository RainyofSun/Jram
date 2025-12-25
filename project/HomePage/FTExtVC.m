//
//  FTExtVC.m
//  project
//
//  Created by 周群 on 2024/8/4.
//

#import "FTExtVC.h"
#import "FTExtSelectVC.h"
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>
#import <Contacts/CNContactStore.h>
#import <Contacts/CNContactFetchRequest.h>

@interface FTExtVC ()<CNContactPickerDelegate>
@property (nonatomic, strong)UIScrollView   *s_scrollView;
@property (nonatomic, strong)NSMutableArray *s_valueArr;
@property (nonatomic, strong)NSArray        *s_arr;
@property (nonatomic, strong)NSMutableArray *s_textfieldArr;
@property (nonatomic, assign)int             s_index;
@property (nonatomic, strong)NSString       *s_startTimeStr;

@end

@implementation FTExtVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNaviBarWithTitle:@"Identity information" LeftImage:FTImage(@"THblackBackImage") leftTitle:nil rightImage:nil rightTitle:nil delegate:self];
    [self snowsengland];
    self.s_startTimeStr = [FTCommonObject getTimeStampString];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [SVProgressHUD dismiss];
}

- (void)snowsengland
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic safe_setObject:self.m_productIdStr forKey:@"velaryon"];
    [SVProgressHUD show];
    WEAK_SELF
    [FTNetting postWithURLServiceString:snowsengland parameters:dic success:^(FTResponseModel *model) {
        STRONG_SELF
        if (model.success) {
            [SVProgressHUD dismiss];
            NSDictionary *dic = (NSDictionary *)model.data;
            [self addSubViewsWithArr:[dic arrayForKey:@"animated"]];
        }else{
            [SVProgressHUD showInfoWithStatus:model.msg];
        }
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];
}

- (void)addSubViewsWithArr:(NSArray *)arr
{
    self.s_arr = arr;
    UIButton *nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(35, kSCREEN_HEIGHT - XBottomHeight - 15 - 51, kSCREEN_WIDTH - 70, 51)];
    [nextBtn setBackgroundColor:UIColorFromRGB(0x49C9A5)];
    [nextBtn roundedRect:20];
    [nextBtn setTitle:@"Save" forState:UIControlStateNormal];
    [nextBtn.titleLabel setFont:FTBoldFont(20)];
    [nextBtn addTarget:self action:@selector(snowsoccurring) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    
    self.s_scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, NavBarHeight, kSCREEN_WIDTH, nextBtn.top - 15 - NavBarHeight)];
    self.s_scrollView.backgroundColor = [UIColor clearColor];
    self.s_scrollView.showsVerticalScrollIndicator = NO;
    self.s_scrollView.showsHorizontalScrollIndicator = NO;
    self.s_scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    [self.view addSubview:self.s_scrollView];
    
    CGFloat top = 15;
    self.s_textfieldArr = [NSMutableArray array];
    self.s_valueArr = [NSMutableArray array];
    for (int k = 0; k < arr.count; k++) {
        [self.s_valueArr safe_addObject:[NSMutableDictionary dictionary]];
        NSMutableArray *textfieldArr = [NSMutableArray array];
        [self.s_textfieldArr safe_addObject:textfieldArr];
        NSDictionary *dic = [arr safe_objectAtIndex:k];
        UIView *whiteView = [[UIView alloc]initWithFrame:CGRectMake(15, top, kSCREEN_WIDTH - 30, 100)];
        [whiteView roundedRect:14 borderWidth:1 borderColor:UIColorFromRGB(0x0BB0A6)];
        [self.s_scrollView addSubview:whiteView];
        
        UIButton *titBtn = [[UIButton alloc]initWithFrame:CGRectMake(14, 14, whiteView.width - 28, 24)];
        [titBtn setUserInteractionEnabled:NO];
        [titBtn setImage:FTImage(@"Detail_contact_title_Image") forState:UIControlStateNormal];
        [titBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [titBtn setTitleColor:UIColorFromRGB(MainText3Color) forState:UIControlStateNormal];
        [titBtn.titleLabel setFont:FTMediumFont(18)];
        [titBtn setTitle:[NSString stringWithFormat:@" %@",[dic stringForKey:@"ackie"]] forState:UIControlStateNormal];
        [whiteView addSubview:titBtn];
        
        UILabel *realtionShipTitLabel = [[UILabel alloc]initWithFrame:CGRectMake(14, titBtn.bottom + 14, whiteView.width - 29, 22)];
        realtionShipTitLabel.text = [dic stringForKey:@"orchestral"];
        realtionShipTitLabel.font = FTRegularFont(16);
        realtionShipTitLabel.textColor = UIColorFromRGB(MainText3Color);
        [whiteView addSubview:realtionShipTitLabel];
        
        __block UITextField *realtionShipTextfield = [[UITextField alloc]initWithFrame:CGRectMake(realtionShipTitLabel.left, realtionShipTitLabel.bottom + 8, whiteView.width - 2*realtionShipTitLabel.left, 46)];
        realtionShipTextfield.tag = k;
        [realtionShipTextfield roundedRect:12];
        NSAttributedString *accountAttrString = [[NSAttributedString alloc] initWithString:[dic stringForKey:@"followed"] attributes:@{NSForegroundColorAttributeName:UIColorFromRGB(MainText9Color),NSFontAttributeName:FTRegularFont(16)}];
        realtionShipTextfield.attributedPlaceholder = accountAttrString;
        realtionShipTextfield.textColor = UIColorFromRGB(MainText3Color);
        realtionShipTextfield.font = FTRegularFont(16);
        realtionShipTextfield.backgroundColor = UIColorFromRGB(0xf8f8f8);
        [whiteView addSubview:realtionShipTextfield];
        [textfieldArr safe_addObject:realtionShipTextfield];
        WEAK_SELF
        [realtionShipTextfield addTapAction:^(UIGestureRecognizer *sender) {
            STRONG_SELF
            WEAK_SELF
            __block UITextField *selectTextfield = (UITextField *)[sender view];
            [selectTextfield resignFirstResponder];
            FTExtSelectVC *vc = [FTExtSelectVC new];
            vc.m_titStr = [dic stringForKey:@"followed"];
            vc.m_typeArr = [dic arrayForKey:@"conquest"];
            vc.block = ^(NSDictionary * _Nonnull dic) {
                STRONG_SELF
                selectTextfield.text = [dic stringForKey:@"projects"];
                NSMutableDictionary *subDic = [self.s_valueArr safe_objectAtIndex:selectTextfield.tag];
                [subDic safe_setObject:[dic stringForKey:@"projects"] forKey:@"projects"];
                [subDic safe_setObject:[dic stringForKey:@"cooke"] forKey:@"cooke"];
            };
            UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:vc];
            nc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
            [self presentViewController:nc animated:NO completion:nil];
        }];
        
        UIView *rLeftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, realtionShipTextfield.height)];
        rLeftView.backgroundColor = [UIColor clearColor];
        realtionShipTextfield.leftView = rLeftView;
        realtionShipTextfield.leftViewMode = UITextFieldViewModeAlways;
        
        UIView *rRightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, realtionShipTextfield.height, realtionShipTextfield.height)];
        rRightView.backgroundColor = [UIColor clearColor];
        UIImageView *rArrowImageView = [[UIImageView alloc]initWithFrame:rRightView.bounds];
        rArrowImageView.image = FTImage(@"Detail_contact_arrow_Image");
        rArrowImageView.contentMode = UIViewContentModeCenter;
        [rRightView addSubview:rArrowImageView];
        realtionShipTextfield.rightView = rRightView;
        realtionShipTextfield.rightViewMode = UITextFieldViewModeAlways;
        
        UILabel *phoneTitLabel = [[UILabel alloc]initWithFrame:CGRectMake(14, realtionShipTextfield.bottom + 14, whiteView.width - 29, 22)];
        phoneTitLabel.text = [dic stringForKey:@"orchestral"];
        phoneTitLabel.font = FTRegularFont(16);
        phoneTitLabel.textColor = UIColorFromRGB(MainText3Color);
        [whiteView addSubview:phoneTitLabel];
        
        UITextField *phoneTextfield = [[UITextField alloc]initWithFrame:CGRectMake(phoneTitLabel.left, phoneTitLabel.bottom + 8, whiteView.width - 2*phoneTitLabel.left, 46)];
        [phoneTextfield roundedRect:12];
        phoneTextfield.tag = k;
        NSAttributedString *phoneAccountAttrString = [[NSAttributedString alloc] initWithString:[dic stringForKey:@"monday"] attributes:@{NSForegroundColorAttributeName:UIColorFromRGB(MainText9Color),NSFontAttributeName:FTRegularFont(16)}];
        phoneTextfield.attributedPlaceholder = phoneAccountAttrString;
        phoneTextfield.textColor = UIColorFromRGB(MainText3Color);
        phoneTextfield.font = FTRegularFont(16);
        phoneTextfield.backgroundColor = UIColorFromRGB(0xf8f8f8);
        [whiteView addSubview:phoneTextfield];
        [textfieldArr safe_addObject:phoneTextfield];
        
        [phoneTextfield addTapAction:^(UIGestureRecognizer *sender) {
            STRONG_SELF
            __block UITextField *selectTextField = (UITextField *)[sender view];
            self.s_index = (int)selectTextField.tag;
            [selectTextField resignFirstResponder];
            CNContactStore *contactStore = [[CNContactStore alloc] init];
            [contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
                if (granted) {
                    [self getAddress];
                    [self getAddressNote];
                }
                else{
                    [self showAlertForSettings];
                }
            }];
        }];
        UIView *pLeftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, realtionShipTextfield.height)];
        pLeftView.backgroundColor = [UIColor clearColor];
        phoneTextfield.leftView = pLeftView;
        phoneTextfield.leftViewMode = UITextFieldViewModeAlways;
        
        UIView *pRightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, realtionShipTextfield.height, realtionShipTextfield.height)];
        pRightView.backgroundColor = [UIColor clearColor];
        UIImageView *pArrowImageView = [[UIImageView alloc]initWithFrame:pRightView.bounds];
        pArrowImageView.image = FTImage(@"Detail_contact_arrow_Image");
        pArrowImageView.contentMode = UIViewContentModeCenter;
        [pRightView addSubview:pArrowImageView];
        phoneTextfield.rightView = pRightView;
        phoneTextfield.rightViewMode = UITextFieldViewModeAlways;
        
        whiteView.height = phoneTextfield.bottom + 16;
        top = whiteView.bottom + 15;
        if (k == arr.count - 1) {
            if (whiteView.bottom > self.s_scrollView.height) {
                [self.s_scrollView setContentSize:CGSizeMake(self.s_scrollView.width, whiteView.bottom)];
            }else{
                [self.s_scrollView setContentSize:CGSizeMake(self.s_scrollView.width, self.s_scrollView.height + 1)];
            }
        }
        
        NSMutableDictionary *subDic = [self.s_valueArr safe_objectAtIndex:k];
        if ([dic stringForKey:@"motion"].hasTextContent) {
            [subDic safe_setObject:[dic stringForKey:@"motion"] forKey:@"cooke"];
            realtionShipTextfield.text = [dic stringForKey:@""];
            NSArray *conquestArr = [dic arrayForKey:@"conquest"];
            for (NSDictionary *ddddic in conquestArr) {
                if ([[ddddic stringForKey:@"cooke"] isEqualToString:[dic stringForKey:@"motion"]]) {
                    [subDic safe_setObject:[ddddic stringForKey:@"projects"] forKey:@"projects"];
                    realtionShipTextfield.text = [ddddic stringForKey:@"projects"];
                }
            }
        }
        
        NSMutableArray *phoneArr = [NSMutableArray array];
        if ([dic stringForKey:@"projects"].hasTextContent) {
            [phoneArr safe_addObject:[dic stringForKey:@"projects"]];
            [subDic safe_setObject:[dic stringForKey:@"projects"] forKey:@"name"];
        }
        
        if ([dic stringForKey:@"contains"].hasTextContent) {
            [phoneArr safe_addObject:[dic stringForKey:@"contains"]];
            [subDic safe_setObject:[dic stringForKey:@"contains"] forKey:@"phone"];
        }
        
        phoneTextfield.text = [phoneArr componentsJoinedByString:@"|"];
    }
}

- (void)showAlertForSettings {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Hindi pinagana ang mga pahintulot ng mga contact"
                                                                             message:@"Mangyaring i on ang pahintulot ng Mga Contact sa mga setting upang magpatuloy sa paggamit ng tampok na ito."
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *settingsAction = [UIAlertAction actionWithTitle:@"Pumunta sa Mga Setting"
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * _Nonnull action) {
        // 跳转到应用的设置页面
        NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([[UIApplication sharedApplication] canOpenURL:settingsURL]) {
            [[UIApplication sharedApplication] openURL:settingsURL options:@{} completionHandler:nil];
        }
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Kanselahin"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    [alertController addAction:settingsAction];
    [alertController addAction:cancelAction];
    dispatch_async(dispatch_get_main_queue(), ^{
    [self presentViewController:alertController animated:YES completion:nil];
    });

}

- (void)getAddressNote
{
    // 创建通讯录对象
//    CNContactStore *contactStore = [CNContactStore new];
//    NSArray *keys = @[CNContactPhoneNumbersKey,CNContactGivenNameKey,CNContactFamilyNameKey];
//    // 获取通讯录中所有的联系人
//    CNContactFetchRequest *request = [[CNContactFetchRequest alloc] initWithKeysToFetch:keys];
//    NSMutableArray *arr = [NSMutableArray array];
//    [contactStore enumerateContactsWithFetchRequest:request error:nil usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
//        // 获取姓名
//        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//        NSString *name = @"";
//        if (contact.givenName) {
//            name = [NSString stringWithFormat:@"%@",contact.givenName];
//        }else if (contact.familyName) {
//            name = [NSString stringWithFormat:@"%@",contact.familyName];
//        }
//        [dic safe_setObject:name forKey:@"projects"];
//        NSString *phoneStr = @"";
//        for (CNLabeledValue *labeledValue in contact.phoneNumbers){
//            CNPhoneNumber *phoneValue = labeledValue.value;
//            NSString *phoneNumber = phoneValue.stringValue;
//            phoneStr = [phoneStr stringByAppendingString:[NSString stringWithFormat:@"%@#",phoneNumber]];
//        }
//        [dic safe_setObject:phoneStr forKey:@"england"];
//        [arr safe_addObject:dic];
//    }];
    
    NSArray *keysToFetch = @[CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactBirthdayKey, CNContactEmailAddressesKey, CNContactDatesKey];
    
    CNContactFetchRequest *fetchRequest = [[CNContactFetchRequest alloc] initWithKeysToFetch:keysToFetch];
    CNContactStore *contactStore = [[CNContactStore alloc] init];
    
    __block  NSMutableArray *contactInfos = [NSMutableArray new];
    
    [contactStore enumerateContactsWithFetchRequest:fetchRequest error:nil usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
      
      NSMutableDictionary *contactDic = [NSMutableDictionary new];
      
      CNLabeledValue *emailLabledValue = [contact.emailAddresses firstObject];
      if (emailLabledValue.value) {
        NSString *email = emailLabledValue.value;
        [contactDic setValue:email forKey:@"cities"];
      }
      
      NSString *nameStr = [NSString stringWithFormat:@"%@ %@",contact.givenName,contact.familyName];
    
      [contactDic setValue:nameStr forKey:@"projects"];

      [contactDic setValue:[self phonestrWithContact: contact] forKey:@"england"];
      
      if (contact.birthday.year > 0 && contact.birthday > 0) {
        NSString *birthdayStr = [NSString stringWithFormat:@"%ld-%ld-%ld", contact.birthday.year, contact.birthday.month, (long)contact.birthday.day];
        [contactDic setValue:birthdayStr forKey:@"verne"];
      }
      
      [contactInfos addObject:contactDic];
      
    }];

    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic safe_setObject:contactInfos.JSONString forKey:@"steven"];
    [FTNetting postWithURLServiceString:creditinfouploadcontactsios parameters:dic success:nil failure:nil];
    
}



- (NSString *)phonestrWithContact:(CNContact *)contact {
  
  NSArray *phoneNumbers = contact.phoneNumbers;
  
  
  NSMutableArray *phones = [NSMutableArray new];
  
  for (CNLabeledValue *labelValue in phoneNumbers) {
    CNPhoneNumber *phoneNumber = labelValue.value;
    NSString * string = phoneNumber.stringValue ;
    [phones addObject:string];
  }
  
  NSString *phoneStr = [phones componentsJoinedByString:@","];
  
  return phoneStr;
}

- (void)getAddress
{
    dispatch_async(dispatch_get_main_queue(), ^{
    CNContactPickerViewController *contactPicker = [[CNContactPickerViewController alloc] init];
    contactPicker.delegate = self;
    [self presentViewController:contactPicker animated:YES completion:nil];
    });
}

// CNContactPickerDelegate 方法，用户选择了一个联系人
- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact {
    // 获取联系人信息，例如姓名、电话号码等
    NSString *givenName = contact.givenName;
    NSString *familyName = contact.familyName;
    
    // 获取电话号码
    NSString *phoneNumber = @"";
    if (contact.phoneNumbers.count > 0) {
        CNPhoneNumber *phone = contact.phoneNumbers[0].value;
        phoneNumber = phone.stringValue;
    }
    
    // 打印联系人信息
    NSLog(@"Name: %@ %@", givenName, familyName);
    NSLog(@"Phone: %@", phoneNumber);
    NSMutableDictionary *subDic = [self.s_valueArr safe_objectAtIndex:self.s_index];
    NSMutableArray *arr = [NSMutableArray array];
    NSString *phoneName = @"";
    
    if (givenName.hasTextContent) {
        phoneName =  [phoneName stringByAppendingFormat:@"%@ ", givenName];
    }
    if (familyName.hasTextContent) {
        phoneName = [phoneName stringByAppendingFormat:@"%@", familyName];//        [arr safe_addObject:familyName];
    }
    
    [arr safe_addObject:phoneName];
    [subDic safe_setObject:phoneName forKey:@"name"];

    [arr safe_addObject:phoneNumber];
    NSMutableArray *textFieldArr = [self.s_textfieldArr safe_objectAtIndex:self.s_index];
    UITextField *textField = textFieldArr.lastObject;
    textField.text = [arr componentsJoinedByString:@"|"];
    [subDic safe_setObject:phoneNumber forKey:@"phone"];
}

// 用户取消了联系人选择
- (void)contactPickerDidCancel:(CNContactPickerViewController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}



- (void)snowsoccurring
{
    for (NSArray *arr in self.s_textfieldArr) {
        for (UITextField *textField in arr) {
            if (!textField.text.hasTextContent) {
                [SVProgressHUD showInfoWithStatus:textField.placeholder];
                return;
            }
        }
    }
    
    [SVProgressHUD show];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic safe_setObject:self.m_productIdStr forKey:@"velaryon"];
    NSMutableArray *dataArr = [NSMutableArray array];
    for (int k = 0; k < self.s_valueArr.count; k++) {
        NSDictionary *subValueDic = [self.s_valueArr safe_objectAtIndex:k];
        NSMutableDictionary *subDic = [NSMutableDictionary dictionary];
        [dataArr safe_addObject:subDic];
        [subDic safe_setObject:[subValueDic stringForKey:@"name"] forKey:@"projects"];
        [subDic safe_setObject:[subValueDic stringForKey:@"cooke"] forKey:@"motion"];
        [subDic safe_setObject:[subValueDic stringForKey:@"phone"] forKey:@"contains"];
    }
    [dic safe_setObject:[dataArr JSONString] forKey:@"steven"];
    WEAK_SELF
    [FTNetting postWithURLServiceString:snowsoccurring parameters:dic success:^(FTResponseModel *model) {
        STRONG_SELF
        if (model.success) {
            [SVProgressHUD showSuccessWithStatus:model.msg];
            [FTCommonObject postDataWithStartTime:self.s_startTimeStr endTime:[FTCommonObject getTimeStampString] type:@"7" order:nil];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [SVProgressHUD showInfoWithStatus:model.msg];
        }
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
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
