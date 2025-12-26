//
//  ChanPinViewController.h
//  PinjamN
//
//  Created by Yu Chen  on 2025/12/26.
//

#import "BasewjCOsnwReotCLLControelweViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChanPinViewController : BasewjCOsnwReotCLLControelweViewController

@property (nonatomic, strong)NSString *m_productIdStr;
@property (nonatomic, copy)void (^block)(NSString *str);

@end

NS_ASSUME_NONNULL_END
