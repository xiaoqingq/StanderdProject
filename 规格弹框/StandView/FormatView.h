//
//  FormatView.h
//  规格弹框
//
//  Created by qing on 2017/10/26.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FormatViewDelegate <NSObject>

-(void)selectBtnTitle:(NSString *)title andBtn:(UIButton *)btn;


@end


@interface FormatView : UIView

@property(nonatomic,copy)NSString *title;
@property(nonatomic,strong)NSArray *rankArray;
@property(nonatomic,strong)UIView *packView;
@property(nonatomic,strong)UIView *btnView;
@property(nonatomic,strong)UIButton *selectBtn;



@property(nonatomic,assign)id<FormatViewDelegate> delegate;

-(instancetype)initWithTitle:(NSString *)title titleArr:(NSArray *)titleArr andFrame:(CGRect)frame;

-(instancetype)initWithTitle:(NSString *)title  andFrame:(CGRect)frame;


@end
