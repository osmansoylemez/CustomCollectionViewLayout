//
//  DynamicCollectionViewFlowLayout.m
//  CustomCollectionViewLayout
//
//  Created by Osman SÖYLEMEZ on 27.12.2018.
//  Copyright © 2018 Osman SÖYLEMEZ. All rights reserved.
//

#import "DynamicCollectionViewFlowLayout.h"

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

#import "ItemLayout.h"
#import "DynamicFlowLayoutManager.h"

@interface DynamicCollectionViewFlowLayout()

@property (nonatomic) CGFloat itemSizeValue;
@property (nonatomic) CGFloat maxColumnCount;

@property (nonatomic, strong) NSMutableArray *allLayoutAttributes;

@end


@implementation DynamicCollectionViewFlowLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    self.maxColumnCount = 4.0;
    self.itemSizeValue = [UIScreen mainScreen].bounds.size.width / self.maxColumnCount;
    
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
    
    for (int i = 0; i < [[DynamicFlowLayoutManager sharedInstance] getDataSource].count ; i++)
    {
        UICollectionViewLayoutAttributes *decorationAttributes = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        
            ItemLayout *layout = [[[DynamicFlowLayoutManager sharedInstance] getDataSource] objectAtIndex:i];
            // Make the decoration view span the entire row (you can do item by item as well. I just
            // chose to do it this way)
            decorationAttributes.frame =
            CGRectMake(self.itemSizeValue * layout.x,
                       self.itemSizeValue * layout.y,
                       self.itemSizeValue * layout.w,
                       self.itemSizeValue * layout.h);
            decorationAttributes.zIndex = - 1;
            
            // Add the attribute to the list
            [self.allLayoutAttributes addObject:decorationAttributes];
    }
}

- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ItemLayout *layout = [[[DynamicFlowLayoutManager sharedInstance] getDataSource] objectAtIndex:indexPath.row];

    return CGSizeMake(self.itemSizeValue * layout.w,
                      self.itemSizeValue * layout.h);
}

@end
