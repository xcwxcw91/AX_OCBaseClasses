//
//  BaseCollectionSectionModel.m
//  SDUSZ_ELearningPlatform
//
//  Created by sdusz on 2019/1/7.
//  Copyright © 2019年 juziwl. All rights reserved.
//

#import "BaseCollectionSectionModel.h"
#import <os/lock.h>

@interface BaseCollectionSectionModel ()
{
    os_unfair_lock _lock;
}
@property (strong, nonatomic) NSMutableArray <BaseCollectionCellModel *> * objects;//存储BaseCollectionCellModel
@end

@implementation BaseCollectionSectionModel

//section 添加元素(加到最后面)
- (void)addCellModel:(BaseCollectionCellModel *)cellModel{
    
    if (cellModel) {
        [self lock];
        [self.objects addObject:cellModel];
        [self unlock];
    }
}
//在指定index插入元素
- (void)insertCellModel:(BaseCollectionCellModel *)cellModel atIndex:(NSInteger)index{
    
    if (index >= self.objects.count) {
        NSAssert(NO, @"数组越界");
        return;
    }
    [self lock];
    [self.objects insertObject:cellModel atIndex:index];
    [self unlock];
}
//section 移除指定index的元素
- (void)removeCellModelAtIndex:(NSInteger)index{
    if (index >= self.objects.count) {
        NSAssert(NO, @"数组越界");
        return;
    }
    [self lock];
    [self.objects removeObjectAtIndex:index];
    [self unlock];
}
//移除所有元素
- (void)removeAllCellModels{
    
    [self lock];
    [self.objects removeAllObjects];
    [self unlock];
}
//获取指定位置的元素
- (BaseCollectionCellModel *)cellModelAtIndex:(NSInteger)index{
    
    if (index >= self.objects.count) {
        NSAssert(NO, @"数组越界");
        return nil;
    }
    [self lock];
    id obj = self.objects[index];
    [self unlock];
    return obj;
}
//交换两个位置的元素
- (void)switchCellModelAtIndex:(NSInteger)index0 withCellModelAtIndex:(NSInteger)index1{
    
    if (index0 >= self.objects.count || index1 >= self.objects.count) {
        NSAssert(NO, @"数组越界");
        return;
    }
    [self lock];
    [self.objects exchangeObjectAtIndex:index0 withObjectAtIndex:index1];
    [self unlock];
}

//获取所有的元素
- (NSArray <BaseCollectionCellModel *> *)getAllCellModels{
    
    return self.objects;
}

- (void)enumerateObjectsUsingBlock:(void (NS_NOESCAPE ^)(BaseCollectionCellModel * obj, NSUInteger idx, BOOL *stop))block{
    [self lock];
    [self.objects enumerateObjectsUsingBlock:block];
    [self unlock];
}


- (void)lock
{
    os_unfair_lock_lock(&_lock);
}

- (void)unlock
{
    os_unfair_lock_unlock(&_lock);
}

# pragma mark -override

- (NSString *)headerViewClass{
    
    if (!_headerViewClass) {
        _headerViewClass= @"BaseCollectionReusableViewHeader";
    }
    return _headerViewClass;
}

- (NSString *)footerViewClass{
    
    if (!_footerViewClass) {
        _footerViewClass = @"BaseCollectionReusableViewFooter";
    }
    return _footerViewClass;
}

# pragma mark - getter
- (NSMutableArray <BaseCollectionCellModel *> *)objects{
    
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    return _objects;
}

- (NSInteger)cellModelCount{
    
    return [self.objects count];
}
@end
