//
//  BaseCollectionSectionModel.h
//  SDUSZ_ELearningPlatform
//
//  Created by sdusz on 2019/1/7.
//  Copyright © 2019年 juziwl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseCollectionReusableViewHeader.h"
#import "BaseCollectionReusableViewFooter.h"
#import "BaseCollectionCellModel.h"

@interface BaseCollectionSectionModel : NSObject

@property (nonatomic, strong) BaseCollectionReusableViewHeader * headerView;
@property (nonatomic, strong) BaseCollectionReusableViewFooter * footerView;

@property (nonatomic, copy) NSString * headerViewClass;
@property (nonatomic, copy) NSString * footerViewClass;


@property (nonatomic, readonly) NSInteger cellModelCount;//该section下的cell/cellModel数量

//section 添加元素(加到最后面)
- (void)addCellModel:(BaseCollectionCellModel *)cellModel;

//在指定index插入元素
- (void)insertCellModel:(BaseCollectionCellModel *)cellModel atIndex:(NSInteger)index;

//section 移除指定index的元素
- (void)removeCellModelAtIndex:(NSInteger)index;

//移除所有元素
- (void)removeAllCellModels;

//获取指定位置的元素
- (BaseCollectionCellModel *)cellModelAtIndex:(NSInteger)index;

//交换两个位置的元素
- (void)switchCellModelAtIndex:(NSInteger)index0 withCellModelAtIndex:(NSInteger)index1;

//获取所有的元素
- (NSArray <BaseCollectionCellModel *> *)getAllCellModels;

//获取元素总数
- (NSInteger)cellModelCount;

//遍历
- (void)enumerateObjectsUsingBlock:(void (NS_NOESCAPE ^)(BaseCollectionCellModel * obj, NSUInteger idx, BOOL *stop))block;

@end
