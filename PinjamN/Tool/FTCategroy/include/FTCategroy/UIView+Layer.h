//
//  UIView+Layer.h
//  BAFCategories
//
//  Created by jackiehoo on 28/09/2017.
//

#import <UIKit/UIKit.h>

@interface UIView (Layer)
/*
 *  下面几个属性是针对 self.layer 快捷操作
 */
@property (nonatomic) IBInspectable CGPoint anchorPoint;
@property (nonatomic) IBInspectable CGFloat anchorPointZ;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic, nullable) IBInspectable UIColor *borderColor;
@property (nonatomic, nullable) UIImage *contentImage;
@property (nonatomic) CGRect contentsRect;
@property (nonatomic) CGRect contentsCenter;
@end
