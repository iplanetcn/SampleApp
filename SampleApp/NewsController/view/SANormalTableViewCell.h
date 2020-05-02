//
//  NormalTableViewCell.h
//  SampleApp
//
//  Created by John Lee on 2020/4/24.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SAListItem;

/// 点击删除按钮
@protocol SANormalTableViewCellDelege <NSObject>

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;

@end

/// 新闻列表视图
@interface SANormalTableViewCell : UITableViewCell

@property (nonatomic, weak, readwrite) id<SANormalTableViewCellDelege> delegate;

- (void)layoutTableViewCellWithItem:(SAListItem *)item;

- (NSString *)cellTitleString;

@end

NS_ASSUME_NONNULL_END
