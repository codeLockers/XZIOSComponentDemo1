//
//  XZTarget_A.m
//  XZIOSComponentDemo1
//
//  Created by 徐章 on 2016/12/6.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZTarget_A.h"
#import "XZModuleAViewController.h"
#import "XZTableViewController.h"

typedef void (^XZAlertCallbackBlock)(NSDictionary *info);

@implementation XZTarget_A

- (UIViewController *)Action_nativeFetchModuleAViewController:(NSDictionary *)params{

    XZModuleAViewController *moduleAVc = [[XZModuleAViewController alloc] init];
    moduleAVc.textLab.text = params[@"content"];
    return moduleAVc;
}

- (UIViewController *)Action_nativeFetchTableViewContrller:(NSDictionary *)params{

    XZTableViewController *tableviewVc = [[XZTableViewController alloc] init];
    return tableviewVc;
}

- (id)Action_nativePresentImage:(NSDictionary *)params{

    XZModuleAViewController *moduleAVc = [[XZModuleAViewController alloc] init];
    moduleAVc.textLab.text = params[@"content"];

    UIImage *image = params[@"image"];
    if (!image) 
        image = [UIImage imageNamed:@"noImage"];
    
    moduleAVc.imageView.image = image;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:moduleAVc animated:YES completion:nil];
    return nil;
}

- (id)Action_showAlert:(NSDictionary *)params{

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        XZAlertCallbackBlock callback = params[@"cancelAction"];
        if (callback) {
            callback(@{@"alertAction":action});
        }
    }];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        XZAlertCallbackBlock callback = params[@"confirmAction"];
        if (callback) {
            callback(@{@"alertAction":action});
        }
    }];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"iOS组件化" message:params[@"message"] preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:cancelAction];
    [alertController addAction:confirmAction];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    
    return nil;
}

- (UITableViewCell *)Action_cell:(NSDictionary *)params{

    UITableView *tableView = params[@"tableView"];
    NSString *identifier = params[@"identifier"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

- (id)Action_configCell:(NSDictionary *)params{

    NSString *title = params[@"title"];
    NSIndexPath *indexPath = params[@"indexPath"];
    UITableViewCell *cell = params[@"cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %ld",title,indexPath.row];
    return nil;
}

@end
