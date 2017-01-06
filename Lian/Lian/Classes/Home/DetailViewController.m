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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(shareBtn:)];

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
    [SVProgressHUD showSuccessWithStatus:nil];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [SVProgressHUD showErrorWithStatus:@"出错啦~"];
}

//分享链接
- (void)shareBtn:(id)sender {
    NSURL *shareUrl=[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.item.content_url]];
    NSArray *activityItem=@[shareUrl];
    UIActivityViewController *activityController=[[UIActivityViewController alloc]initWithActivityItems:activityItem applicationActivities:nil];
    //设置不出现的活动项目
        activityController.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll];
    [self.navigationController presentViewController:activityController animated:YES completion:nil];
    
}

@end
