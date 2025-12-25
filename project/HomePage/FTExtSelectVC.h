//
//  FTExtSelectVC.h
//  project
//
//  Created by 周群 on 2024/8/10.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FTExtSelectVC : BaseViewController
@property (nonatomic, copy)void (^block)(NSDictionary *dic);
@property (nonatomic, strong)NSString *m_titStr;
@property (nonatomic, strong)NSArray  *m_typeArr;

@end

NS_ASSUME_NONNULL_END
