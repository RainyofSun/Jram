//
//  FTDetailVC.h
//  project
//
//  Created by 周群 on 2024/8/4.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FTDetailVC : BaseViewController
@property (nonatomic, strong)NSString *m_productIdStr;
@property (nonatomic, copy)void (^block)(NSString *str);

@end

NS_ASSUME_NONNULL_END
