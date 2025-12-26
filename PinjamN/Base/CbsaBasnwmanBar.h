//
//  CbsaBasnwmanBar.h
//  PinjamN
//
//  Created by 一刻 on 2025/12/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HUNavigationBarDelegate <NSObject>
- (void)leftAction;
- (void)rightAction;
@end

@interface CbsaBasnwmanBar : UIView

/**
 *  title
 */
@property (nonatomic, strong) UILabel *m_titleLabel;
/**
 *  左侧按钮
 */
@property (nonatomic, strong) UIButton *m_leftBtn;
/**
 *  右侧按钮
 */
@property (nonatomic, strong) UIButton *m_rightBtn;
//线
@property (nonatomic, strong) UIView  *m_linView;
@property (nonatomic, strong)UIImageView *m_navgationBarImage;

@property (nonatomic, weak) id<HUNavigationBarDelegate> delegate;


- (instancetype)initNaviBarWithTitle:(NSString *)title LeOSLWImage:(UIImage *)lImage leftTitle:(NSString *)lTitle rightImage:(UIImage *)rImage rightTitle:(NSString *)rTitle delegate:(id<HUNavigationBarDelegate>)delegate frame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
