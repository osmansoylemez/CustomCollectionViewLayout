//
//  DynamicCollectionView.h
//  CustomCollectionViewLayout
//
//  Created by Osman SÖYLEMEZ on 29.12.2018.
//  Copyright © 2018 Osman SÖYLEMEZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DynamicCollectionViewDelegate <NSObject>
@optional
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@protocol DynamicCollectionViewDataSource  <NSObject>
@optional
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;

- (NSArray *)itemLayoutDataSource;
- (NSInteger)maximumColumnCount;

@end

@interface DynamicCollectionView : UICollectionView

@property(nonatomic, strong) id<DynamicCollectionViewDelegate> collectionViewDelegate;
@property(nonatomic, strong) id<DynamicCollectionViewDataSource> collectionViewDataSource;

@end
