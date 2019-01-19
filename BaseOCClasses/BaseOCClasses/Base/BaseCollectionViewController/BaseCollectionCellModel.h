//
//  BaseCollectionCellModel.h
//  SDUSZ_ELearningPlatform
//
//  Created by sdusz on 2019/1/7.
//  Copyright © 2019年 juziwl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseCollectionCellModel : NSObject

//required
@property (nonatomic, copy)   NSString * cellClassName;//cellModel对应的cell的类名
@property (nonatomic, copy)   NSString * cellReuseIdentifer;//cell重用的identifer
//optional
@property (nonatomic, copy)   NSString * cellJumpClassName;//cell跳转的目标控制器类
@property (nonatomic)         CGSize itemSize;

@end
