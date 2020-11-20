//
//  FSFerrisWheelView.m
//  FSFerrisWheel
//
//  Created by forget on 2020/11/20.
//

#import "FSFerrisWheelView.h"
#import "FSFlowLayout.h"
#import "FSCVCell.h"

@interface FSFerrisWheelView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *collectionView;

@property (assign, nonatomic) NSInteger itemCount;

@property (assign, nonatomic) CGFloat itemWidth;

@property (assign, nonatomic) BOOL isStart;

@end

@implementation FSFerrisWheelView

- (instancetype)initWithFrame:(CGRect)frame itemCount:(NSInteger)itemCount itemWidth:(CGFloat)itemWidth {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.itemCount = itemCount;
        self.itemWidth = itemWidth;
        [self setupTurnView];
    }
    return self;
}

- (void)setupTurnView {
    [self addSubview:self.collectionView];
}

- (void)startTurnAni {
    self.isStart = YES;
    
    [self turnWithOptions:UIViewAnimationOptionCurveEaseIn];
}

- (void)stopTurnAni {
    self.isStart = NO;
    self.collectionView.transform = CGAffineTransformIdentity;
    for (int i = 0; i < self.itemCount; i++) {
        NSIndexPath *idxP = [NSIndexPath indexPathForItem:i inSection:0];
        FSCVCell *cell = (FSCVCell *)[self.collectionView cellForItemAtIndexPath:idxP];
        cell.transform = CGAffineTransformIdentity;
    }
}

- (void)turnWithOptions:(UIViewAnimationOptions)options {

    [UIView animateWithDuration:0.05 delay:0.0f options:options animations:^{

        self.collectionView.transform = CGAffineTransformRotate(self.collectionView.transform, M_PI / 180);

        for (int i = 0; i < self.itemCount; i++) {
            NSIndexPath *idxP = [NSIndexPath indexPathForItem:i inSection:0];
            FSCVCell *cell = (FSCVCell *)[self.collectionView cellForItemAtIndexPath:idxP];
            cell.transform = CGAffineTransformRotate(cell.transform, -M_PI / 180);
        }
        
    }completion:^(BOOL finished) {

       if (finished) {

           if (self.isStart) {
               
                [self turnWithOptions:UIViewAnimationOptionCurveLinear];

            } else if (options != UIViewAnimationOptionCurveEaseOut) {

                [self turnWithOptions:UIViewAnimationOptionCurveEaseOut];
            }
       }
    }];
}

#pragma mark - UICollectionViewDelegate && UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.itemCount;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FSCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CVCell" forIndexPath:indexPath];
    cell.layer.cornerRadius = self.itemWidth/2.0;
    cell.layer.masksToBounds = YES;
    cell.label.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row + 1];
    return cell;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        FSFlowLayout *layout = [[FSFlowLayout alloc] init];
        layout.itemCount = self.itemCount;
        layout.itemWidth = self.itemWidth;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.userInteractionEnabled = NO;
        _collectionView.backgroundColor = UIColor.clearColor;
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([FSCVCell class])
                                                    bundle:nil]
          forCellWithReuseIdentifier:@"CVCell"];
    }
    return _collectionView;
}

- (void)setItemCount:(NSInteger)itemCount {
    _itemCount = itemCount;
}
@end
