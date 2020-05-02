//
//  ContactViewController.m
//  SampleApp
//
//  Created by John Lee on 2020/4/22.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import "SANewsViewController.h"
#import "SANormalTableViewCell.h"
#import "NewsDetailViewController.h"
#import "SADeleteCellView.h"
#import "SAListLoader.h"
#import "SAListItem.h"

@interface SANewsViewController ()<UITableViewDelegate, UITableViewDataSource, SANormalTableViewCellDelege>

@property (nonatomic, strong, readwrite) UITableView *tableView;

@property (nonatomic, strong, readwrite) NSArray *dataArray;

@property (nonatomic, strong, readwrite) SAListLoader *listLoader;

@end

@implementation SANewsViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _dataArray = @[].mutableCopy;
//        for (int i = 0; i < 20; i++) {
//            [_dataArray addObject:@(i)];
//        }
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage systemImageNamed:@"book"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:_tableView];

    self.listLoader = [[SAListLoader alloc] init];
    __weak typeof(self) wself = self;
    [self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<SAListItem *> * _Nonnull dataArray) {
        __strong typeof(self) strongSelf = wself;
        strongSelf.dataArray = dataArray;
        [strongSelf.tableView reloadData];
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 在回收池中查找,如果查找不到则创建
    SANormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[SANormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.delegate = self;
    }

    [cell layoutTableViewCellWithItem: [self.dataArray objectAtIndex:[indexPath row]]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SAListItem *item = [self.dataArray objectAtIndex:[indexPath row]];
    NewsDetailViewController *detailViewController = [[NewsDetailViewController alloc] initWithUrlString: item.url];
    SANormalTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    detailViewController.title = [NSString stringWithFormat:@"%@", cell.cellTitleString];
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey: item.uniqueKey];
}

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton {
//    DeleteCellView *view = [[DeleteCellView alloc] initWithFrame:self.view.bounds];
//    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
//    __weak typeof(self) wself = self;
//    [view showDeleteViewFromPoint:rect.origin clickBlock:^{
//        __strong typeof(self) strongSelf = wself;
//        [strongSelf.dataArray removeLastObject];
//        [strongSelf.tableView deleteRowsAtIndexPaths:@[[strongSelf.tableView indexPathForCell:tableViewCell]] withRowAnimation:(UITableViewRowAnimationAutomatic)];
//    }];
}

@end
