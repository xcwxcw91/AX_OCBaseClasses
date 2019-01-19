//
//  BaseTableView.h
//  SDUSZ_ELearningPlatform
//
//  Created by sdusz on 2019/1/10.
//  Copyright © 2019年 juziwl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableView : UIView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,assign)BOOL canRefresh;
@property(nonatomic,assign)BOOL canLoadMore;
@property(nonatomic,assign)int page;
@property(nonatomic,assign)int pageSize;
@property(nonatomic,assign)int rows;

@property (strong, nonatomic) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray <BaseSectionModel *>* dataSource;

- (void)getData:(BOOL)isLoadMore;

- (void)config;

- (void)reloadData;

- (void)endMJRefreshing;
@end
