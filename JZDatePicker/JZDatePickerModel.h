//
//  JZDatePickerModel.h
//  JZDatePicker
//
//  Created by 郑家柱 on 2017/2/5.
//  Copyright © 2017年 Mobcb. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MonthType) {
    
    // 上个月
    MonthTypePrevious,
    
    // 当前月
    MonthTypeCurrent,
    
    // 下个月
    MonthTypeNext
};

@interface JZDatePickerModel : NSObject

// 当前月份日期数组
@property (nonatomic, strong) NSMutableArray    *currentDates;

// MARK: 开始索引
- (NSInteger)indexAtBeginning:(MonthType)month;

// MARK: 结束索引
- (NSInteger)indexAtEnd:(MonthType)month;

// MARK: 日期显示格式 eg:12
- (NSString *)dayString:(NSDate *)date;

// MARK: 当前年月
- (NSString *)currentDateString;

// MARK: 切换月份
- (void)switchMonth:(MonthType)month;

@end
