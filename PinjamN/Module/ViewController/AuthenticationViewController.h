//
//  AuthenticationViewController.h
//  PinjamN
//
//  Created by Yu Chen  on 2025/12/27.
//

#import "BasewjCOsnwReotCLLControelweViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface AuthenticationViewController : BasewjCOsnwReotCLLControelweViewController

@property (nonatomic, strong)NSString    *m_appliesStr;
@property (nonatomic, strong)NSArray     *m_believesArr;
@property (nonatomic, strong)NSArray     *m_prequelsArr;
@property (nonatomic, copy)void (^block)(void);


@property (nonatomic, copy)void (^blockEventStart)(void);

@end

NS_ASSUME_NONNULL_END
