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
    layout.h = @"2x";
    layout.w = @"4x";
    layout.x = @"0x";
    layout.y = @"0x";
    [self.dataSource addObject:layout];
    
    layout = [ItemLayout new];
    layout.h = @"2x";
    layout.w = @"4x";
    layout.x = @"0x";
    layout.y = @"1x";
    [self.dataSource addObject:layout];
    
    layout = [ItemLayout new];
    layout.h = @"2x";
    layout.w = @"2x";
    layout.x = @"0x";
    layout.y = @"2x";
    [self.dataSource addObject:layout];
    
    layout = [ItemLayout new];
    layout.h = @"1x";
    layout.w = @"1x";
    layout.x = @"2x";
    layout.y = @"2x";
    [self.dataSource addObject:layout];
    
    layout = [ItemLayout new];
    layout.h = @"1x";
    layout.w = @"1x";
    layout.x = @"3x";
    layout.y = @"2x";
    [self.dataSource addObject:layout];
    
    layout = [ItemLayout new];
    layout.h = @"1x";
    layout.w = @"2x";
    layout.x = @"2x";
    layout.y = @"3x";
    [self.dataSource addObject:layout];
    
    layout = [ItemLayout new];
    layout.h = @"1x";
    layout.w = @"3x";
    layout.x = @"0x";
    layout.y = @"4x";
    [self.dataSource addObject:layout];

    layout = [ItemLayout new];
    layout.h = @"1x";
    layout.w = @"1x";
    layout.x = @"3x";
    layout.y = @"4x";
    [self.dataSource addObject:layout];
    
    layout = [ItemLayout new];
    layout.h = @"1x";
    layout.w = @"1x";
    layout.x = @"0x";
    layout.y = @"5x";
    [self.dataSource addObject:layout];
    
    layout = [ItemLayout new];
    layout.h = @"1x";
    layout.w = @"1x";
    layout.x = @"1x";
    layout.y = @"5x";
    [self.dataSource addObject:layout];
    
    layout = [ItemLayout new];
    layout.h = @"1x";
    layout.w = @"2x";
    layout.x = @"2x";
    layout.y = @"5x";
    [self.dataSource addObject:layout];

    layout = [ItemLayout new];
    layout.h = @"200";
    layout.w = @"375";
    layout.x = @"0x";
    layout.y = @"6x";
    [self.dataSource addObject:layout];
}

@end
