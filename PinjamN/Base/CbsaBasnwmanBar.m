//
//  CbsaBasnwmanBar.m
//  PinjamN
//
//  Created by 一刻 on 2025/12/26.
//

#import "CbsaBasnwmanBar.h"

@implementation CbsaBasnwmanBar

- (instancetype)initNaviBarWithTitle:(NSString *)title LeftImage:(UIImage *)lImage leftTitle:(NSString *)lTitle rightImage:(UIImage *)rImage rightTitle:(NSString *)rTitle delegate:(id<HUNavigationBarDelegate>)delegate frame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColorFromRGB(0x2FBEA0);
        self.delegate = delegate;
        [self addSubview:self.m_titleLabel];
        [self addSubview:self.m_leftBtn];
        [self addSubview:self.m_rightBtn];
        [self addSubview:self.m_linView];
    
        if (title) {
            self.m_titleLabel.text = title;
        }
        CGFloat lwidth = [lTitle widthWithFont:[UIFont systemFontOfSize:15] constrainedToHeight:self.frame.size.height-StatusbarHeight] + 20;

        if(lImage && lTitle){
            self.m_leftBtn.frame = CGRectMake( 0, StatusbarHeight, lwidth + 40, self.frame.size.height-StatusbarHeight);
            self.m_leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -3, 0, 0);
            self.m_leftBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
            self.m_leftBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            [self.m_leftBtn setImage:lImage forState:UIControlStateNormal];
            [self.m_leftBtn setTitle:lTitle forState:UIControlStateNormal];
            
        }else{
            if (lImage) {
                self.m_leftBtn.frame = CGRectMake( 0, StatusbarHeight, 60, self.frame.size.height-StatusbarHeight);
                [self.m_leftBtn setImage:lImage forState:UIControlStateNormal];
            }
            
            if (lTitle) {
                self.m_leftBtn.frame = CGRectMake( 0, StatusbarHeight, lwidth, self.frame.size.height-StatusbarHeight);
                self.m_leftBtn.titleLabel.font = [UIFont systemFontOfSize:15];
                [self.m_leftBtn setTitle:lTitle forState:UIControlStateNormal];
            }
            
        }
        [self.m_leftBtn addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat rwidth = [rTitle widthWithFont:[UIFont systemFontOfSize:15] constrainedToHeight:self.frame.size.height-StatusbarHeight] + 20;
        if(rImage && rTitle){
            self.m_rightBtn.frame = CGRectMake( kSCREEN_WIDTH - rwidth - 40, StatusbarHeight, rwidth + 40, self.frame.size.height-StatusbarHeight);
            self.m_rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -3, 0, 0);
            self.m_rightBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
            self.m_rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            [self.m_rightBtn setImage:rImage forState:UIControlStateNormal];
            [self.m_rightBtn setTitle:rTitle forState:UIControlStateNormal];
            
        }else{
            if (rImage) {
                self.m_rightBtn.frame = CGRectMake( kSCREEN_WIDTH - 60, StatusbarHeight, 60, self.frame.size.height-StatusbarHeight);
                [self.m_rightBtn setImage:rImage forState:UIControlStateNormal];
            }
            
            if (rTitle) {
                self.m_rightBtn.frame = CGRectMake( kSCREEN_WIDTH - rwidth, StatusbarHeight, rwidth, self.frame.size.height-StatusbarHeight);
                self.m_rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
                [self.m_rightBtn setTitle:rTitle forState:UIControlStateNormal];
            }
            
        }
        
        [self.m_rightBtn addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

- (UILabel *)m_titleLabel {
    if (!_m_titleLabel) {
        _m_titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, StatusbarHeight, kSCREEN_WIDTH - 160, self.frame.size.height-StatusbarHeight)];
        _m_titleLabel.textAlignment = NSTextAlignmentCenter;
        _m_titleLabel.font = OSLWMediumFont(18);
        _m_titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _m_titleLabel.textColor = [UIColor whiteColor];
    }
    return _m_titleLabel;
}
- (UIView *)m_linView {
    if (!_m_linView) {
        _m_linView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 1, kSCREEN_WIDTH, 0.5)];
        _m_linView.hidden = YES;
        _m_linView.backgroundColor = [UIColor lightGrayColor];
    }
    return _m_linView;
}

- (UIButton *)m_leftBtn {
    if (!_m_leftBtn) {
        _m_leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _m_leftBtn;
}

- (UIButton *)m_rightBtn {
    if (!_m_rightBtn) {
        _m_rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _m_rightBtn;
}

- (void)leftAction {
    if (self.delegate && [self.delegate respondsToSelector:@selector(leftAction)]) {
        [self.delegate leftAction];
    }
}

- (void)rightAction {
    if (self.delegate && [self.delegate respondsToSelector:@selector(rightAction)]) {
        [self.delegate rightAction];
    }
}

@end
