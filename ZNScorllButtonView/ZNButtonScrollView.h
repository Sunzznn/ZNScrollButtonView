//
//  ZNButtonScrollView.h
//  ZNScorllButtonView
//
//  Created by 孙兆能 on 16/5/23.
//  Copyright © 2016年 孙兆能. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZNButtonScrollView : UIScrollView

//按钮的宽度（默认是60）
@property (nonatomic,assign) CGFloat buttonWidth;
//按钮字体颜色 (默认是灰色)
@property (nonatomic,strong) UIColor * buttonTitleColor;
//按钮选中颜色 (默认是浅蓝色）
@property (nonatomic,strong) UIColor * buttonSelectedColor;
//传入字符串数组 （按钮的名称）
@property (nonatomic,strong) NSArray * buttonNamesArray;
//buttonsArray里面是根据传进来的名字创建好的button（tag由322开始递增）
@property (nonatomic,readonly,strong) NSArray * buttonsArray;

@end
