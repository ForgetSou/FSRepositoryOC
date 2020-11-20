//
//  FSSystemSlideslipNav.m
//  FSSideslipReturn
//
//  Created by forget on 2020/11/20.
//

#import "FSSystemSlideslipNav.h"

@interface FSSystemSlideslipNav ()<UIGestureRecognizerDelegate>

@end

@implementation FSSystemSlideslipNav

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.childViewControllers.count == 1) {
        return NO;
    } else {
        /*!
         指定某个控制器不做左滑返回
         if ([self.topViewController isKindOfClass:[XXXVC class]]) {
             return NO;
         }
         */
        return YES;
    }
}

@end
