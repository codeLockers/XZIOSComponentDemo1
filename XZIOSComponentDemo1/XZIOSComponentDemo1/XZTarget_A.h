//
//  XZTarget_A.h
//  XZIOSComponentDemo1
//
//  Created by 徐章 on 2016/12/6.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XZTarget_A : NSObject

- (UIViewController *)Action_nativeFetchModuleAViewController:(NSDictionary *)params;
- (UIViewController *)Action_nativeFetchTableViewContrller:(NSDictionary *)params;
- (id)Action_nativePresentImage:(NSDictionary *)params;
- (id)Action_showAlert:(NSDictionary *)params;

@end
