//
//  AuthenticationInfoConfirmViewController.h
//  PinjamN
//
//  Created by Yu Chen  on 2025/12/27.
//

#import "BasewjCOsnwReotCLLControelweViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface AuthenticationInfoConfirmViewController : BasewjCOsnwReotCLLControelweViewController

@property (nonatomic, strong)NSDictionary *m_dic;
@property (nonatomic, strong)NSString     *m_typeStr;
@property (nonatomic, copy)void (^block)(void);

@end

NS_ASSUME_NONNULL_END
