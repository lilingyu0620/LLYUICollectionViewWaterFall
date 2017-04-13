//
//  LLYCollectionViewWaterFallLayout.m
//  LLYUICollectionViewWaterFall
//
//  Created by lly on 2017/4/11.
//  Copyright © 2017年 lly. All rights reserved.
//

#import "LLYCollectionViewWaterFallLayout.h"

@interface LLYCollectionViewWaterFallLayout ()

@property (nonatomic,strong) NSMutableArray *itemAttributes;

@end

#define kCellWidth     ([UIScreen mainScreen].bounds.size.width-20)/2

@implementation LLYCollectionViewWaterFallLayout


- (void)prepareLayout{

    [super prepareLayout];
    
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    self.itemAttributes = [NSMutableArray array];

    for (int idx = 0; idx < itemCount; idx++) {

        int xOffset,yOffset;
        int index = idx%4;
        int row = idx/4;
        CGFloat cellHeight = 100;
        if (index == 0 || index == 3) {
            cellHeight = 300;
            if (index == 0) {
                xOffset = 5;
                yOffset = 5 + (row * 410);
                
            }
            else {
                xOffset = 5 + kCellWidth + 10;
                yOffset = 5 + (row * 410) + 5 + 100;
            }
            
        }
        else {
            cellHeight = 100;
            if (index == 1) {
                xOffset = 5 + kCellWidth + 10;
                yOffset = 5 + (row * 410);
            }
            else {
                xOffset = 5;
                yOffset = 5 + (row * 410) + 5 + 300;
            }
        }
        
        self.itemSize = CGSizeMake(kCellWidth, cellHeight);
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:idx inSection:0];
        UICollectionViewLayoutAttributes *attributes;
        attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.frame = CGRectMake(xOffset, yOffset, kCellWidth, cellHeight);
        [_itemAttributes addObject:attributes];
        
    }

}
- (CGSize)collectionViewContentSize
{

    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    
    int row = (int)itemCount/4;
    
    return CGSizeMake(0, 405 *(row + 1) + [UIScreen mainScreen].bounds.size.height);
}


- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.itemAttributes;
}


- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)path {

    UICollectionViewLayoutAttributes *attribute = self.itemAttributes[path.row];
    return attribute;
}


@end
