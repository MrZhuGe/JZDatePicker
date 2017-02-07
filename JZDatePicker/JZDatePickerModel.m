//
//  JZDatePickerModel.m
//  JZDatePicker
//
//  Created by 郑家柱 on 2017/2/5.
//  Copyright © 2017年 Mobcb. All rights reserved.
//

#import "JZDatePickerModel.h"
#import "JZDatePickerConfig.h"

@interface JZDatePickerModel ()

@property (nonatomic, strong) NSCalendar        *calendar;

@property (nonatomic, strong) NSDate            *currentDate;

@end

@implementation JZDatePickerModel


- (instancetype)init {
    self = [super init];
    if (self) {
        
        [self initConfig];
        [self initModel];
    }
    return self;
}

// MARK: 配置
- (void)initConfig {
    
    self.currentDates = [NSMutableArray array];
    self.calendar = [NSCalendar currentCalendar];
    self.currentDate = [NSDate date];
}

// MARK: 初始化
- (void)initModel {
    
    [self setup];
}

- (void)setup {
    
    NSInteger indexAtBegin = [self indexAtBeginning:MonthTypeCurrent];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    for (NSInteger index = 0; index < MAXDAYCOUNT; ++index) {
        
        components.day = index - indexAtBegin;
        NSDate *date = [self.calendar dateByAddingComponents:components toDate:[self atBeginning:MonthTypeCurrent] options:0];
        [self.currentDates addObject:date];
    }
    
    NSLog(@"date:%@", self.currentDates);
}

// MARK: 开始索引
- (NSInteger)indexAtBeginning:(MonthType)month {
    
    NSInteger indexOfBegin = [self.calendar ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitWeekOfMonth forDate:[self atBeginning:month]];
    return indexOfBegin - 1;
}

// MARK: 结束索引
- (NSInteger)indexAtEnd:(MonthType)month {
    
    NSRange rangeDays = [self.calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[self atBeginning:month]];
    
    NSInteger indexAtBegin = [self indexAtBeginning:MonthTypeCurrent];
    
    return rangeDays.length + indexAtBegin - 1;
}

// MARK: 开始日期
- (NSDate *)atBeginning:(MonthType)month {
    
    NSDateComponents *components = [self.calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[self date:month]];
    components.day = 1;
    
    NSDate *date = [self.calendar dateFromComponents:components];
    
    return date ? date : [NSDate date];
}

// MARK: 当前日期
- (NSDate *)date:(MonthType)month {
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    if (month == MonthTypePrevious) {
        components.month = -1;
    } else if (month == MonthTypeCurrent) {
        components.month = 0;
    } else {
        components.month = 1;
    }
    
    NSDate *date = [self.calendar dateByAddingComponents:components toDate:self.currentDate options:NSCalendarWrapComponents];
    
    return date ? date : [NSDate date];
}

// MARK: 日期显示格式 eg:12
- (NSString *)dayString:(NSDate *)date {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone localTimeZone];
    formatter.dateFormat = @"dd";
    
    NSString *day = [formatter stringFromDate:date];
    return day;
}

// MARK: 年月显示格式 eg:2017年2月
- (NSString *)monthString:(NSDate *)date {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone localTimeZone];
    formatter.dateFormat = @"yyyy年MM月";
    
    NSString *month = [formatter stringFromDate:date];
    return month;
}

// MARK: 当前年月
- (NSString *)currentDateString {
    
    NSDate *date = [self date:MonthTypeCurrent];
    NSString *current = [self monthString:date];
    return current;
}

// MARK: 切换月份
- (void)switchMonth:(MonthType)month {
    
    [self.currentDates removeAllObjects];
    
    self.currentDate = month == MonthTypeCurrent ? [NSDate date] : [self date:month];
    
    [self setup];
}

@end
