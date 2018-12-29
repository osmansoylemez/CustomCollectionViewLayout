//
//  DynamicCollectionViewFlowLayout.m
//  CustomCollectionViewLayout
//
//  Created by Osman SÖYLEMEZ on 27.12.2018.
//  Copyright © 2018 Osman SÖYLEMEZ. All rights reserved.
//

#import "DynamicCollectionViewFlowLayout.h"

#import "DynamicCollectionView.h"

@interface DynamicCollectionViewFlowLayout()

@property (nonatomic) CGFloat itemSizeValue;
@property (nonatomic) CGFloat contentHeight;

@property (nonatomic, strong) NSMutableArray *allLayoutAttributes;

@end


@implementation DynamicCollectionViewFlowLayout

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(self.collectionView.frame.size.width, self.contentHeight);
}

- (void)prepareLayout
{
    [super prepareLayout];
    
    self.itemSizeValue = self.collectionView.frame.size.width / [self.delegate maximumColumnCount];
    
    self.minimumLineSpacing = 0.0f;
    self.minimumInteritemSpacing = 0.0f;
    self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.itemSize = CGSizeMake(self.itemSizeValue, self.itemSizeValue);
    self.estimatedItemSize = CGSizeMake(self.itemSizeValue, self.itemSizeValue);
    
    [self setLayoutAttributes];
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.allLayoutAttributes;
}

- (void)setLayoutAttributes
{
    if (!self.allLayoutAttributes)
    {
        self.allLayoutAttributes = [NSMutableArray array];
    }
    
    for (int i = 0; i < [[self.delegate itemLayoutDataSource] count] ; i++)
    {
        UICollectionViewLayoutAttributes *decorationAttributes = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        
        id layout = [[self.delegate itemLayoutDataSource] objectAtIndex:i];
        decorationAttributes.frame = CGRectMake([self floatWithLayoutValue:[layout valueForKey:@"x"]],
                                                [self floatWithLayoutValue:[layout valueForKey:@"y"]],
                                                [self floatWithLayoutValue:[layout valueForKey:@"w"]],
                                                [self floatWithLayoutValue:[layout valueForKey:@"h"]]);
        
        CGFloat endPoint = decorationAttributes.frame.origin.y + decorationAttributes.frame.size.height;
        if (self.contentHeight < endPoint)
        {
            self.contentHeight = endPoint;
        }
        
        [self.allLayoutAttributes addObject:decorationAttributes];
    }
}

- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    id layout = [[self.delegate itemLayoutDataSource] objectAtIndex:indexPath.row];
    return CGSizeMake([self floatWithLayoutValue:[layout valueForKey:@"w"]],
                      [self floatWithLayoutValue:[layout valueForKey:@"w"]]);
}

- (CGFloat)floatWithLayoutValue:(NSString *)value
{
    if ([value containsString:@"x"])
    {
        return self.itemSizeValue * [[value stringByReplacingOccurrencesOfString:@"x" withString:@""] integerValue];
    }
    return [value floatValue];
}

@end
