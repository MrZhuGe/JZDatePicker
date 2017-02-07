//
//  JZDatePicker.m
//  JZDatePicker
//
//  Created by 郑家柱 on 2017/2/5.
//  Copyright © 2017年 Mobcb. All rights reserved.
//

#import "JZDatePicker.h"
#import "JZDatePickerHeader.h"
#import "JZDatePickerConfig.h"
#import "JZDatePickerCell.h"
#import "JZDatePickerModel.h"

static NSString *JZDATEPICKERCELLID = @"JZDATEPICKERCELLID";

@interface JZDatePicker () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView      *collectionView;

@property (nonatomic, strong) JZDatePickerHeader    *header;

@property (nonatomic, strong) JZDatePickerModel     *dateModel;

@end

@implementation JZDatePicker

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initConfig];
        [self initView];
    }
    return self;
}

// MARK: 配置
- (void)initConfig {
    
    self.dateModel = [[JZDatePickerModel alloc] init];
}

// MARK: 初始化
- (void)initView {
    
    self.header = [[JZDatePickerHeader alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 60)];
    self.header.currentL.text = [self.dateModel currentDateString];
    [self.header addTarget:self action:@selector(onHeaderClicked:)];
    [self addSubview:self.header];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.header.frame.size.height, self.frame.size.width, 247) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = SEPARATORCOLOR;
    self.collectionView.scrollEnabled = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self addSubview:self.collectionView];
    
    [self.collectionView registerClass:[JZDatePickerCell class] forCellWithReuseIdentifier:JZDATEPICKERCELLID];
}

// MARK: UICollectionViewDelegate && UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return MAXDAYCOUNT;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((collectionView.frame.size.width - 6 - 2)/MAXWEEKCOUNT, 40);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(1, 1, 1, 1);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    JZDatePickerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:JZDATEPICKERCELLID forIndexPath:indexPath];
    
    cell.itemL.text = [self.dateModel dayString:self.dateModel.currentDates[indexPath.row]];
    
    if (indexPath.row < [self.dateModel indexAtBeginning:MonthTypeCurrent]) {
        cell.itemL.backgroundColor = OTHERCOLOR;
        cell.itemL.textColor = OTHERFONTCOLOR;
    } else if (indexPath.row > [self.dateModel indexAtEnd:MonthTypeCurrent]) {
        cell.itemL.backgroundColor = OTHERCOLOR;
        cell.itemL.textColor = OTHERFONTCOLOR;
    } else {
        cell.itemL.backgroundColor = CURRENTCOLOR;
        cell.itemL.textColor = CURRENTFONTCOLOR;
    }
    
    return cell;
}

// MARK: 点击事件
- (void)onHeaderClicked:(UIButton *)button {
    
    if (JZTargetTypePrevious == button.tag) {
        
        // 上个月
        [self.dateModel switchMonth:MonthTypePrevious];
    } else {
        
        // 下个月
        [self.dateModel switchMonth:MonthTypeNext];
    }
    
    self.header.currentL.text = [self.dateModel currentDateString];
    [self.collectionView reloadData];
}

@end
