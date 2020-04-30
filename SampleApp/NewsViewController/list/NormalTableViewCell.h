//
//  NormalTableViewCell.h
//  SampleApp
//
//  Created by John Lee on 2020/4/24.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NormalTableViewCellDelege <NSObject>

- (void)tableViewCell:(UITableViewCell *) tableViewCell clickDeleteButton:(UIButton *) deleteButton;

@end

@interface NormalTableViewCell : UITableViewCell

@property(nonatomic, weak, readwrite) id<NormalTableViewCellDelege> delegate;

- (void)layoutTableViewCell;

- (NSString *)cellTitleString;

@end

NS_ASSUME_NONNULL_END
