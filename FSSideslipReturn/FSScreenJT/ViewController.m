//
//  ViewController.m
//  FSScreenJT
//
//  Created by forget on 2020/11/20.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNotificationCenter];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self checkRecording];
}

/// 检测是否正在录屏
- (void)checkRecording {
    UIScreen *screen = [UIScreen mainScreen];
    if (@available(iOS 11.0 *)) {
        if (screen.isCaptured) {
            // 正在录制 <如: recorded, AirPlayed, mirrored 等>
            [self addRecordTip];
        }
    }
}

- (void)addRecordTip {
    // 提示用户不要进行录屏操作
    
}

- (void)addNotificationCenter {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(addScreenShotTip)
                                                 name:UIApplicationUserDidTakeScreenshotNotification
                                               object:nil];
    if (@available(iOS 11.0 *)) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(addRecordTip)
                                                     name:UIScreenCapturedDidChangeNotification
                                                   object:nil];
    }
}

- (void)addScreenShotTip {
    // 提示用户不要进行截图操作
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIApplicationUserDidTakeScreenshotNotification
                                                  object:nil];
    if (@available(iOS 11.0 *)) {
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:UIScreenCapturedDidChangeNotification
                                                      object:nil];
    }
}

@end
