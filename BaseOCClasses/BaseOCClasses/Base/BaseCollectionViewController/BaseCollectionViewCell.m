//
//  BaseCollectionViewCell.m
//  SDUSZ_ELearningPlatform
//
//  Created by sdusz on 2019/1/7.
//  Copyright © 2019年 juziwl. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@implementation BaseCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
#if DEBUG
//        self.backgroundColor = [UIColor yellowColor];
#endif
    }
    return self;
}

//赋值
- (void)setCellData:(BaseCollectionSectionModel *)sectionModel cellModel:(BaseCollectionCellModel *)cellModel{
    
}
@end
