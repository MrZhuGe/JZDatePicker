//
//  ViewController.m
//  JZDatePicker
//
//  Created by 郑家柱 on 2017/2/5.
//  Copyright © 2017年 Mobcb. All rights reserved.
//

#import "ViewController.h"
#import "JZDatePicker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// MARK: 初始化
- (void)initView {
    
    JZDatePicker *datePicker = [[JZDatePicker alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 307)];
    [self.view addSubview:datePicker];
}

@end
