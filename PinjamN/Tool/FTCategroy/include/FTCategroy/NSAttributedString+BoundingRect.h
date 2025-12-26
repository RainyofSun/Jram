//
//  NSAttributedString+BoundingRect.h
//  LabelHeight
//
//  Created by Babytree on 2017/10/17.
//  Copyright © 2017年 Babytree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BBRectInfo : NSObject
@property (nonatomic, assign) BOOL m_NeedToTrimLineSpaceing; // 只有一行需要删除行间距
@property (nonatomic, assign) CGFloat m_With;
@property (nonatomic, assign) CGFloat m_Height;
@end

@interface NSAttributedString (BoundingRect)

- (BBRectInfo *)boundingRectWithMaxSize:(CGSize)maxSize
                                   font:(UIFont *)font
                            lineSpacing:(CGFloat)lineSpacing
                          maxLineNumber:(NSUInteger)maxLineNumber;

@end
