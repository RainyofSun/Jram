//
//  FTAuthenticationMethodVC.h
//  project
//
//  Created by 周群 on 2024/8/5.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FTAuthenticationMethodVC : BaseViewController
@property (nonatomic, strong)NSString    *m_appliesStr;
@property (nonatomic, strong)NSArray     *m_believesArr;
@property (nonatomic, strong)NSArray     *m_prequelsArr;
@property (nonatomic, copy)void (^block)(void);


@property (nonatomic, copy)void (^blockEventStart)(void);

@end

NS_ASSUME_NONNULL_END
