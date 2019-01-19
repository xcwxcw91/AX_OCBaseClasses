//
//  BaseCollectionViewCell.h
//  SDUSZ_ELearningPlatform
//
//  Created by sdusz on 2019/1/7.
//  Copyright © 2019年 juziwl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BaseCollectionSectionModel,BaseCollectionCellModel;

@interface BaseCollectionViewCell : UICollectionViewCell

//赋值
- (void)setCellData:(BaseCollectionSectionModel *)sectionModel cellModel:(BaseCollectionCellModel *)cellModel;

@end
