//
//  XZMediator+ModuleAActions.h
//  XZIOSComponentDemo1
//
//  Created by 徐章 on 2016/12/6.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZMediator.h"
#import <UIKit/UIKit.h>

@interface XZMediator (ModuleAActions)

- (UIViewController *)XZMediator_viewControllerForModuleA;
- (UIViewController *)XZMediator_viewControllerForTableView;

- (void)XZMediator_presentImage:(NSDictionary *)params;

- (void)XZMediator_showAlertWithMessage:(NSString *)message cancelAction:(void(^)(NSDictionary *info))cancelAction confirmAction:(void(^)(NSDictionary *info))confirmAction;

- (UITableViewCell *)XZMediator_tableviewCellWithIdentifier:(NSString *)identifier tableView:(UITableView *)tableview;

- (void)XZMediator_configTableviewCell:(UITableViewCell *)cell withTitle:(NSString *)title atIndexPath:(NSIndexPath *)indexPath;

- (void)XZMediator_cleanTableViewCellTarget;

@end
