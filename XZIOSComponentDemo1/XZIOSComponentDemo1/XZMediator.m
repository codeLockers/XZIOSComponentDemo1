//
//  XZMediator.m
//  XZIOSComponentDemo1
//
//  Created by 徐章 on 2016/12/6.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZMediator.h"

@interface XZMediator()

@property (nonatomic, strong) NSMutableDictionary *cachedTarget;

@end

@implementation XZMediator

+ (instancetype)shareInstance{

    static XZMediator *mediator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediator = [[XZMediator alloc] init];
    });
    
    return mediator;
}

- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params shouldCacheTarget:(BOOL)shouleCacheTarget{

    NSString *targetClassString = [NSString stringWithFormat:@"XZTarget_%@",targetName];
    NSString *actionString = [NSString stringWithFormat:@"Action_%@:",actionName];
    
    id target = self.cachedTarget[targetClassString];
    if (!target) {
        Class targetClass = NSClassFromString(targetClassString);
        target = [[targetClass alloc] init];
    }
    
    SEL action = NSSelectorFromString(actionString);
    
    if (!target) {
        return nil;
    }
    
    if (shouleCacheTarget) {
        self.cachedTarget[targetClassString] = target;
    }
    
    if ([target respondsToSelector:action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [target performSelector:action withObject:params];
#pragma clang diagnostic pop
    
    }else{
        //处理无响应
        SEL action = NSSelectorFromString(@"notFound:");
        
        if ([target respondsToSelector:action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            return [target performSelector:action withObject:params];
#pragma clang diagnostic pop
        }else{
            //notFound无响应
            [self.cachedTarget removeObjectForKey:targetClassString];
            return nil;
        }
    }
}

- (void)releaseCachedTargetWithTargetName:(NSString *)targetName{
    
    NSString *targetClassString = [NSString stringWithFormat:@"target_%@",targetName];
    [self.cachedTarget removeObjectForKey:targetClassString];
}

#pragma mark - Getters && Setters
- (NSMutableDictionary *)cachedTarget{

    if (!_cachedTarget) {
        _cachedTarget = [[NSMutableDictionary alloc] init];
    }
    return _cachedTarget;
}
@end
