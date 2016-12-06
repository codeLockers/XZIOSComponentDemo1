//
//  ViewController.m
//  XZIOSComponentDemo1
//
//  Created by 徐章 on 2016/12/6.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "ViewController.h"
#import "XZMediator+ModuleAActions.h"
#import "XZTableViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableviewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            UIViewController *viewController = [[XZMediator shareInstance] XZMediator_viewControllerForModuleA];
            [self presentViewController:viewController animated:YES completion:nil];
        }
            break;
        case 1:
        {
            UIViewController *viewController = [[XZMediator shareInstance] XZMediator_viewControllerForModuleA];
            [self.navigationController pushViewController:viewController animated:YES];
        }
            break;
        case 2:
        {
            [[XZMediator shareInstance] XZMediator_presentImage:@{@"content":@"image",@"image":[UIImage imageNamed:@"image"]}];
        }
            break;
        case 3:
        {
            [[XZMediator shareInstance] XZMediator_presentImage:@{@"content":@"image"}];
        }
            break;
        case 4:
        {
            [[XZMediator shareInstance] XZMediator_showAlertWithMessage:@"A" cancelAction:^(NSDictionary *info) {
                NSLog(@"cancel");
            } confirmAction:^(NSDictionary *info) {
                NSLog(@"confirm");
            }];
        }
            break;
        case 5:
        {
            
            UIViewController *viewController = [[XZMediator shareInstance] XZMediator_viewControllerForTableView];
            [self presentViewController:viewController animated:YES completion:nil];
            
        }
            break;
        default:
            break;
    }
}


#pragma mark - Getter && Setter
- (UITableView *)tableView{

    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    
    return _tableView;
}

- (NSArray *)dataSource{

    if (!_dataSource) {
        _dataSource = @[@"present detail view controller", @"push detail view controller", @"present image", @"present image when error", @"show alert", @"table view cell"];
    }
    return _dataSource;
}
@end
