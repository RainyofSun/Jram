//
//  HUNavigationBar.h
//  baoguan
//
//  Created by 周群 on 2018/5/10.
//  Copyright © 2018年 周群. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HUNavigationBarDelegate <NSObject>
- (void)leftAction;
- (void)rightAction;
@end
@interface HUNavigationBar : UIView

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


- (instancetype)initNaviBarWithTitle:(NSString *)title LeftImage:(UIImage *)lImage leftTitle:(NSString *)lTitle rightImage:(UIImage *)rImage rightTitle:(NSString *)rTitle delegate:(id<HUNavigationBarDelegate>)delegate frame:(CGRect)frame;

@end
