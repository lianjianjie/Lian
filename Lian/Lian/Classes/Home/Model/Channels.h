//
//  Channels.h
//  Lian
//  频道
//  Created by 廉建杰 on 2017/1/5.
//  Copyright © 2017年 lianjianjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
@interface Channels : NSObject

/**
 *  id
 */
@property (nonatomic, assign) NSInteger channelsID;

/**
 *  eidtable
 */
@property (nonatomic, assign) NSInteger editable;

/**
 * name
 */
@property (nonatomic, copy) NSString *name;
@end
