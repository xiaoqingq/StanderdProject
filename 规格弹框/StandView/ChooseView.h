//
//  ChooseView.h
//  规格弹框
//
//  Created by qing on 2017/10/25.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChooseViewDelegate <NSObject>

- (void)closeChooseView;

- (void)addToCarAction;
- (void)buyAction;


@end


@interface ChooseView : UIView

@property (nonatomic,weak)id<ChooseViewDelegate>delegate;
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UIView *countView;


@end
