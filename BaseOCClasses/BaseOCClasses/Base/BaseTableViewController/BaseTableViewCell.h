//
//  BaseTableViewCell.h
//  PresentPushTest
//
//  Created by Allen_Xu on 2017/12/2.
//  Copyright © 2017年 SDUSZ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseSectionModel, BaseTableViewCellModel;

@interface BaseTableViewCell : UITableViewCell

//赋值
- (void)setCellData:(BaseSectionModel *)sectionModel cellModel:(BaseTableViewCellModel *)cellModel;
 


@end
