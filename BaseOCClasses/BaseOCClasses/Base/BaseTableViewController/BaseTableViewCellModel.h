//
//  BaseTableViewCellModel.h
//  PresentPushTest
//
//  Created by Allen_Xu on 2017/12/2.
//  Copyright © 2017年 SDUSZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseTableViewCellModel : NSObject
//required
@property (nonatomic, copy)   NSString * cellClassName;//cellModel对应的cell的类名
@property (nonatomic, copy)   NSString * cellReuseIdentifer;//cell重用的identifer
//optional
@property (nonatomic, copy)   NSString * cellJumpClassName;//cell跳转的目标控制器类
@property (nonatomic, assign) float rowHeight;//cell行高
 

@end
