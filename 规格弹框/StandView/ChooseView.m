//
//  ChooseView.m
//  规格弹框
//
//  Created by qing on 2017/10/25.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "ChooseView.h"

@implementation ChooseView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    
    
    //装载商品信息的视图
    UIView * whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight/3.0, kScreenWidth, kScreenHeight/3.0*2)];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self addSubview:whiteView];
    
    UIButton * closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    closeButton.frame = CGRectMake(kScreenWidth-50, 20, 40, 40);
    [closeButton setTitle:@"关闭" forState:UIControlStateNormal];
    [closeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(closeAction:) forControlEvents:UIControlEventTouchUpInside];
    [whiteView addSubview:closeButton];

    
    UIImageView *headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, -20, 80, 80)];
    headImageView.image = [UIImage imageNamed:@"WechatIMG3.png"];
    headImageView.layer.cornerRadius = 4;
    headImageView.layer.masksToBounds = YES;
    [whiteView addSubview:headImageView];
    
    
    UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(headImageView.right+20, 10, kScreenWidth-120, 14)];
    titleLable.text = @"商品名字";
    titleLable.textColor = [UIColor blackColor];
    titleLable.font = [UIFont systemFontOfSize:14];
    [whiteView addSubview:titleLable];
    
    UILabel *priceLable = [[UILabel alloc]initWithFrame:CGRectMake(headImageView.right+20, titleLable.bottom, kScreenWidth-120, 14)];
    priceLable.text = @"¥123";
    priceLable.textColor = [UIColor redColor];
    priceLable.font = [UIFont systemFontOfSize:14];
    [whiteView addSubview:priceLable];

    
    UIButton * addToCarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addToCarButton.frame = CGRectMake(0, whiteView.height-50, kScreenWidth/2.0, 50);
    [addToCarButton setTitle:@"加入购物车" forState:UIControlStateNormal];
    [addToCarButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    addToCarButton.backgroundColor = [UIColor colorWithRed:87/255.0 green:162/255.0 blue:252/255.0 alpha:1];
    [addToCarButton addTarget:self action:@selector(AddToCarAction:) forControlEvents:UIControlEventTouchUpInside];
    [whiteView addSubview:addToCarButton];

    
    UIButton * buyCarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    buyCarButton.frame = CGRectMake(kScreenWidth/2.0+1, whiteView.height-50, kScreenWidth/2.0, 50);
    [buyCarButton setTitle:@"立即购买" forState:UIControlStateNormal];
    [buyCarButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    buyCarButton.backgroundColor = [UIColor colorWithRed:87/255.0 green:162/255.0 blue:252/255.0 alpha:1];
    [buyCarButton addTarget:self action:@selector(buyCarAction:) forControlEvents:UIControlEventTouchUpInside];
    [whiteView addSubview:buyCarButton];

    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, headImageView.bottom+20, kScreenWidth, whiteView.height-50-80)];
    _scrollView.backgroundColor = [UIColor whiteColor];
    [whiteView addSubview:_scrollView];
    
    
    _countView = [[UIView alloc]initWithFrame:CGRectMake(20, _scrollView.bottom-50, 140, 50)];
    _countView.layer.cornerRadius = 25;
    _countView.layer.masksToBounds = YES;
    _countView.layer.borderColor = [UIColor colorWithRed:87/255.0 green:162/255.0 blue:252/255.0 alpha:1].CGColor;
    _countView.layer.borderWidth = 1;
    [_scrollView addSubview:_countView];
    
    
    UIButton * subButton = [UIButton buttonWithType:UIButtonTypeCustom];
    subButton.frame = CGRectMake(0, 5, 40, 40);
    [subButton setTitle:@"-" forState:UIControlStateNormal];
    [subButton setTitleColor:[UIColor colorWithRed:87/255.0 green:162/255.0 blue:252/255.0 alpha:1] forState:UIControlStateNormal];
    subButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [subButton addTarget:self action:@selector(subAction:) forControlEvents:UIControlEventTouchUpInside];
    [_countView addSubview:subButton];
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(subButton.right, 5, 60, 40)];
    textField.placeholder = @"1";
    textField.font = [UIFont systemFontOfSize:15];
    textField.textAlignment = NSTextAlignmentCenter;
    [_countView addSubview:textField];
    
    
    UIButton * addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.frame = CGRectMake(textField.right, 5, 40, 40);
    [addButton setTitle:@"+" forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor colorWithRed:87/255.0 green:162/255.0 blue:252/255.0 alpha:1] forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [addButton addTarget:self action:@selector(addAction:) forControlEvents:UIControlEventTouchUpInside];
    [_countView addSubview:addButton];

    
}

- (void)closeAction:(UIButton *)button{
    
    if ([_delegate respondsToSelector:@selector(closeChooseView)]) {
        [_delegate closeChooseView];
    }
    
}

- (void)AddToCarAction:(UIButton *)button{
    
    if ([_delegate respondsToSelector:@selector(addToCarAction)]) {
        [_delegate addToCarAction];
    }
    
}

- (void)buyCarAction:(UIButton *)button{
    
    if ([_delegate respondsToSelector:@selector(buyAction)]) {
        [_delegate buyAction];
    }
    
}


- (void)addAction:(UIButton *)button{
    
    
}

- (void)subAction:(UIButton *)button{
    
    
}


@end
