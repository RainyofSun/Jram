//
//  BaseResponseEntity.m
//  PinjamN
//
//  Created by 一刻 on 2025/12/26.
//

#import "BaseResponseEntity.h"

@implementation BaseResponseEntity

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
