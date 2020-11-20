//
//  FSFlowLayout.m
//  ZDEarphone
//
//  Created by forget on 2020/11/19.
//

#import "FSFlowLayout.h"

@interface FSFlowLayout ()

@property (strong, nonatomic) NSMutableArray *attributrAry;

@end

@implementation FSFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    self.attributrAry = [NSMutableArray array];

     for(int i = 0; i < self.itemCount; i ++) {

        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];

        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];

        [self.attributrAry addObject:attrs];
    }
}

- (CGSize)collectionViewContentSize {
    return self.collectionView.frame.size;
}

- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return [self.attributrAry copy];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    self.itemCount = (NSInteger)[self.collectionView numberOfItemsInSection:0];
    CGFloat radius = MIN(self.collectionView.frame.size.width, self.collectionView.frame.size.height) / 2;
    
    CGFloat center_x = self.collectionView.frame.size.width * 0.5;
    CGFloat center_y = self.collectionView.frame.size.height * 0.5;
    
    UICollectionViewLayoutAttributes *attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attris.size = CGSizeMake(self.itemWidth, self.itemWidth);
    
    CGFloat angle = (2 * M_PI / self.itemCount) * indexPath.item - M_PI_2;
    CGFloat xx = center_x + cosf(angle) * (radius - self.itemWidth / 2);
    CGFloat yy = center_y + sinf(angle) * (radius - self.itemWidth / 2);
    attris.center = CGPointMake(xx, yy);
    
    return attris;
}

@end
