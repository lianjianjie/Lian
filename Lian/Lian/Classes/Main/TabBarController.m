//
//  TabBarController.m
//  Lian
//
//  Created by 廉建杰 on 2017/1/5.
//  Copyright © 2017年 lianjianjie. All rights reserved.
//

#import "TabBarController.h"
#import "HomeController.h"
#import "MeController.h"
#import "UIImage+Extension.h"
#import "NavigationController.h"
@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildController:[[HomeController alloc]init] imageName:@"TabBar_home_23x23_" selectedImage:@"TabBar_home_23x23_selected" title:@"首页"];
    [self addChildController:[[MeController alloc]init] imageName:@"TabBar_me_boy_23x23_" selectedImage:@"TabBar_me_boy_23x23_selected" title:@"我的"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *	@brief	设置TabBarItem主题
 */

+ (void)initialize {
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
#warning pch
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
}

//添加子控制器
- (void)addChildController:(UIViewController *)childVC imageName:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title{
    childVC.title = title;
    childVC.tabBarItem.image= [UIImage mr_imageOriginalWithName:image];
    childVC.tabBarItem.selectedImage = [UIImage mr_imageOriginalWithName:selectedImage];
    
    NavigationController *nav = [[NavigationController alloc]initWithRootViewController:childVC];
    
    [self addChildViewController:nav];
    
}


@end
