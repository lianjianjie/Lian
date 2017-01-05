//
//  DetailViewController.m
//  Lian
//
//  Created by 廉建杰 on 2017/1/5.
//  Copyright © 2017年 lianjianjie. All rights reserved.
//

#import "DetailViewController.h"
#import "SVProgressHUD.h"
#import "Item.h"
@interface DetailViewController ()<UIWebViewDelegate>
/**
 *  webView
 */
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation DetailViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情";
    [self.view addSubview:self.webView];
    //加载数据
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.item.content_url]]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -lazy load
-(UIWebView *)webView{
    if(!_webView){
        UIWebView *web=[[UIWebView alloc]init];
        web.frame=self.view.bounds;
        web.scalesPageToFit=YES;
        web.dataDetectorTypes=UIDataDetectorTypeAll;
        web.delegate=self;
        _webView=web;
    
    }
    return _webView;
}

#pragma mark - <UIWebViewDelegate>

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [SVProgressHUD showWithStatus:@"数据加载中..."];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [SVProgressHUD showSuccessWithStatus:@"加载完成!"];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [SVProgressHUD showErrorWithStatus:@"出错啦~"];
}

@end
