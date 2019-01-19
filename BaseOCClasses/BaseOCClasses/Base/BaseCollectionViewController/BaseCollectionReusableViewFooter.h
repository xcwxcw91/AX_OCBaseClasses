//
//  BaseCollectionReusableViewFooter.h
//  SDUSZ_ELearningPlatform
//
//  Created by sdusz on 2019/1/7.
//  Copyright © 2019年 juziwl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseCollectionSectionModel;
@interface BaseCollectionReusableViewFooter : UICollectionReusableView
@property (nonatomic, assign) NSInteger section;

- (void)setFooterData:(BaseCollectionSectionModel *)sectionModel;

@end
