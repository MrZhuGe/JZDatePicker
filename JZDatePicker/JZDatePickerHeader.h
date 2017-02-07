//
//  JZDatePickerHeader.h
//  JZDatePicker
//
//  Created by 郑家柱 on 2017/2/5.
//  Copyright © 2017年 Mobcb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JZTargetType) {
    JZTargetTypePrevious = 100,
    JZTargetTypeNext = 101
};

@interface JZDatePickerHeader : UIView

// 当前日期
@property (nonatomic, strong) UILabel *currentL;

// 点击事件
- (void)addTarget:(id)target action:(SEL)action;

@end
