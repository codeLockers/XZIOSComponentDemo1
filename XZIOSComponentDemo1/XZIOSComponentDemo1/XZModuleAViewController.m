//
//  XZModuleAViewController.m
//  XZIOSComponentDemo1
//
//  Created by 徐章 on 2016/12/6.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZModuleAViewController.h"

@interface XZModuleAViewController ()
@property (nonatomic, strong) UIButton *returnBtn;
@end

@implementation XZModuleAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.textLab];
    [self.view addSubview:self.returnBtn];
    [self.view addSubview:self.imageView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions_Methods
- (void)returnBtn_Pressed{

    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - Getter && Setter
- (UILabel *)textLab{

    if (!_textLab) {
        
        _textLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 150, 50)];
        _textLab.font = [UIFont systemFontOfSize:15.0f];
    }
    return _textLab;
}

- (UIImageView *)imageView{

    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}


- (UIButton *)returnBtn{

    if (!_returnBtn) {
        _returnBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 50, 50)];
        _returnBtn.backgroundColor = [UIColor redColor];
        [_returnBtn setTitle:@"return" forState:UIControlStateNormal];
        [_returnBtn addTarget:self action:@selector(returnBtn_Pressed) forControlEvents:UIControlEventTouchUpInside];
    }
    return _returnBtn;
}
@end
