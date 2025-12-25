//
//  FBBaseEntity.m
//  FbLife_ios
//
//  Created by 周群 on 2019/5/22.
//  Copyright © 2019 北京竹柯科技有限公司. All rights reserved.
//

#import "FTBaseEntity.h"

@implementation FTBaseEntity
+ (NSArray *)parseObjectArrayWithKeyValues:(id)json
{
	if([NSJSONSerialization isValidJSONObject:json]){
		NSArray * result = nil;
		@try {
			result = [self mj_objectArrayWithKeyValuesArray:json];
		}
		@catch (NSException *exception) {
			NSLog(@"Entity里的error = %@", exception.description);
			return nil;
		}
		return result;
	}else{
		return [NSArray array];
		
	}
}

+ (id)parseObjectWithKeyValues:(NSDictionary *)keyValues
{
	id result = nil;
	@try {
		result = [self mj_objectWithKeyValues:keyValues];
	}
	@catch (NSException *exception) {
		NSLog(@"Entity里的error = %@",exception.description);
		return nil;
	}
	return result;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
	
}
@end
