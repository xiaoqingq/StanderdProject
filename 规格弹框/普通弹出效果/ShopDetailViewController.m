//
//  ShopDetailViewController.m
//  规格弹框
//
//  Created by qing on 2017/10/25.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "ShopDetailViewController.h"
#import "UIViewExt.h"
#import "ChooseView.h"
#import "FormatView.h"

@interface ShopDetailViewController ()<ChooseViewDelegate,FormatViewDelegate>{
    NSArray *_itemArray;
    NSArray *_item2Array;
    ChooseView *_popView;
    
}

@end

@implementation ShopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor yellowColor];
    
    
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


- (void)popAction:(UIButton *)button{
    
    
    if (_popView==nil) {
        _popView = [[ChooseView alloc]initWithFrame:CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight)];
        _popView.delegate = self;
        _popView.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.1];
        [self.view addSubview:_popView];
    }

    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeAction:)];
    [_popView addGestureRecognizer:tap];

    
    [UIView animateWithDuration:0.15 animations:^{
        _popView.top = 0;
    }];
    
    _itemArray = @[@"30*300",@"30*300",@"30*300",@"30*300",@"30*300"];
    FormatView *formatView = [[FormatView alloc]initWithTitle:@"规格" titleArr:_itemArray andFrame:CGRectMake(0, 0, kScreenWidth,50)];
    formatView.tag = 500;
    formatView.delegate = self;
    [_popView.scrollView addSubview:formatView];
    
    _item2Array = @[
      @[@"紫色",@"花色",@"黄色",@"小猴花色",@"紫色"],
      @[@"紫色",@"花色",@"黄色",@"小猴花色",@"紫色",@"花朵色",@"绿色植物色",@"紫色",@"花色",@"黄色",@"小猴花色",@"紫色",@"花朵色",@"绿色植物色"],
      @[@"花色",@"黄色",@"小猴花色",@"紫色"],
      @[@"紫色",@"花色",@"黄色",@"小猴花色",@"紫色",@"黄色",@"小猴花色",@"紫色",@"花朵色"],
      @[@"黄色",@"小猴花色",@"紫色",@"黄色",@"小猴花色"]
      ];
    NSInteger index = arc4random() % 5;
    FormatView *formatView2 = [[FormatView alloc]initWithTitle:@"花色" titleArr:_item2Array[index] andFrame:CGRectMake(0, formatView.bottom, kScreenWidth,50)];
    formatView2.tag = 600;
    formatView2.delegate = self;

    [_popView.scrollView addSubview:formatView2];
    
    _popView.scrollView.contentSize = CGSizeMake(0, formatView2.bottom+100);
    _popView.countView.top = formatView2.bottom+30;

   
    
    
}

- (void)closeChooseView{
    
    [UIView animateWithDuration:0.15 animations:^{
        _popView.top = kScreenHeight+20;
    }completion:^(BOOL finished) {

        _popView = nil;
    }];

    
}

- (void)closeAction:(UITapGestureRecognizer *)tap{
    
    CGPoint point = [tap locationInView:_popView];
    if (point.y<kScreenHeight/3.0) {
        
        [UIView animateWithDuration:0.15 animations:^{
            _popView.top = kScreenHeight+20;
        }completion:^(BOOL finished) {
            _popView = nil;
        }];
    }
}


- (void)addToCarAction {
    
    UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"加入购物车成功" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alerView show];

    
}


- (void)buyAction {
    
    UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"立即购买" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alerView show];

    
}


-(void)selectBtnTitle:(NSString *)title andBtn:(UIButton *)btn{
    
    FormatView *format1 = [_popView viewWithTag:500];
    if ([_itemArray containsObject:title]) {
        
        for (UIButton *button in format1.btnView.subviews) {
            if (button.selected) {
                
                for (NSString *titleStr in _itemArray) {
                    if ([format1.selectBtn.titleLabel.text isEqualToString:titleStr]) {
                        
                        //获得点击的按钮的ID、标题
                        NSInteger index = random()%5;
                        NSArray *array = _item2Array [index];
                        FormatView *format2 = [_popView viewWithTag:600];
                        [format2 removeFromSuperview];
                        FormatView *formatView2 = [[FormatView alloc]initWithTitle:@"花色" titleArr:array andFrame:CGRectMake(0, format1.bottom, kScreenWidth,50)];
                        formatView2.tag = 600;
                        formatView2.delegate = self;
                        [_popView.scrollView addSubview:formatView2];
                        _popView.scrollView.contentSize = CGSizeMake(0, formatView2.bottom+100);
                        _popView.countView.top = formatView2.bottom+30;

                    }
                    
                }
                
            }
        }
    }else{
      
        FormatView *format2 = [_popView viewWithTag:600];
        
        for (UIButton *button in format2.btnView.subviews) {
            if (button.selected) {
                UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:@"提示" message:button.titleLabel.text delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
                [alerView show];
                //保存加入购物车或立即购买的商品
                
            }
        }

        
    }
    
    
    
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
