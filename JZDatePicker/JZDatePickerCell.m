//
//  JZDatePickerCell.m
//  JZDatePicker
//
//  Created by 郑家柱 on 2017/2/5.
//  Copyright © 2017年 Mobcb. All rights reserved.
//

#import "JZDatePickerCell.h"

@implementation JZDatePickerCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initView];
    }
    return self;
}

// MARK: 初始化
- (void)initView {
    
    self.itemL = [[UILabel alloc] initWithFrame:self.contentView.frame];
    self.itemL.backgroundColor = [UIColor whiteColor];
    self.itemL.font = [UIFont systemFontOfSize:14];
    self.itemL.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.itemL];
    
    self.activityIV = [[UIImageView alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width - 15, 2, 12, 12)];
    [self.contentView addSubview:self.activityIV];
    
    self.signIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 19, 19)];
    self.signIV.center = CGPointMake(self.contentView.center.x + 8, self.contentView.center.y + 8);
    [self.contentView addSubview:self.signIV];
}

// MARK: Setter
- (void)setIsActivity:(BOOL)isActivity {
    
    _isActivity = isActivity;
    
    self.activityIV.image = [UIImage imageNamed:@"JZDatePickerBundle.bundle/jz_activity"];
    self.activityIV.hidden = !isActivity;
}

- (void)setIsSigned:(BOOL)isSigned {
    
    _isSigned = isSigned;
    
    self.signIV.image = [UIImage imageNamed:@"JZDatePickerBundle.bundle/jz_other_sign"];
    self.signIV.hidden = !isSigned;
}

- (void)setIsTodaySigned:(BOOL)isTodaySigned {
    
    _isTodaySigned = isTodaySigned;
    
    self.signIV.image = [UIImage imageNamed:@"JZDatePickerBundle.bundle/jz_today_sign"];
}

@end
