//
//  BaseTableViewController.h
//  PresentPushTest
//
//  Created by Allen_Xu on 2017/12/2.
//  Copyright © 2017年 SDUSZ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseSectionModel;
@interface BaseTableViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,assign)BOOL canRefresh;
@property(nonatomic,assign)BOOL canLoadMore;
@property(nonatomic,assign)int page;
@property(nonatomic,assign)int pageSize;
@property(nonatomic,assign)int rows;

@property (strong, nonatomic) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray <BaseSectionModel *>* dataSource;

- (void)getData:(BOOL)isLoadMore;

- (void)reloadData;

- (void)endMJRefreshing;

@end
