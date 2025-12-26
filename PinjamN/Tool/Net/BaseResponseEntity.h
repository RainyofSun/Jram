//
//  BaseResponseEntity.h
//  PinjamN
//
//  Created by 一刻 on 2025/12/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseResponseEntity : NSObject

+ (NSArray *)parseObjectArrayWithKeyValues:(id)json;//parseObjectArrayWithJSONData
+ (id)parseObjectWithKeyValues:(NSDictionary *)keyValues;

@end

NS_ASSUME_NONNULL_END
