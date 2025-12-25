//
//  FBNetting.h
//  FbLife_ios
//
//  Created by 周群 on 2019/5/22.
//  Copyright © 2019 北京竹柯科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTResponseModel.h"

typedef void (^SuccessBlock)(FTResponseModel *model);
typedef void (^FailureBlock)(NSError *error);

@interface FTNetting : NSObject
@property (nonatomic, copy) SuccessBlock successBlock;
@property (nonatomic, copy) FailureBlock failureBlock;


// 发送post请求
+(void)postWithURLServiceString:(NSString *)serviceName parameters:(id )parameters success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock;
// 发送get请求
+ (void)getWithURLServiceString:(NSString *)serviceName parameters:(id)parameters success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock;

+ (void)uploadImage:(UIImage *)image parameters:(id)parameters success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock;

@end

