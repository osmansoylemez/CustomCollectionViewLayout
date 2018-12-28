//
//  DynamicCollectionViewFlowLayout.h
//  CustomCollectionViewLayout
//
//  Created by Osman SÖYLEMEZ on 27.12.2018.
//  Copyright © 2018 Osman SÖYLEMEZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DynamicCollectionViewFlowLayout : UICollectionViewFlowLayout

- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

@end
