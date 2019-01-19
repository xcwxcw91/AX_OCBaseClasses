//
//  BaseTableViewCellModel.m
//  PresentPushTest
//
//  Created by Allen_Xu on 2017/12/2.
//  Copyright © 2017年 SDUSZ. All rights reserved.
//

#import "BaseTableViewCellModel.h"
#import <UIKit/UIKit.h>
@implementation BaseTableViewCellModel

- (NSString *)cellClassName{
    
    if (!_cellClassName){
        _cellClassName =@"BaseTableViewCell";
    }
    return _cellClassName;
}
 
- (NSString *)cellReuseIdentifer{
    
    if (!_cellReuseIdentifer) {
        _cellReuseIdentifer = @"BaseCellReuseIdentifer";
    }
    return _cellReuseIdentifer;
}

- (float)rowHeight{
    
    if (!_rowHeight) {
        _rowHeight = 44.f;
    }
    return _rowHeight;
}

 

@end
