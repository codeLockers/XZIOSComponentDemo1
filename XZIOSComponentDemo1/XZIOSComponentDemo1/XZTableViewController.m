//
//  XZTableViewController.m
//  XZIOSComponentDemo1
//
//  Created by 徐章 on 2016/12/6.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZTableViewController.h"
#import "XZMediator+ModuleAActions.h"

@interface XZTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *returnBtn;
@end

@implementation XZTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.returnBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

    [[XZMediator shareInstance] XZMediator_configTableviewCell:cell withTitle:@"title" atIndexPath:indexPath];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    return [[XZMediator shareInstance] XZMediator_tableviewCellWithIdentifier:NSStringFromClass([UITableViewCell class]) tableView:tableView];
}

#pragma mark Action_Methods
- (void)returnBtn_Pressed{

    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark Getter && Setter
- (UITableView *)tableView{

    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-50)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIButton *)returnBtn{

    if (!_returnBtn) {
        
        _returnBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-50, [UIScreen mainScreen].bounds.size.width, 50)];
        _returnBtn.backgroundColor = [UIColor redColor];
        [_returnBtn setTitle:@"return" forState:UIControlStateNormal];
        [_returnBtn addTarget:self action:@selector(returnBtn_Pressed) forControlEvents:UIControlEventTouchUpInside];
    }
    return _returnBtn;
}
@end
