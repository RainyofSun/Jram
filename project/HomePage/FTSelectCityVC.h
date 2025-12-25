//
//  FTSelectCityVC.h
//  project
//
//  Created by 周群 on 2024/8/10.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FTSelectCityVC : BaseViewController
@property (nonatomic, copy)void (^block)(NSMutableArray *cityArr);

@end

NS_ASSUME_NONNULL_END
