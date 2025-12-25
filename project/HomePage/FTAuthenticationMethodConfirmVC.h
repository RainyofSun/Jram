//
//  FTAuthenticationMethodConfirmVC.h
//  project
//
//  Created by 周群 on 2024/8/10.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FTAuthenticationMethodConfirmVC : BaseViewController
@property (nonatomic, strong)NSDictionary *m_dic;
@property (nonatomic, strong)NSString     *m_typeStr;
@property (nonatomic, copy)void (^block)(void);

@end

NS_ASSUME_NONNULL_END
