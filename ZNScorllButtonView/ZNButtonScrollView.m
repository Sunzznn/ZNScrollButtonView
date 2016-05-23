//
//  ZNButtonScrollView.m
//  ZNScorllButtonView
//
//  Created by 孙兆能 on 16/5/23.
//  Copyright © 2016年 孙兆能. All rights reserved.
//

#import "ZNButtonScrollView.h"

//scrollView的宽高
#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height

@interface ZNButtonScrollView()<UIScrollViewDelegate>

@property (nonatomic,strong) UIView * bottomView;

@end

@implementation ZNButtonScrollView

- (void)setButtonNamesArray:(NSArray *)buttonNamesArray
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //没有东西就什么都不用做
    if (buttonNamesArray.count == 0) {
        return;
    }
    
    //如果外面没有设置代理则设置代理为scrollView自己
    if (!self.delegate) {
        self.delegate = self;
    }
    
    
    //底部横条高度
    CGFloat bottomViewHeight = 3;
    
    //默认按钮宽度是60
    if (!self.buttonWidth) {
        self.buttonWidth = 60;
    }
    //默认按钮选中颜色是浅蓝色
    if (!self.buttonSelectedColor) {
        self.buttonSelectedColor = [UIColor colorWithRed:52 / 255.0 green:178 / 255.0 blue:1 alpha:1];
    }
    //默认按钮字体颜色是浅灰色
    if (!self.buttonTitleColor) {
        self.buttonTitleColor = [UIColor lightGrayColor];
    }
    self.showsHorizontalScrollIndicator = NO;
    self.contentSize = CGSizeMake(buttonNamesArray.count * self.buttonWidth, HEIGHT);
    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT - bottomViewHeight, self.buttonWidth, bottomViewHeight)];
    self.bottomView.backgroundColor = self.buttonSelectedColor;
    [self addSubview:self.bottomView];
    
    NSMutableArray * btnsArray = [NSMutableArray new];
    for (int i = 0; i < buttonNamesArray.count; i ++) {
        NSString * buttonName = @" ";
        if ([buttonNamesArray[i] isKindOfClass:[NSString class]]) {
            
            buttonName = buttonNamesArray[i];
        }
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:buttonName forState:UIControlStateNormal];
        [btn setTitleColor:self.buttonSelectedColor forState:UIControlStateSelected];
        [btn setTitleColor:self.buttonTitleColor forState:UIControlStateNormal];
        btn.frame = CGRectMake(i * self.buttonWidth, 0, self.buttonWidth, HEIGHT);
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 322 + i;
        
        if (i == 0) {
            btn.selected = YES;
        }
        
        
        [btnsArray addObject:btn];
        
        [self addSubview:btn];
        
    }
    _buttonsArray = btnsArray;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //MARK:这里可以做scrollView滑动时候的事情
    
}

- (void)btnClicked:(UIButton *)btn
{
    for (UIButton * button in _buttonsArray) {
        button.selected = NO;
    }
    btn.selected = YES;
    
    CGFloat offsetX = btn.frame.origin.x - (WIDTH - self.buttonWidth) / 2;
    
    if ((offsetX + WIDTH) > self.contentSize.width)
    {
        offsetX = self.contentSize.width - WIDTH;
    }
    else if (offsetX < 0)
    {
        offsetX = 0;
    }
    if (offsetX < 0) {
        offsetX = 0;
    }
    
    [self setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    
    [UIView animateWithDuration:0.2 animations:^{
        CGRect bottomViewFrame = self.bottomView.frame;
        bottomViewFrame.origin.x = btn.frame.origin.x;
        self.bottomView.frame = bottomViewFrame;
    }];
}

@end
