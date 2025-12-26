//
//  BaseNetRequest.m
//  PinjamN
//
//  Created by 一刻 on 2025/12/26.
//

#import "BaseNetRequest.h"

@implementation BaseNetRequest

+ (void)getWithURLServiceString:(NSString *)serviceName parameters:(id)parameters success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    /**
     *  可以接受的类型
     */
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 60;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",
                                                                              @"text/html",
                                                                              @"text/json",
                                                                              @"text/plain",
                                                                              @"text/javascript",
                                                                              @"text/xml",
                                                                              @"image/*"]];
    if (parameters == nil) {
        parameters = [NSMutableDictionary dictionary];
    }
    NSMutableDictionary *headerDic = [NSMutableDictionary dictionaryWithDictionary:parameters];
    UIDevice *device = [UIDevice currentDevice];
    NSString *systemVersion = [device systemVersion];
    NSString *modelName = [device model];
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = infoDic[@"CFBundleShortVersionString"];
    [headerDic safe_setObject:currentVersion forKey:@"rotunda"];
    [headerDic safe_setObject:modelName forKey:@"capitol"];
    [headerDic safe_setObject:[CommenObject getUUID] forKey:@"podium"];
    [headerDic safe_setObject:systemVersion forKey:@"hour"];
    [headerDic safe_setObject:[OSLW_Defaults stringForKey:MainToken] forKey:@"intend"];
    [headerDic safe_setObject:[OSLW_Defaults stringForKey:MainLeft] forKey:@"left"];
    [headerDic safe_setObject:[OSLW_Defaults stringForKey:MainIDFA] forKey:@"desire"];

    NSString *urlString = [([OSLW_Defaults stringForKey:MainMainUrl].hasTextContent ? [OSLW_Defaults stringForKey:MainMainUrl] : MainUrl) stringByAppendingString:serviceName];
    if ([serviceName containsString:@"http"]) {
        urlString = serviceName;
    }
    
    [manager GET:urlString parameters:headerDic headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict = nil;
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            dict = responseObject;
        } else {
            dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        }
        BaseResponseModel *model = [BaseResponseModel parseObjectWithKeyValues:dict];
        model.code = model.bolivia;
        model.data = model.interim;
        model.msg = model.deception;
        model.success = [model.code isEqualToString:@"0"];
        if ([model.bolivia isEqualToString:@"-2"]) {
            [CommenObject loginAction];
            return;
        }
        if (successBlock) {
            successBlock(model);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureBlock) {
            failureBlock(error);
        }
    }];
}

+(void)postWithURLServiceString:(NSString *)serviceName parameters:(id )parameters success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 60;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",
                                                                              @"text/html",
                                                                              @"text/json",
                                                                              @"text/plain",
                                                                              @"text/javascript",
                                                                              @"text/xml",
                                                                              @"image/*"]];
    UIDevice *device = [UIDevice currentDevice];
    NSString *systemVersion = [device systemVersion];
    NSString *modelName = [device model];
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = infoDic[@"CFBundleShortVersionString"];
    
    NSString *urlString = [([OSLW_Defaults stringForKey:MainMainUrl].hasTextContent ? [OSLW_Defaults stringForKey:MainMainUrl] : MainUrl) stringByAppendingString:serviceName];
    if ([serviceName containsString:@"http"]) {
        urlString = serviceName;
    }
    urlString = [NSString stringWithFormat:@"%@?intend=%@&left=%@&hour=%@&capitol=%@&podium=%@&desire=%@&rotunda=%@",urlString,[OSLW_Defaults stringForKey:MainToken],[OSLW_Defaults stringForKey:MainLeft],systemVersion,modelName,[CommenObject getUUID],[OSLW_Defaults stringForKey:MainIDFA],currentVersion];
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    if (parameters == nil) {
        parameters = [NSMutableDictionary dictionary];
    }
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parameters];
    [manager POST:urlString parameters:nil headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSArray *keyArr = dic.allKeys;
        for (int k = 0; k < keyArr.count; k++) {
            NSString *keyStr = [keyArr safe_objectAtIndex:k];
            id value = [parameters stringForKey:keyStr];
            if ([value hasContent]) {
                [formData appendPartWithFormData:[value dataUsingEncoding:NSUTF8StringEncoding] name:keyStr];
            }
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict = nil;
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            dict = responseObject;
        } else {
            dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        }
        BaseResponseModel *model = [BaseResponseModel parseObjectWithKeyValues:dict];
        model.code = model.bolivia;
        model.data = model.interim;
        model.msg = model.deception;
        model.success = [model.code isEqualToString:@"0"];
        if ([model.bolivia isEqualToString:@"-2"]) {
            [CommenObject loginAction];
            return;
        }
        if (successBlock) {
            successBlock(model);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureBlock) {
            failureBlock(error);
        }
    }];
    
}

+ (void)uploadImage:(UIImage *)image parameters:(id)parameters success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 60;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",
                                                                              @"text/html",
                                                                              @"text/json",
                                                                              @"text/plain",
                                                                              @"text/javascript",
                                                                              @"text/xml",
                                                                              @"image/*"]];
    UIDevice *device = [UIDevice currentDevice];
    NSString *systemVersion = [device systemVersion];
    NSString *modelName = [device model];
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = infoDic[@"CFBundleShortVersionString"];
    NSString *urlString = [([OSLW_Defaults stringForKey:MainMainUrl].hasTextContent ? [OSLW_Defaults stringForKey:MainMainUrl] : MainUrl) stringByAppendingString:snowsifans];
    urlString = [NSString stringWithFormat:@"%@?intend=%@&left=%@&hour=%@&capitol=%@&podium=%@&desire=%@&rotunda=%@",urlString,[OSLW_Defaults stringForKey:MainToken],[OSLW_Defaults stringForKey:MainLeft],systemVersion,modelName,[CommenObject getUUID],[OSLW_Defaults stringForKey:MainIDFA],currentVersion];
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    if (parameters == nil) {
        parameters = [NSMutableDictionary dictionary];
    }
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parameters];
    [manager POST:urlString parameters:nil headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *imageData = [CommenObject compressImageToMB:image];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        // 设置时间格式
        [formatter setDateFormat:@"yyyyMMddHHmmss"];
        NSString *dateString = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString  stringWithFormat:@"%@.png", dateString];
        
        [formData appendPartWithFileData:imageData name:@"attach" fileName:fileName mimeType:@"multipart/form-data"];
        NSArray *keyArr = dic.allKeys;
        for (int k = 0; k < keyArr.count; k++) {
            NSString *keyStr = [keyArr safe_objectAtIndex:k];
            id value = [parameters stringForKey:keyStr];
            if ([value hasContent]) {
                [formData appendPartWithFormData:[value dataUsingEncoding:NSUTF8StringEncoding] name:keyStr];
            }
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict = nil;
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            dict = responseObject;
        } else {
            dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        }
        BaseResponseModel *model = [BaseResponseModel parseObjectWithKeyValues:dict];
        model.code = model.bolivia;
        model.data = model.interim;
        model.msg = model.deception;
        model.success = [model.code isEqualToString:@"0"];
        if ([model.bolivia isEqualToString:@"-2"]) {
            [CommenObject loginAction];
            return;
        }
        if (successBlock) {
            successBlock(model);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureBlock) {
            failureBlock(error);
        }
    }];
}

@end
