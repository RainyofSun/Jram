//
//  UIImagePickerController+Blocks.h
//  Moments
//
//  Created by jiangzhichao on 15/11/11.
//  Copyright © 2015年 jiangzhichao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIImagePickerControllerDidFinishPickingMediaWithInfoBlock)(UIImagePickerController* picker, NSDictionary* info);
typedef void (^UIImagePickerControllerDidCancelBlock)(UIImagePickerController* picker);
typedef void (^UIImagePickerControllerDidShowViewControllerBlock)(UINavigationController* navigationController, UIViewController* viewController, BOOL animated);
typedef void (^UIImagePickerControllerWillShowViewControllerBlock)(UINavigationController* navigationController, UIViewController* viewController, BOOL animated);

@interface UIImagePickerController (Blocks)

- (id)useBlocksForDelegate;
- (void)onDidFinishPickingMediaWithInfo:(UIImagePickerControllerDidFinishPickingMediaWithInfoBlock)block;
- (void)onDidCancel:(UIImagePickerControllerDidCancelBlock)block;
- (void)onDidShowViewController:(UIImagePickerControllerDidShowViewControllerBlock)block;
- (void)onWillShowViewController:(UIImagePickerControllerWillShowViewControllerBlock)block;

@end

@interface UIImagePickerControllerBlocks : NSObject <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    UIImagePickerControllerDidFinishPickingMediaWithInfoBlock _didFinishPickingMediaWithInfoBlock;
    UIImagePickerControllerDidCancelBlock _didCancelBlock;
    UIImagePickerControllerDidShowViewControllerBlock _didShowViewControllerBlock;
    UIImagePickerControllerWillShowViewControllerBlock _willShowViewControllerBlock;
}

@property(nonatomic, copy) UIImagePickerControllerDidFinishPickingMediaWithInfoBlock didFinishPickingMediaWithInfoBlock;
@property(nonatomic, copy) UIImagePickerControllerDidCancelBlock didCancelBlock;
@property(nonatomic, copy) UIImagePickerControllerDidShowViewControllerBlock didShowViewControllerBlock;
@property(nonatomic, copy) UIImagePickerControllerWillShowViewControllerBlock willShowViewControllerBlock;

@end
