//
//  DynamicFlowLayoutManager.h
//  CustomCollectionViewLayout
//
//  Created by Osman SÖYLEMEZ on 28.12.2018.
//  Copyright © 2018 Osman SÖYLEMEZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DynamicFlowLayoutManager : NSObject

+ (DynamicFlowLayoutManager *)sharedInstance;

- (NSMutableArray *)getDataSource;

@end
