//
//  BaseResponseModel.h
//  PinjamN
//
//  Created by 一刻 on 2025/12/26.
//

#import "BaseResponseEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseResponseModel : BaseResponseEntity

@property (nonatomic, strong)NSString *code;
@property (nonatomic, strong)id data;
@property (nonatomic, strong)NSString *msg;

@property (nonatomic, strong)NSString *bolivia;
@property (nonatomic, assign)BOOL success;
@property (nonatomic, strong)id interim;
@property (nonatomic, strong)NSString *deception;

@end

NS_ASSUME_NONNULL_END
