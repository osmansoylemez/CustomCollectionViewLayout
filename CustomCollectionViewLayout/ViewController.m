//
//  ViewController.m
//  CustomCollectionViewLayout
//
//  Created by Osman SÖYLEMEZ on 27.12.2018.
//  Copyright © 2018 Osman SÖYLEMEZ. All rights reserved.
//

#import "ViewController.h"
#import "DynamicFlowLayoutManager.h"
#import "ItemLayout.h"
#import "DynamicCollectionViewFlowLayout.h"
#import "DynamicCollectionView.h"

@interface ViewController () <DynamicCollectionViewDelegate,DynamicCollectionViewDataSource>

@property (weak, nonatomic) IBOutlet DynamicCollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.collectionView.collectionViewDelegate = self;
    self.collectionView.collectionViewDataSource = self;
}

#pragma mark DynamicCollectionView
#pragma mark DynamicCollectionViewDatasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[[DynamicFlowLayoutManager sharedInstance] getDataSource] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    
    if (indexPath.row % 7 == 0)
    {
        cell.backgroundColor = [UIColor redColor];
    }
    else if (indexPath.row % 7 == 1)
    {
        cell.backgroundColor = [UIColor yellowColor];
    }
    else if (indexPath.row % 7 == 2)
    {
        cell.backgroundColor = [UIColor darkGrayColor];
    }
    else if (indexPath.row % 7 == 3)
    {
        cell.backgroundColor = [UIColor grayColor];
    }
    else if (indexPath.row % 7 == 4)
    {
        cell.backgroundColor = [UIColor purpleColor];
    }
    else if (indexPath.row % 7 == 5)
    {
        cell.backgroundColor = [UIColor lightGrayColor];
    }
    else if (indexPath.row % 7 == 6)
    {
        cell.backgroundColor = [UIColor greenColor];
    }
    
    return cell;
}

- (NSArray *)itemLayoutDataSource
{
    return [[DynamicFlowLayoutManager sharedInstance] getDataSource];
}

- (NSInteger)maximumColumnCount
{
    return 4;
}

#pragma mark DynamicCollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Row = %i",(int)indexPath.row);
}

@end
