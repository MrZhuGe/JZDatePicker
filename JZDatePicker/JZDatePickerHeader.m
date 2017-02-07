//
//  JZDatePickerHeader.m
//  JZDatePicker
//
//  Created by 郑家柱 on 2017/2/5.
//  Copyright © 2017年 Mobcb. All rights reserved.
//

#import "JZDatePickerHeader.h"
#import "JZDatePickerConfig.h"

@interface JZDatePickerHeader ()

// 上个月
@property (nonatomic, strong) UIButton  *rightBtn;

// 下个月
@property (nonatomic, strong) UIButton  *leftBtn;

@end

@implementation JZDatePickerHeader

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initView];
    }
    return self;
}

// MARK: 初始化
- (void)initView {
    
    // 当前月份
    self.currentL = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 90, 20)];
    self.currentL.center = CGPointMake(self.frame.size.width/2, 15);
    self.currentL.font = [UIFont systemFontOfSize:16];
    self.currentL.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.currentL];
    
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftBtn.frame = CGRectMake(0, 0, self.currentL.frame.origin.x, 30);
    self.leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, self.currentL.frame.origin.x/2, 0, 0);
    self.leftBtn.tag = JZTargetTypePrevious;
    [self.leftBtn setImage:[UIImage imageNamed:@"JZDatePickerBundle.bundle/jz_arrow_left"] forState:UIControlStateNormal];
    [self addSubview:self.leftBtn];
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightBtn.frame = CGRectMake(self.currentL.frame.origin.x + self.currentL.frame.size.width, 0, self.currentL.frame.origin.x, 30);
    self.rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, self.currentL.frame.origin.x/2);
    self.rightBtn.tag = JZTargetTypeNext;
    [self.rightBtn setImage:[UIImage imageNamed:@"JZDatePickerBundle.bundle/jz_arrow_right"] forState:UIControlStateNormal];
    [self addSubview:self.rightBtn];
    
    // 星期名称
    NSArray *weekNames = @[@"日", @"一", @"二", @"三", @"四", @"五", @"六"];
    CGFloat width = self.frame.size.width/MAXWEEKCOUNT, height = 20, y = self.frame.size.height - height - 5;
    NSInteger i = 0;
    for (NSString *weekName in weekNames) {
        
        UILabel *weekL = [[UILabel alloc] initWithFrame:CGRectMake(width * i, y, width, height)];
        weekL.font = [UIFont systemFontOfSize:16];
        weekL.text = weekName;
        weekL.textColor = [UIColor lightGrayColor];
        weekL.textAlignment = NSTextAlignmentCenter;
        [self addSubview:weekL];
        
        ++i;
    }
}

// 点击事件
- (void)addTarget:(id)target action:(SEL)action {
    
    [self.leftBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [self.rightBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

@end
