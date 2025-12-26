//
//  UserExitSelectViewController.h
//  PinjamN
//
//  Created by Yu Chen  on 2025/12/27.
//

#import "BasewjCOsnwReotCLLControelweViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserExitSelectViewController : BasewjCOsnwReotCLLControelweViewController

@property (nonatomic, copy)void (^block)(NSDictionary *dic);
@property (nonatomic, strong)NSString *m_titStr;
@property (nonatomic, strong)NSArray  *m_typeArr;

@end

NS_ASSUME_NONNULL_END
