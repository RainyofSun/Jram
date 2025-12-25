//
//  TDMJRefreshGifFooter.m
//  baoguan
//
//  Created by 周群 on 2018/5/10.
//  Copyright © 2018年 周群. All rights reserved.
//


#import "TDMJRefreshGifFooter.h"

@implementation TDMJRefreshGifFooter

- (void)prepare
{
    [super prepare];
    
    // 设置正在刷新状态的动画图片
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_0%zd", i]];
        [refreshingImages addObject:image];
    }
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
}
@end
