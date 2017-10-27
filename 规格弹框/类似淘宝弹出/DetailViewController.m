//
//  DetailViewController.m
//  规格弹框
//
//  Created by qing on 2017/10/25.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "DetailViewController.h"
#import "ChooseView.h"
#import "RootViewController.h"


@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];

    //1、类似淘宝的弹出效果
//    [self initSubViews];
    
    //2、普通弹出
    
    
    UIButton * commitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    commitButton.frame = CGRectMake(100, kScreenHeight-70, kScreenWidth-200, 50);
    [commitButton setTitle:@"弹框" forState:UIControlStateNormal];
    [commitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    commitButton.backgroundColor = [UIColor blueColor];
    commitButton.layer.cornerRadius  =4;
    commitButton.layer.masksToBounds = YES;
    [commitButton addTarget:self action:@selector(popAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:commitButton];


}

/*
- (void)initSubViews{
    
    ChooseView * popView = [[ChooseView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height *2/3)];
//    popView.backgroundColor = [UIColor redColor];
    popView.backgroundColor = [UIColor clearColor];

    //加个阴影
    popView.layer.shadowColor = [UIColor blackColor].CGColor;
    popView.layer.shadowOffset = CGSizeMake(0.5, 0.5);
    popView.layer.shadowOpacity = 0.8;
    popView.layer.shadowRadius = 5;
    
//    //导航栏一定要加载ROOTVC上面
    RootViewController * root = [[RootViewController alloc]init];
    root.title = @"详情";
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:root];
    
    [self createPopVCWithRootVC:nav andPopView:popView];

    UITapGestureRecognizer *tap_close = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(close)];
    popView.userInteractionEnabled = YES;
    [popView addGestureRecognizer:tap_close];
    
    
}
 
 */

- (void)popAction:(UIButton *)button{
    
    //1、类似淘宝的弹出效果
//    [self performSelector:@selector(show) withObject:self afterDelay:0];
    


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
