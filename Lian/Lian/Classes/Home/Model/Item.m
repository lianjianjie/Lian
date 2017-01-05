//
//  Item.m
//  Lian
//
//  Created by 廉建杰 on 2017/1/5.
//  Copyright © 2017年 lianjianjie. All rights reserved.
//

#import "Item.h"
#import "MJExtension.h"
@implementation Item
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"itemID"] = @"id";
    return dict;
}
@end
