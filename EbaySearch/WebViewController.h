//
//  WebViewController.h
//  EbaySearch
//
//  Created by Pin-Chih on 2015/4/20.
//  Copyright (c) 2015年 Pin-Chih. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong,nonatomic) NSString * strURL;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@end
