//
//  FormatView.m
//  规格弹框
//
//  Created by qing on 2017/10/26.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "FormatView.h"

@implementation FormatView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)initWithTitle:(NSString *)title titleArr:(NSArray *)titleArr andFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        self.title = title;
        self.rankArray = titleArr;
        self.frame = frame;
        [self initSubViews];
        
        
    }
    return self;
    
}

- (void)initSubViews{
    
    self.packView = [[UIView alloc] initWithFrame:self.frame];
    self.packView.top = 0;
    
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.5)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.packView addSubview:line];
    
    UILabel *titleLB = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, kScreenWidth, 25)];
    titleLB.text = self.title;
    titleLB.font = [UIFont systemFontOfSize:15];
    [self.packView addSubview:titleLB];

    //button
    self.btnView = [[UIView alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(titleLB.frame), kScreenWidth, 40)];
    [self.packView addSubview:self.btnView];
    
    CGFloat btnLeft = 0;
    CGFloat viewHeight = 0;
    NSInteger count = 0;

    for (int i=0; i<self.rankArray.count;i++) {
        
        NSString *str = self.rankArray[i];
        UIButton * commitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        commitButton.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.2];
        [commitButton setTitle:str forState:UIControlStateNormal];
        [commitButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [commitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        commitButton.layer.cornerRadius = 4;
        commitButton.layer.masksToBounds = YES;
        
        [commitButton addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        
        NSDictionary *dict = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:13] forKey:NSFontAttributeName];
        CGSize btnSize = [str sizeWithAttributes:dict];
        
        commitButton.width = btnSize.width+30;
        commitButton.height = btnSize.height+12;
        
        if (i==0) {
            commitButton.left = 20;
            btnLeft += CGRectGetMaxX(commitButton.frame);
        }else{
            btnLeft += CGRectGetMaxX(commitButton.frame)+20;
            if (btnLeft>kScreenWidth) {
                count++;
                commitButton.left = 20;
                btnLeft = CGRectGetMaxX(commitButton.frame);
            }else{
                commitButton.left += btnLeft-commitButton.width;
                
            }
        }
        commitButton.top += count*(commitButton.height+10)+10;
        viewHeight = CGRectGetMaxY(commitButton.frame)+10;
        
        [self.btnView addSubview:commitButton];
        
    }

    
    self.btnView.height = viewHeight;
    self.packView.height = self.btnView.height+titleLB.bottom;
    self.height = self.packView.height;
    [self addSubview:self.packView];

    
}






- (void)selectAction:(UIButton *)btn{
    
    if (![self.selectBtn isEqual:btn]) {
        
        self.selectBtn.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.2];
        self.selectBtn.selected = NO;
    }else{
        btn.backgroundColor = [UIColor colorWithRed:87/255.0 green:162/255.0 blue:252/255.0 alpha:1 ];
    }
    btn.backgroundColor = [UIColor colorWithRed:87/255.0 green:162/255.0 blue:252/255.0 alpha:1 ];
    btn.selected = YES;
    
    self.selectBtn = btn;
    
    if ([self.delegate respondsToSelector:@selector(selectBtnTitle:andBtn:)]) {
        
        [self.delegate selectBtnTitle:btn.titleLabel.text andBtn:self.selectBtn];
    }
    
    
}


@end
