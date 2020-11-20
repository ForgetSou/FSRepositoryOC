//
//  AppDelegate.m
//  FSSideslipReturn
//
//  Created by forget on 2020/11/20.
//

#import "AppDelegate.h"
#import "FSSystemSlideslipNav.h"
#import "FSHomeVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    FSHomeVC *homeVC = [[FSHomeVC alloc] init];
    FSSystemSlideslipNav *nav = [[FSSystemSlideslipNav alloc] initWithRootViewController:homeVC];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setRootViewController:nav];
    [self.window makeKeyAndVisible];

    // 初始化设置
    [self setupInitalization];
    
    return YES;
}

- (void)setupInitalization {
    
}

@end
