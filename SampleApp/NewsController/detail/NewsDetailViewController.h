//
//  NewsDetailViewController.h
//  SampleApp
//
//  Created by John Lee on 2020/4/26.
//  Copyright © 2020 John Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SAMediator.h"

NS_ASSUME_NONNULL_BEGIN

//@interface NewsDetailViewController : UIViewController<SADetailViewControllerProtocol>
@interface NewsDetailViewController : UIViewController

- (instancetype)initWithUrlString:(NSString *)urlString;

@end

NS_ASSUME_NONNULL_END
