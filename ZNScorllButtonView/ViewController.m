//
//  ViewController.m
//  ZNScorllButtonView
//
//  Created by 孙兆能 on 16/5/23.
//  Copyright © 2016年 孙兆能. All rights reserved.
//

#import "ViewController.h"
#import "ZNButtonScrollView.h"

@interface ViewController ()

@property (nonatomic,strong) ZNButtonScrollView * znScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.znScrollView = [[ZNButtonScrollView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 30)];
    self.znScrollView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:self.znScrollView];
    
    
    self.znScrollView.buttonWidth = 60;
    self.znScrollView.buttonTitleColor = [UIColor greenColor];
    self.znScrollView.buttonSelectedColor = [UIColor purpleColor];
    self.znScrollView.buttonNamesArray = @[@"1",@"2",@"3",@"3.5",@"4",@"5",@"6",@"7",@"8"];
    
    //buttonsArray是封装好的scrollView里面根据传进来的名字创建好的button
    NSLog(@"%@",self.znScrollView.buttonsArray);
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor blueColor];
    btn.frame = CGRectMake(0, 0, 50, 50);
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClicked:(UIButton *)btn
{
    self.znScrollView.buttonNamesArray = @[@"we",@"are",@"family"];
}

@end
