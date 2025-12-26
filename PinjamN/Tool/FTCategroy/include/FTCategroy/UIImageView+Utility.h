//
//  UIImageView+Utility.h
//  BAFCategories
//
//  Created by jackiehoo on 28/09/2017.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Utility)
+ (nonnull UIImageView *)imageViewWithImageNamed:(nonnull NSString *)imageName;
+ (nonnull UIImageView *)imageViewWithStretchableImage:(nonnull NSString *)imageName frame:(CGRect)frame;
+ (nullable UIImageView *)imageViewWithImageArray:(nonnull NSArray<NSString *> *)imageArray duration:(NSTimeInterval)duration;
@end
