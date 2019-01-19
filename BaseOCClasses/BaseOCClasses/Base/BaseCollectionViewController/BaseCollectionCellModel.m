//
//  BaseCollectionCellModel.m
//  SDUSZ_ELearningPlatform
//
//  Created by sdusz on 2019/1/7.
//  Copyright © 2019年 juziwl. All rights reserved.
//

#import "BaseCollectionCellModel.h"

@implementation BaseCollectionCellModel
- (NSString *)cellClassName{
    
    if (!_cellClassName){
        _cellClassName =@"BaseCollectionViewCell";
    }
    return _cellClassName;
}

- (NSString *)cellReuseIdentifer{
    
    if (!_cellReuseIdentifer) {
        _cellReuseIdentifer = @"BaseCollectionViewCell";
    }
    return _cellReuseIdentifer;
}

- (CGSize)itemSize{
    
    if (CGSizeEqualToSize(_itemSize, CGSizeZero)) {
        
        return CGSizeMake(50 + (arc4random() % 50), 50 + (arc4random() % 50));
    }
    return _itemSize;
}
@end
