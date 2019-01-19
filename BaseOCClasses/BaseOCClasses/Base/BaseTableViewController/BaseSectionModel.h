//
//  BaseSectionModel.h
//  PresentPushTest
//
//  Created by Allen_Xu on 2017/12/2.
//  Copyright © 2017年 SDUSZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseSectionHeaderView.h"
#import "BaseSectionFooterView.h"
@class BaseTableViewCellModel;

@interface BaseSectionModel : NSObject

//简单业务情况下可以使用与sectionModel绑定的header/footer
@property (nonatomic, strong) BaseSectionHeaderView * headerView;
@property (nonatomic, strong) BaseSectionFooterView * footerView;

@property (nonatomic, readonly) NSInteger cellModelCount;//该section下的cell/cellModel数量

//section 添加元素(加到最后面) 单个添加
- (void)addCellModel:(BaseTableViewCellModel *)cellModel;

- (void)addCellModelsFromArray:(NSArray <BaseTableViewCellModel *>*)arr;

//在指定index插入元素
- (void)insertCellModel:(BaseTableViewCellModel *)cellModel atIndex:(NSInteger)index;

//section 移除指定index的元素
- (void)removeCellModelAtIndex:(NSInteger)index;

//移除所有元素
- (void)removeAllCellModels;

//获取指定位置的元素
- (BaseTableViewCellModel *)cellModelAtIndex:(NSInteger)index;

//交换两个位置的元素
- (void)switchCellModelAtIndex:(NSInteger)index0 withCellModelAtIndex:(NSInteger)index1;

//获取所有的元素
- (NSArray <BaseTableViewCellModel *> *)getAllCellModels;

//获取元素总数
- (NSInteger)cellModelCount;

//遍历
- (void)enumerateObjectsUsingBlock:(void (NS_NOESCAPE ^)(BaseTableViewCellModel * obj, NSUInteger idx, BOOL *stop))block;

@end
