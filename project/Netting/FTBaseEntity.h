//
//  FBBaseEntity.h
//  FbLife_ios
//
//  Created by 周群 on 2019/5/22.
//  Copyright © 2019 北京竹柯科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension/MJExtension.h>

NS_ASSUME_NONNULL_BEGIN

@interface FTBaseEntity : NSObject
+ (NSArray *)parseObjectArrayWithKeyValues:(id)json;//parseObjectArrayWithJSONData
+ (id)parseObjectWithKeyValues:(NSDictionary *)keyValues;
@end

NS_ASSUME_NONNULL_END
