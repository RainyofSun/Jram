//
//  UIImage+Exif.h
//  Pods
//
//  Created by Nikita Tuk on 12/02/15.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (Exif)

- (void)zx_cornerImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor completion:(void (^)(UIImage *))completion;

@end
