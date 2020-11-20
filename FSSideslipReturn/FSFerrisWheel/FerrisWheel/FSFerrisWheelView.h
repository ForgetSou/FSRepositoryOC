//
//  FSFerrisWheelView.h
//  FSFerrisWheel
//
//  Created by forget on 2020/11/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FSFerrisWheelView : UIView

/// 初始化视图
/// @param frame 坐标区域
/// @param itemCount item数量
- (instancetype)initWithFrame:(CGRect)frame
                    itemCount:(NSInteger)itemCount
                    itemWidth:(CGFloat)itemWidth;

/// 开始转动
- (void)startTurnAni;

/// 停止转动
- (void)stopTurnAni;

@end

NS_ASSUME_NONNULL_END
