//
//  OrderTableViewCell.m
//  PinjamN
//
//  Created by Yu Chen  on 2025/12/26.
//

#import "OrderTableViewCell.h"
#import "WebViewViewController.h"

@interface OrderTableViewCell ()

@property (nonatomic, strong) UIImageView *s_backImageView;
@property (nonatomic, strong) UILabel     *s_priceLabel;
@property (nonatomic, strong) UIImageView *s_productIconImageView;
@property (nonatomic, strong) UILabel     *s_productTitLabel;
@property (nonatomic, strong) UIButton    *s_titBtn;
@property (nonatomic, strong) UIButton    *s_agreementBtn;
@property (nonatomic, strong) UIView      *s_linView;
@property (nonatomic, strong) NSMutableArray    *s_valueArr;
@property (nonatomic, strong) NSMutableArray    *s_titleArr;

@end

@implementation OrderTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self s_addSubViewAction];
    }
    return self;
}

- (void)s_addSubViewAction
{
    self.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.s_backImageView];
    [self.contentView addSubview:self.s_priceLabel];
    [self.contentView addSubview:self.s_productIconImageView];
    [self.contentView addSubview:self.s_productTitLabel];
    [self.contentView addSubview:self.s_titBtn];
    [self.contentView addSubview:self.s_agreementBtn];

    [self.s_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-15);
        make.left.top.equalTo(self.contentView).offset(15);
        make.bottom.equalTo(self.contentView).offset(0);
    }];

    [self.s_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.s_backImageView).offset(14);
        make.top.equalTo(self.s_backImageView).offset(11);
        make.height.mas_equalTo(30);
    }];
        
    [self.s_productIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.s_backImageView).offset(-100);
        make.centerY.equalTo(self.s_priceLabel);
        make.width.height.mas_equalTo(30);
    }];
    
    [self.s_productTitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.s_productIconImageView.mas_right).offset(5);
        make.centerY.equalTo(self.s_priceLabel);
        make.height.mas_equalTo(30);
    }];
    
    [self.s_titBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self.s_backImageView).offset(-15);
        make.height.mas_equalTo(35);
        make.width.mas_equalTo(111);
    }];
    
    [self.s_agreementBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.s_backImageView).offset(-15);
        make.left.equalTo(self.s_backImageView).offset(15);
        make.height.mas_equalTo(30);
    }];
    
    self.s_linView = [UIView new];
    self.s_linView.backgroundColor = UIColorFromRGB(0x49C9A5);
    [self.s_backImageView addSubview:self.s_linView];
    [self.s_linView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.equalTo(self.s_agreementBtn.mas_left);
        make.right.equalTo(self.s_agreementBtn.mas_right);
        make.bottom.equalTo(self.s_agreementBtn.mas_bottom).offset(-6);
    }];
    self.s_titleArr = [NSMutableArray array];
    self.s_valueArr = [NSMutableArray array];
    for (int k = 0; k < 4; k++) {
        UILabel *titLabel = [UILabel new];
        [self.s_titleArr safe_addObject:titLabel];
        titLabel.textColor = UIColorFromRGB(MainText3Color);
        titLabel.font = OSLWRegularFont(14);
        [self.s_backImageView addSubview:titLabel];
        [titLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.s_backImageView).offset(20);
            make.height.mas_equalTo(20);
            make.top.equalTo(self.s_backImageView).offset(60 + 28*k);
        }];
        
        UILabel *valueLabel = [UILabel new];
        [self.s_valueArr safe_addObject:valueLabel];
        valueLabel.textColor = UIColorFromRGB(MainText3Color);
        valueLabel.font = OSLWMediumFont(13);
        [self.s_backImageView addSubview:valueLabel];
        [valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.s_backImageView).offset(-20);
            make.height.mas_equalTo(20);
            make.centerY.equalTo(titLabel);
        }];
    }
}

- (UIImageView *)s_backImageView{
    if (!_s_backImageView) {
        _s_backImageView = [UIImageView new];
        _s_backImageView.image = OSLWImage(@"HomePage_cell_back_Image");
    }
    return _s_backImageView;
}

- (UILabel *)s_priceLabel{
    if (!_s_priceLabel) {
        _s_priceLabel = [UILabel new];
        _s_priceLabel.textColor = UIColorFromRGB(0x006D54);
        _s_priceLabel.font = OSLWBoldFont(24);
    }
    return _s_priceLabel;
}

- (UIImageView *)s_productIconImageView{
    if (!_s_productIconImageView) {
        _s_productIconImageView = [UIImageView new];
        _s_productIconImageView.contentMode = UIViewContentModeScaleAspectFill;
        _s_productIconImageView.image = OSLWImage(@"logoImage");
        [_s_productIconImageView roundedRect:6];
    }
    return _s_productIconImageView;
}

- (UILabel *)s_productTitLabel{
    if (!_s_productTitLabel) {
        _s_productTitLabel = [UILabel new];
        _s_productTitLabel.textColor = UIColorFromRGB(MainWhiteColor);
        _s_productTitLabel.font = OSLWMediumFont(14);
    }
    return _s_productTitLabel;
}

- (UIButton *)s_titBtn{
    if (!_s_titBtn) {
        _s_titBtn = [UIButton new];
        [_s_titBtn setBackgroundColor:UIColorFromRGB(0x15A77E)];
        [_s_titBtn roundedRect:12];
        [_s_titBtn setUserInteractionEnabled:NO];
        [_s_titBtn.titleLabel setFont:OSLWMediumFont(16)];
    }
    return _s_titBtn;
}

- (UIButton *)s_agreementBtn{
    if (!_s_agreementBtn) {
        _s_agreementBtn = [UIButton new];
        [_s_agreementBtn.titleLabel setFont:OSLWBoldFont(16)];
        [_s_agreementBtn setTitleColor:UIColorFromRGB(0x49C9A5) forState:UIControlStateNormal];
        [_s_agreementBtn addTarget:self action:@selector(agreementBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _s_agreementBtn;
}

- (void)agreementBtnAction
{
    WebViewViewController *vc = [WebViewViewController new];
    vc.m_titleStr = @"Loan Agreement";
    vc.m_urlStr = [self.m_dic stringForKey:@"starting"];
    [self.viewController.navigationController pushViewController:vc animated:YES];
}

- (void)setM_dic:(NSDictionary *)m_dic
{
    _m_dic = m_dic;
    self.s_priceLabel.text = [_m_dic stringForKey:@"insideed"];
    [self.s_productIconImageView sd_setImageWithURL:[NSURL URLWithString:[_m_dic stringForKey:@"latter"]] placeholderImage:OSLWImage(@"logoImage")];
    self.s_productTitLabel.text = [_m_dic stringForKey:@"begun"];
    [self.s_titBtn setTitle:[_m_dic stringForKey:@"gerardis"] forState:UIControlStateNormal];
    [self.s_agreementBtn setTitle:[_m_dic stringForKey:@"diageo"] forState:UIControlStateNormal];
    self.s_agreementBtn.hidden = ![_m_dic stringForKey:@"starting"].hasTextContent;
    self.s_linView.hidden = ![_m_dic stringForKey:@"starting"].hasTextContent;;
    
    for (UILabel *titLabel in self.s_titleArr) {
        titLabel.hidden = YES;
    }
    
    for (UILabel *titLabel in self.s_valueArr) {
        titLabel.hidden = YES;
    }
    NSArray *arr = [_m_dic arrayForKey:@"official"];
    for (int k = 0; k < arr.count; k++) {
        UILabel *titLabel = [self.s_titleArr safe_objectAtIndex:k];
        titLabel.hidden = NO;
        UILabel *valueLabel = [self.s_valueArr safe_objectAtIndex:k];
        valueLabel.hidden = NO;
        NSDictionary *dic = [arr safe_objectAtIndex:k];
        titLabel.text = [dic stringForKey:@"ackie"];
        valueLabel.text = [dic stringForKey:@"whiskies"];
    }
}

@end
