//
//  Channels.m
//  Lian
//
//  Created by 廉建杰 on 2017/1/5.
//  Copyright © 2017年 lianjianjie. All rights reserved.
//

#import "Channels.h"

@implementation Channels
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"channelsID"] = @"id";
    return dic;
}
@end
