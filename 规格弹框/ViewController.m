//
//  ViewController.m
//  规格弹框
//
//  Created by qing on 2017/10/25.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "ShopDetailViewController.h"
#import "KouLingViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.title = @"商城";
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *shareStr = [UIPasteboard generalPasteboard].string;
    if ([shareStr containsString:@"####"]) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"口令" message:shareStr preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            [self skipToDetail:shareStr];
            
        }]];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
   
    
    
    [self setUI];


}


- (void)setUI{

    
    UIButton * commitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    commitButton.frame = CGRectMake(100, kScreenHeight-100, kScreenWidth-200, 50);
    [commitButton setTitle:@"详情" forState:UIControlStateNormal];
    [commitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    commitButton.backgroundColor = [UIColor blueColor];
    commitButton.layer.cornerRadius  =4;
    commitButton.layer.masksToBounds = YES;
    [commitButton addTarget:self action:@selector(popAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:commitButton];
    
    
    

    
    
}


- (void)skipToDetail:(NSString *)share{
    
    KouLingViewController *deatilCtrl = [[KouLingViewController alloc]init];
    deatilCtrl.share = share;
    deatilCtrl.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:deatilCtrl animated:YES];

}


- (void)popAction:(UIButton *)button{
    
    
    //    //1、类似淘宝的弹出效果---辅助视图控制器
//    DetailViewController *deatilCtrl = [[DetailViewController alloc]init];
//    [self presentViewController:deatilCtrl animated:YES completion:nil];
    
    
    //普通弹出
    ShopDetailViewController *deatilCtrl = [[ShopDetailViewController alloc]init];
    deatilCtrl.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:deatilCtrl animated:YES];

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
