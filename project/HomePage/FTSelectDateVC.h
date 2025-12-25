//
//  FTSelectDateVC.h
//  project
//
//  Created by 周群 on 2024/8/12.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FTSelectDateVC : BaseViewController
@property (nonatomic, copy)void (^block)(NSString *str);

@end

NS_ASSUME_NONNULL_END
