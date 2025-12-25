//
//  FTPublicTipVC.h
//  project
//
//  Created by 周群 on 2024/8/5.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FTPublicTipVC : BaseViewController
@property (nonatomic, assign)BOOL m_isCardBool;
@property (nonatomic, copy)void (^block)(void);

@end

NS_ASSUME_NONNULL_END
