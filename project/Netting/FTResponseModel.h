//
//  FTResponseModel.h
//  project
//
//  Created by 周群 on 2021/11/16.
//

#import "FTBaseEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface FTResponseModel : FTBaseEntity
@property (nonatomic, strong)NSString *code;
@property (nonatomic, strong)id data;
@property (nonatomic, strong)NSString *msg;

@property (nonatomic, strong)NSString *bolivia;
@property (nonatomic, assign)BOOL success;
@property (nonatomic, strong)id interim;
@property (nonatomic, strong)NSString *deception;

@end

NS_ASSUME_NONNULL_END
