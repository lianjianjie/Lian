//
//  NetWorkTool.m
//  Lian
//
//  Created by 廉建杰 on 2017/1/5.
//  Copyright © 2017年 lianjianjie. All rights reserved.
//

#import "NetWorkTool.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
@interface NetWorkTool()
@end
@implementation NetWorkTool

+(void)initialize{
    [SVProgressHUD setMinimumDismissTimeInterval:1.0];
}
#pragma mark - 单例

static id _instance;
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+ (instancetype)sharedNetworkTool {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone {
    return _instance;
}

#pragma mark - 工具类方法
/**
 *  加载数据
 */
- (void)loadDataInfo:(NSString *)URLString
          parameters:(id)parameters
             success:(void (^)(id _Nullable responseObject))success
             failure:(void (^)(NSError *error))failure {
    
    [SVProgressHUD showWithStatus:@"正在加载..."];
    [[AFHTTPSessionManager manager] GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 回调成功之后的block
        success(responseObject);
        [SVProgressHUD showSuccessWithStatus:@"加载完成!"];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 回调失败之后的block
        [SVProgressHUD showErrorWithStatus:@"加载失败~"];
        //        failure(error);
    }];
    
    [SVProgressHUD dismiss];
}


- (void)loadDataInfoPost:(NSString *)URLString
              parameters:(id)parameters
                 success:(void (^)(id _Nullable responseObject))success
                 failure:(void (^)(NSError *error))failure {
    [[AFHTTPSessionManager manager] POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 回调成功之后的block
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 回调失败之后的block
        failure(error);
    }];
    
    [SVProgressHUD dismiss];
}


- (void)loadDataInfoDelete:(NSString *)URLString
                parameters:(id)parameters
                   success:(void (^)(id _Nullable responseObject))success
                   failure:(void (^)(NSError *error))failure {
    [[AFHTTPSessionManager manager] DELETE:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 回调成功之后的block
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 回调失败之后的block
        failure(error);
    }];
    
    [SVProgressHUD dismiss];
}
@end
