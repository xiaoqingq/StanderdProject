//
//  RootViewController.m
//  规格弹框
//
//  Created by qing on 2017/10/25.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imgV = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imgV.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:imgV];
    
    //详情页内容写这里
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
