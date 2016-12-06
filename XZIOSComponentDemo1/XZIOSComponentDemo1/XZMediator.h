//
//  XZMediator.h
//  XZIOSComponentDemo1
//
//  Created by 徐章 on 2016/12/6.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XZMediator : NSObject

+ (instancetype)shareInstance;

//远程组件调用入口
//- (void)performActionWithUrl:(NSURL *)url completion:(void(^)(NSDictionary *info))completion;

// 本地组件调用入口
- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params shouldCacheTarget:(BOOL)shouleCacheTarget;
- (void)releaseCachedTargetWithTargetName:(NSString *)targetName;
@end
