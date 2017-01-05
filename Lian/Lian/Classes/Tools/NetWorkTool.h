//
//  NetWorkTool.h
//  Lian
//
//  Created by 廉建杰 on 2017/1/5.
//  Copyright © 2017年 lianjianjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkTool : NSObject<NSCopying>
+(instancetype)sharedNetworkTool;
-(void)loadDataInfo:(nullable NSString *)URLString
         parameters:(nullable id)parameters
            success:(nullable void(^)(id _Nullable responseObject))success
            failure:(nullable void(^)(NSError *_Nullable error))failure;

- (void)loadDataInfoPost:(nullable NSString *)URLString
              parameters:(nullable id)parameters
                 success:(nullable void (^)(id _Nullable responseObject))success
                 failure:(nullable void (^)(NSError *_Nullable error))failure;

- (void)loadDataInfoDelete:(nullable NSString *)URLString
                parameters:(nullable id)parameters
                   success:(nullable void (^)(id _Nullable responseObject))success
                   failure:(nullable void (^)(NSError *_Nullable error))failure;
@end
