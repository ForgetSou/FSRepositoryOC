//
//  ViewController.m
//  FSFerrisWheel
//
//  Created by forget on 2020/11/20.
//

#import "ViewController.h"
#import "FSFerrisWheelView.h"

@interface ViewController ()

@property (strong, nonatomic) FSFerrisWheelView *ferrisWheelView;

@property (strong, nonatomic) UIButton *startBtn;

@end

@implementation ViewController

- (FSFerrisWheelView *)ferrisWheelView {
    if (!_ferrisWheelView) {
        _ferrisWheelView = [[FSFerrisWheelView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2.0 - 150, 100, 300, 300) itemCount:9 itemWidth:50.0];
    }
    return _ferrisWheelView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.startBtn];
    
    [self.view addSubview:self.ferrisWheelView];
}

- (void)viewDidDisappear:(BOOL)animated {
    [self.ferrisWheelView stopTurnAni];
}

- (UIButton *)startBtn {
    if (!_startBtn) {
        _startBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _startBtn.center = CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height/2.0);
        _startBtn.bounds = CGRectMake(0, 0, 100, 50);
        _startBtn.titleLabel.font = [UIFont systemFontOfSize:22];
        [_startBtn setTitle:@"Start Turn" forState:UIControlStateNormal];
        [_startBtn addTarget:self action:@selector(startTurnAni) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startBtn;
}

- (void)startTurnAni {
    [self.ferrisWheelView startTurnAni];
}

@end
