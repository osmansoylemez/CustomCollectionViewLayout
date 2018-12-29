//
//  DynamicCollectionViewFlowLayout.h
//  CustomCollectionViewLayout
//
//  Created by Osman SÖYLEMEZ on 27.12.2018.
//  Copyright © 2018 Osman SÖYLEMEZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DynamicCollectionViewFlowLayoutDelegate <NSObject>

@optional
- (NSArray *)itemLayoutDataSource;
- (NSInteger)maximumColumnCount;

@end

@interface DynamicCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, strong) id<DynamicCollectionViewFlowLayoutDelegate> delegate;

- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

@end
