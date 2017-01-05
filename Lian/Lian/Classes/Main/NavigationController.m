//
//  NavigationController.m
//  Lian
//
//  Created by 廉建杰 on 2017/1/5.
//  Copyright © 2017年 lianjianjie. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation NavigationController
+(void)initialize{
    UINavigationBar *navigationBar=[UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[NavigationController class]]];
    //设置背景图片
#warning 背景待设置pch
    navigationBar.barTintColor=MRGlobalBg;
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    [navigationBar setTitleTextAttributes:attrs];
    [navigationBar setTintColor:[UIColor whiteColor]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 处理自定义导航控制器返回控件之后的返回手势失效
    self.interactivePopGestureRecognizer.delegate = self;
}


// 拦截所有push进来的控制器
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if(self.childViewControllers.count > 0) { // 如果push进来的不是第一个则要设置统一的返回按钮
        // 隐藏tabBar
        viewController.hidesBottomBarWhenPushed = YES;
        // 修改导航栏左边的item
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"checkUserType_backward_9x15_"] style:UIBarButtonItemStylePlain target:self action:@selector(navigationBackClick)];
    }
    
    // 一定要在最后在执行父类的push操作, 这样让第一次的根控制器Push进来的时候childViewController为0, 并且让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
}


// 返回事件
- (void)navigationBackClick {
    
    [self popViewControllerAnimated:YES];
}

#pragma mark - <UIGestureRecognizerDelegate>

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    return self.childViewControllers.count > 1;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
