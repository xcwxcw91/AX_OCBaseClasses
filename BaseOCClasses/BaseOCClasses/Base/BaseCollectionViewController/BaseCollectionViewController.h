//
//  BaseCollectionViewController.h
//  SDUSZ_ELearningPlatform
//
//  Created by sdusz on 2019/1/7.
//  Copyright © 2019年 juziwl. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseCollectionSectionModel.h"

@interface BaseCollectionViewController : BaseViewController

@property (strong, nonatomic) UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray <BaseCollectionSectionModel *>* dataSource;

- (void)reload;
@end
