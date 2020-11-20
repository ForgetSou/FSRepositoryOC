//
//  FSFlowLayout.h
//  ZDEarphone
//
//  Created by forget on 2020/11/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FSFlowLayout : UICollectionViewFlowLayout

@property (assign, nonatomic) NSInteger itemCount;
@property (assign, nonatomic) CGFloat itemWidth;

@end

NS_ASSUME_NONNULL_END
