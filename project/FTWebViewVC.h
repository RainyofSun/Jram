//
//  GSWebViewVC.h
//  AudioRoomProject
//
//  Created by 周群 on 2021/4/10.
//  Copyright © 2021 周群. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FTWebViewVC : BaseViewController
@property (nonatomic, strong)NSString *m_urlStr;
@property (nonatomic, strong)NSString *m_titleStr;
@property (nonatomic, assign)BOOL      m_bankBool;

@end

NS_ASSUME_NONNULL_END
