//
//  JZDatePickerCell.h
//  JZDatePicker
//
//  Created by 郑家柱 on 2017/2/5.
//  Copyright © 2017年 Mobcb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZDatePickerCell : UICollectionViewCell

@property (nonatomic, strong) UILabel       *itemL;

@property (nonatomic, strong) UIImageView   *activityIV;

@property (nonatomic, strong) UIImageView   *signIV;

// 是否有活动
@property (nonatomic, assign) BOOL          isActivity;

// 是否签到
@property (nonatomic, assign) BOOL          isSigned;

// 今天是否签到
@property (nonatomic, assign) BOOL          isTodaySigned;

@end
