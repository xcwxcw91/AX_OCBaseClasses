//
//  BaseTableView.m
//  SDUSZ_ELearningPlatform
//
//  Created by sdusz on 2019/1/10.
//  Copyright © 2019年 juziwl. All rights reserved.
//

#import "BaseTableView.h"
#import "BaseSectionModel.h"
#import "BaseTableViewCellModel.h"
#import "BaseTableViewCell.h"
#import <objc/runtime.h>
@interface BaseTableView ()

@end

@implementation BaseTableView

- (instancetype)init{
    
    if (self= [super init]) {
        [self commonInit];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}
- (void)commonInit{
    
    self.page=1;
    self.pageSize=10;
    self.rows = 10;
    [self addSubview:self.tableView];
    self.tableView.frame = self.bounds;
    [self config];
}

- (void)config{
    
}

#pragma mark -  Refresh Load 方法
- (void)setCanRefresh:(BOOL)canRefresh{
    
//    _canRefresh=canRefresh;
//    if (canRefresh) {
//
//        if (self.tableView.mj_header==nil) {
//
//            MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
//            //设置header
//            self.tableView.mj_header = header;
//        }
//        else{
//            self.tableView.mj_header.hidden=NO;
//        }
//    }
//    else{
//        self.tableView.mj_header.hidden=YES;
//    }
}

- (void)refreshData{
    
    self.page =1;
    [self getData:NO];
}

- (void)setCanLoadMore:(BOOL)canLoadMore{
    
    _canLoadMore=canLoadMore;
    
//    if (canLoadMore) {
//
//        if (self.tableView.mj_footer==nil) {
//
//            MJRefreshFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
//            self.tableView.mj_footer = footer;
//        }
//        else{
//            [self.tableView.mj_footer resetNoMoreData];
//        }
//    }
//    else{
//        [self.tableView.mj_footer endRefreshingWithNoMoreData];
//    }
}

- (void)loadMoreData{
    
    [self getData:YES];
}

- (void)getData:(BOOL)isLoadMore{
    
}

- (void)reloadData{
    
//    if (self.tableView.mj_header && self.tableView.mj_header.state==MJRefreshStateRefreshing) {
//        [self stopRefresh];
//    }
//    if (self.tableView.mj_footer && (self.tableView.mj_footer.state==MJRefreshStateRefreshing||self.tableView.mj_footer.state==MJRefreshStateNoMoreData)){
//
//        [self stopLoadMore];
//    }
    [self.tableView reloadData];
}

- (void)stopRefresh{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
//        [self.tableView.mj_header endRefreshing];
//        if (self.tableView.mj_footer.state == MJRefreshStateNoMoreData) {
//            [self.tableView.mj_footer resetNoMoreData];
//        }
    });
}

- (void)stopLoadMore{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
//        if (self.tableView.mj_footer.state==MJRefreshStateNoMoreData) {
//            [self.tableView.mj_footer endRefreshingWithNoMoreData];
//        }
//        else if (self.tableView.mj_footer.state==MJRefreshStateRefreshing){
//            [self.tableView.mj_footer endRefreshing];
//        }
    });
}

- (void)endMJRefreshing{
    
    [self stopRefresh];
    [self stopLoadMore];
}

#pragma mark - TableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return  [self.dataSource count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource[section].cellModelCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BaseSectionModel * sectionModel = [self.dataSource objectAtIndex:indexPath.section];
    BaseTableViewCellModel * cellModel = [sectionModel cellModelAtIndex:indexPath.row];
    
    NSString * cellIdentifer = cellModel.cellReuseIdentifer;
    Class cellClassName = NSClassFromString(cellModel.cellClassName);
    
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    
    if (!cell) {
        cell = (BaseTableViewCell *)[[cellClassName alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
        if (!cell) {
            NSAssert(NO, @"cell为nil,检查传入的cellClassName!!!");
        }
    }
    
    if ([cell respondsToSelector:@selector(setCellData:cellModel:)]) {
        
        [cell setCellData:sectionModel cellModel:cellModel];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BaseSectionModel * sectionModel = [self.dataSource objectAtIndex:indexPath.section];
    if ([sectionModel cellModelCount] == 0) {
        return 0;
    }
    BaseTableViewCellModel * cellModel = [sectionModel cellModelAtIndex:indexPath.row];
    
    return cellModel.rowHeight < 0 ? 44.f : cellModel.rowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    BaseSectionModel * sectionModel = [self.dataSource objectAtIndex:indexPath.section];
    BaseTableViewCellModel * cellModel = [sectionModel cellModelAtIndex:indexPath.row];
    Class class = NSClassFromString(cellModel.cellJumpClassName);
    if (!cellModel.cellJumpClassName) {
        return;
    }
    UIViewController * vc = (UIViewController *)[[class alloc] init];
    if (![[AppDelegate currentViewController].navigationController.topViewController isKindOfClass:[vc class]]) {
        
        [[AppDelegate currentViewController].navigationController pushViewController:vc animated:YES];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (self.dataSource.count ==0) {
        return nil;
    }
    BaseSectionModel *sectionModel = [self.dataSource objectAtIndex:section];
    if (sectionModel.cellModelCount==0) {
        return nil;
    }
    if (sectionModel.headerView) {
        if ([sectionModel.headerView respondsToSelector:@selector(section)]) {
            sectionModel.headerView.section = section;
        }
        return sectionModel.headerView;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (self.dataSource.count ==0) {
        return nil;
    }
    BaseSectionModel *sectionModel = [self.dataSource objectAtIndex:section];
    if (sectionModel.cellModelCount==0) {
        return nil;
    }
    if (sectionModel.footerView) {
        if ([sectionModel.footerView respondsToSelector:@selector(section)]) {
            sectionModel.footerView.section = section;
        }
        return sectionModel.footerView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (self.dataSource.count ==0) {
        return 0;
    }
    BaseSectionModel *sectionModel = [self.dataSource objectAtIndex:section];
    if (sectionModel.footerView) {
        return sectionModel.footerView.bounds.size.height;
    }
    
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.dataSource.count ==0) {
        return 0.01;
    }
    BaseSectionModel *sectionModel = [self.dataSource objectAtIndex:section];
    if (sectionModel.headerView) {
        return sectionModel.headerView.bounds.size.height;
    }
    return 0.01;
}

- (UITableViewStyle)tableViewStyle {
    
    return UITableViewStylePlain;
}

# pragma mark - getter
- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:[self tableViewStyle] ];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0.1];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (NSMutableArray<BaseSectionModel *> *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

@end
