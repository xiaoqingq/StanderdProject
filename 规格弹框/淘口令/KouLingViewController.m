//
//  KouLingViewController.m
//  规格弹框
//
//  Created by qing on 2017/10/26.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "KouLingViewController.h"

@interface KouLingViewController ()

@end

@implementation KouLingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"口令";
    self.view.backgroundColor = [UIColor whiteColor];

    UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 200, 14)];
    titleLable.text = self.share;
    titleLable.textColor = [UIColor blueColor ];
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:titleLable];

    


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
