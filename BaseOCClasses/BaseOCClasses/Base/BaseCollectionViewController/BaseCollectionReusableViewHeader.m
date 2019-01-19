//
//  BaseCollectionReusableViewHeader.m
//  SDUSZ_ELearningPlatform
//
//  Created by sdusz on 2019/1/7.
//  Copyright © 2019年 juziwl. All rights reserved.
//

#import "BaseCollectionReusableViewHeader.h"

@implementation BaseCollectionReusableViewHeader
- (void)setHeaderData:(BaseCollectionSectionModel *)sectionModel{
#if DEBUG
    self.backgroundColor = [UIColor greenColor];
#endif
}
@end
