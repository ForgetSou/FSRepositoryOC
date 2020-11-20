//
//  FSHomeVC.m
//  FSSideslipReturn
//
//  Created by forget on 2020/11/20.
//

#import "FSHomeVC.h"
#import "FSLanguageVC.h"

@interface FSHomeVC ()

@property (strong, nonatomic) UIButton *pushBtn;

@end

@implementation FSHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self settingUI];
}

- (void)settingUI {
    self.title = @"Home";
    self.navigationItem.leftBarButtonItem = nil;
    [self.view addSubview:self.pushBtn];
}

- (void)pushLanguageVC {
    FSLanguageVC *languageVC = [[FSLanguageVC alloc] init];
    [self.navigationController pushViewController:languageVC animated:YES];
}

- (UIButton *)pushBtn {
    if (!_pushBtn) {
        _pushBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _pushBtn.center = CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height/2.0);
        _pushBtn.bounds = CGRectMake(0, 0, 100, 50);
        _pushBtn.titleLabel.font = [UIFont systemFontOfSize:22];
        [_pushBtn setTitle:@"Push" forState:UIControlStateNormal];
        [_pushBtn addTarget:self action:@selector(pushLanguageVC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushBtn;
}




@end
