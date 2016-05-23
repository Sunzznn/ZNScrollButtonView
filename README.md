# ZNScrollButtonView
简单封装了一个装载按钮的scrollView，传入button名字自动创建按钮，scrollView的偏移根据点击按钮改变，始终置于最佳位置，可以根据自己的需求更改，操作简单

在需要用的地方加上下面的代码即可
    
    self.znScrollView = [[ZNButtonScrollView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 30)];
    self.znScrollView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:self.znScrollView];
    
    //根据自己喜好设置，也可以不设置
    self.znScrollView.buttonWidth = 100;
    self.znScrollView.buttonTitleColor = [UIColor greenColor];
    self.znScrollView.buttonSelectedColor = [UIColor purpleColor];
    
    self.znScrollView.buttonNamesArray = @[@"1",@"2",@"3",@"3.5",@"4",@"5",@"6",@"7",@"8"];
    
    //buttonsArray是封装好的scrollView里面根据传进来的名字创建好的button
    NSLog(@"%@",self.znScrollView.buttonsArray);
    
    
