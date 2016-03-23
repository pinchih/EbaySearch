//
//  WebViewController.m
//  EbaySearch
//
//  Created by Pin-Chih on 2015/4/20.
//  Copyright (c) 2015年 Pin-Chih. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

-(void)viewWillAppear:(BOOL)animated{
    
    
    NSURL * url = [NSURL URLWithString:self.strURL];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    self.webView.delegate = self;
    [self.progressView setProgress:0.0 animated:YES];
    [self.webView loadRequest:request];
    
    
}


-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [self.progressView setProgress:1.0 animated:YES];
    
}

//TODO: Facebook post success is not working


- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)closeWindow:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
