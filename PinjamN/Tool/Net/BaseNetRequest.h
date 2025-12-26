//
//  BaseNetRequest.h
//  PinjamN
//
//  Created by 一刻 on 2025/12/26.
//

#import <Foundation/Foundation.h>
#import "BaseResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^SuccessBlock)(BaseResponseModel *model);
typedef void (^FailureBlock)(NSError *error);

@interface BaseNetRequest : NSObject

@property (nonatomic, copy) SuccessBlock successBlock;
@property (nonatomic, copy) FailureBlock failureBlock;


// 发送post请求
+(void)postWithURLServiceString:(NSString *)serviceName parameters:(id )parameters success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock;
// 发送get请求
+ (void)getWithURLServiceString:(NSString *)serviceName parameters:(id)parameters success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock;

+ (void)uploadImage:(UIImage *)image parameters:(id)parameters success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock;

@end

NS_ASSUME_NONNULL_END
