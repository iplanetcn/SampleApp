//
//  VideoViewController.m
//  SampleApp
//
//  Created by John Lee on 2020/4/23.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import "SAVideoViewController.h"
#import "SAVideoCoverView.h"
#import "SAVideoToolbar.h"

@interface SAVideoViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation SAVideoViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage systemImageNamed:@"video"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    flowlayout.minimumLineSpacing = 10;
    flowlayout.minimumInteritemSpacing = 10;
    flowlayout.itemSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.width / 16 * 9 + SAVideoToolbarHeight);

    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowlayout];

    collectionView.delegate = self;
    collectionView.dataSource = self;

    [collectionView registerClass:[SAVideoCoverView class] forCellWithReuseIdentifier:@"SAVideoCoverView"];

    [self.view addSubview:collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SAVideoCoverView" forIndexPath:indexPath];
    if ([cell isKindOfClass:[SAVideoCoverView class]]) {
        [((SAVideoCoverView *) cell) layoutWithVideoCoverUrl:@"cover" videoUrl:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    }
    return cell;
}

/*
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item % 3 == 0) {
        return CGSizeMake(self.view.frame.size.width, 100);
    } else {
        return CGSizeMake((self.view.frame.size.width - 10) / 2, 300);
    }
}
*/

@end
