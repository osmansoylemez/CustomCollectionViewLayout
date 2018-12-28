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

@interface ViewController () <UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dataSource = [[DynamicFlowLayoutManager sharedInstance] getDataSource];
}

#pragma mark UICollectionView

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
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

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([collectionViewLayout isKindOfClass:[DynamicCollectionViewFlowLayout class]])
    {
        DynamicCollectionViewFlowLayout *dynamicFlowLayout = (DynamicCollectionViewFlowLayout *)collectionViewLayout;
        return [dynamicFlowLayout sizeForItemAtIndexPath:indexPath];
    }
    return CGSizeMake(1, 1);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Row = %i",(int)indexPath.row);
}

@end
