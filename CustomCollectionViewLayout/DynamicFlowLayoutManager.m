//
//  DynamicFlowLayoutManager.m
//  CustomCollectionViewLayout
//
//  Created by Osman SÖYLEMEZ on 28.12.2018.
//  Copyright © 2018 Osman SÖYLEMEZ. All rights reserved.
//

#import "DynamicFlowLayoutManager.h"
#import "ItemLayout.h"

@interface DynamicFlowLayoutManager()

@property(nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation DynamicFlowLayoutManager

+ (DynamicFlowLayoutManager *)sharedInstance
{
    static DynamicFlowLayoutManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [DynamicFlowLayoutManager new];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setDataSource];
    }
    return self;
}

- (NSMutableArray *)getDataSource
{
    return self.dataSource;
}

- (void)setDataSource
{
    self.dataSource = [NSMutableArray array];
    ItemLayout *layout = [ItemLayout new];
    layout.h = 2;
    layout.w = 4;
    layout.x = 0;
    layout.y = 0;
    [self.dataSource addObject:layout];
    
    layout = [ItemLayout new];
    layout.h = 2;
    layout.w = 4;
    layout.x = 0;
    layout.y = 1;
    [self.dataSource addObject:layout];
    
    layout = [ItemLayout new];
    layout.h = 2;
    layout.w = 2;
    layout.x = 0;
    layout.y = 2;
    [self.dataSource addObject:layout];
    
    layout = [ItemLayout new];
    layout.h = 1;
    layout.w = 1;
    layout.x = 2;
    layout.y = 2;
    [self.dataSource addObject:layout];
    
    layout = [ItemLayout new];
    layout.h = 1;
    layout.w = 1;
    layout.x = 3;
    layout.y = 2;
    [self.dataSource addObject:layout];
    
    layout = [ItemLayout new];
    layout.h = 1;
    layout.w = 2;
    layout.x = 2;
    layout.y = 3;
    [self.dataSource addObject:layout];
    
    layout = [ItemLayout new];
    layout.h = 1;
    layout.w = 3;
    layout.x = 0;
    layout.y = 4;
    [self.dataSource addObject:layout];

    layout = [ItemLayout new];
    layout.h = 1;
    layout.w = 1;
    layout.x = 3;
    layout.y = 4;
    [self.dataSource addObject:layout];
    
    layout = [ItemLayout new];
    layout.h = 1;
    layout.w = 1;
    layout.x = 0;
    layout.y = 5;
    [self.dataSource addObject:layout];
    
    layout = [ItemLayout new];
    layout.h = 1;
    layout.w = 1;
    layout.x = 1;
    layout.y = 5;
    [self.dataSource addObject:layout];
    
    layout = [ItemLayout new];
    layout.h = 1;
    layout.w = 2;
    layout.x = 2;
    layout.y = 5;
    [self.dataSource addObject:layout];

    layout = [ItemLayout new];
    layout.h = 4;
    layout.w = 4;
    layout.x = 0;
    layout.y = 6;
    [self.dataSource addObject:layout];
    
    
    /*
    layout = [ItemLayout new];
    layout.h = 1;
    layout.w = 2;
    layout.x = 2;
    layout.y = 6;
    
     [self.dataSource addObject:layout];
    layout = [ItemLayout new];
    layout.h = 2;
    layout.w = 2;
    [self.dataSource addObject:layout];
    
    layout = [ItemLayout new];
    layout.h = 2;
    layout.w = 2;
    [self.dataSource addObject:layout];
    
    layout = [ItemLayout new];
    layout.h = 2;
    layout.w = 2;
    [self.dataSource addObject:layout];
    
    layout = [ItemLayout new];
    layout.h = 1;
    layout.w = 4;
    [self.dataSource addObject:layout];
     */
}

@end
