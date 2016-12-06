//
//  XZMediator+ModuleAActions.m
//  XZIOSComponentDemo1
//
//  Created by 徐章 on 2016/12/6.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZMediator+ModuleAActions.h"

NSString * const kXZMediatorTargetA = @"A";
NSString * const kXZMediatorActionNativeFetchModuleAViewController = @"nativeFetchModuleAViewController";
NSString * const kXZMediatorActionNativeFetchTableViewViewController = @"nativeFetchTableViewContrller";
NSString * const KXZMediatorActionPresentImage = @"nativePresentImage";
NSString * const kXZMediatorActionShowAlert = @"showAlert";
NSString * const KXZMediatorActionCell = @"cell";
NSString * const kXZMediatorActionConfigCell = @"configCell";

@implementation XZMediator (ModuleAActions)

- (UIViewController *)XZMediator_viewControllerForModuleA{

    UIViewController *viewController = [self performTarget:kXZMediatorTargetA action:kXZMediatorActionNativeFetchModuleAViewController params:@{@"content":@"iOS组件化开发"} shouldCacheTarget:NO];
    
    if ([viewController isKindOfClass:[UIViewController class]]) {
        return viewController;
    }else{
    
        return [[UIViewController alloc] init];;
    }
}

- (UIViewController *)XZMediator_viewControllerForTableView{

    UIViewController *viewController = [self performTarget:kXZMediatorTargetA action:kXZMediatorActionNativeFetchTableViewViewController params:nil shouldCacheTarget:NO];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        return viewController;
    }else{
        
        return [[UIViewController alloc] init];;
    }
}

- (void)XZMediator_presentImage:(NSDictionary *)params{
    
    [self performTarget:kXZMediatorTargetA action:KXZMediatorActionPresentImage params:params shouldCacheTarget:NO];
}

- (void)XZMediator_showAlertWithMessage:(NSString *)message cancelAction:(void (^)(NSDictionary *))cancelAction confirmAction:(void (^)(NSDictionary *))confirmAction{

    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    if (message) {
        params[@"message"] = message;
    }
    if (cancelAction) {
        params[@"cancelAction"] = cancelAction;
    }
    if (confirmAction) {
        params[@"confirmAction"] = confirmAction;
    }
    
    [self performTarget:kXZMediatorTargetA action:kXZMediatorActionShowAlert params:params shouldCacheTarget:NO];
}

- (UITableViewCell *)XZMediator_tableviewCellWithIdentifier:(NSString *)identifier tableView:(UITableView *)tableview{

    return [self performTarget:kXZMediatorTargetA
                        action:KXZMediatorActionCell
                        params:@{
                                 @"identifier":identifier,
                                 @"tableView":tableview
                                 }
             shouldCacheTarget:YES];
}

- (void)XZMediator_configTableviewCell:(UITableViewCell *)cell withTitle:(NSString *)title atIndexPath:(NSIndexPath *)indexPath{

    [self performTarget:kXZMediatorTargetA
                 action:kXZMediatorActionConfigCell
                 params:@{
                          @"cell":cell,
                          @"title":title,
                          @"indexPath":indexPath
                          }
      shouldCacheTarget:YES];
}

- (void)XZMediator_cleanTableViewCellTarget{

    [self releaseCachedTargetWithTargetName:kXZMediatorTargetA];
}
@end
