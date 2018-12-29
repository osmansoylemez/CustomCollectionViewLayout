//
//  DynamicCollectionView.m
//  CustomCollectionViewLayout
//
//  Created by Osman SÖYLEMEZ on 29.12.2018.
//  Copyright © 2018 Osman SÖYLEMEZ. All rights reserved.
//

#import "DynamicCollectionView.h"
#import "DynamicCollectionViewFlowLayout.h"

@interface DynamicCollectionView() <UICollectionViewDelegate, UICollectionViewDataSource, DynamicCollectionViewFlowLayoutDelegate>

@end

@implementation DynamicCollectionView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.delegate = self;
        self.dataSource = self;
        DynamicCollectionViewFlowLayout *dynamicFlowLayout = (DynamicCollectionViewFlowLayout *)self.collectionViewLayout;
        dynamicFlowLayout.delegate = self;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
        self.delegate = self;
        self.dataSource = self;
        DynamicCollectionViewFlowLayout *dynamicFlowLayout = (DynamicCollectionViewFlowLayout *)self.collectionViewLayout;
        dynamicFlowLayout.delegate = self;
    }
    return self;
}

#pragma mark UICollectionViewDatasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if ([self.collectionViewDataSource respondsToSelector:@selector(numberOfSectionsInCollectionView:)])
    {
        return [self.collectionViewDataSource numberOfSectionsInCollectionView:collectionView];
    }
    return 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if ([self.collectionViewDataSource respondsToSelector:@selector(collectionView:numberOfItemsInSection:)])
    {
        return [self.collectionViewDataSource collectionView:collectionView
                                      numberOfItemsInSection:section];
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.collectionViewDataSource respondsToSelector:@selector(collectionView:cellForItemAtIndexPath:)])
    {
        return [self.collectionViewDataSource collectionView:collectionView
                                      cellForItemAtIndexPath:indexPath];
    }
    return nil;
}

#pragma mark UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.collectionViewDelegate respondsToSelector:@selector(collectionView:didSelectItemAtIndexPath:)])
    {
        [self.collectionViewDelegate collectionView:collectionView
                           didSelectItemAtIndexPath:indexPath];
    }
}

#pragma mark UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([collectionViewLayout isKindOfClass:[DynamicCollectionViewFlowLayout class]])
    {
        DynamicCollectionViewFlowLayout *dynamicFlowLayout = (DynamicCollectionViewFlowLayout *)collectionViewLayout;
        return [dynamicFlowLayout sizeForItemAtIndexPath:indexPath];
    }
    return CGSizeMake(1, 1);
}

#pragma mark Custom

- (NSArray *)itemLayoutDataSource
{
    if ([self.collectionViewDataSource respondsToSelector:@selector(itemLayoutDataSource)])
    {
        return [self.collectionViewDataSource itemLayoutDataSource];
    }
    return @[];
}

- (NSInteger)maximumColumnCount
{
    if ([self.collectionViewDataSource respondsToSelector:@selector(maximumColumnCount)])
    {
        return [self.collectionViewDataSource maximumColumnCount];
    }
    return 0;
}

@end
