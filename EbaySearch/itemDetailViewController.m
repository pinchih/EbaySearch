//
//  itemDetailViewController.m
//  EbaySearch
//
//  Created by Pin-Chih on 2015/4/19.
//  Copyright (c) 2015年 Pin-Chih. All rights reserved.
//

#import "itemDetailViewController.h"
#import "WebViewController.h"
#import "ESItem.h"
#import "ESitemHolder.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>




@interface itemDetailViewController ()


@end


@implementation itemDetailViewController



-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
    
    
    
    self.titleLabel.text = self.itemForDetailView.title;
    self.locationLabel.text = self.itemForDetailView.location;
    
    
    // Assign price label

    NSString * priceStr = [@"Price: $" stringByAppendingString:self.itemForDetailView.convertedCurrentPrice];
    
    if ([self.itemForDetailView.shippingServiceCost isEqual:@"0.0"] || [self.itemForDetailView.shippingServiceCost isEqual:@""]) {
        self.priceLabel.text= [priceStr stringByAppendingString:@" (FREE Shipping)"];
    }else{
        NSString * shippingCost = [priceStr stringByAppendingString:[@" (+$" stringByAppendingString:self.itemForDetailView.shippingServiceCost]];
        self.priceLabel.text = [shippingCost stringByAppendingString:@" Shipping)"];
        
    }
    
    // Setup top rated icon
    if ([self.itemForDetailView.topRatedListing isEqual:@"true"]) {
        self.topRateIcon.image = [UIImage imageNamed:@"itemTopRated"];
    }

    
    NSURL *imageURL;
    
    if ([self.itemForDetailView.pictureURLSuperSize isEqual:@""]) {
        imageURL = [NSURL URLWithString:self.itemForDetailView.galleryURL];
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        UIImage *image = [UIImage imageWithData:imageData];
        [self setDetailImage:image withWidth:100 andHeight:100];
    }else{
        imageURL = [NSURL URLWithString:self.itemForDetailView.pictureURLSuperSize];
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        UIImage *image = [UIImage imageWithData:imageData];
        [self setDetailImage:image withWidth:200 andHeight:200];
    }
    
    
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.title = @"Item Details";
    
    [self.sellerInfoView setHidden:YES];
    [self.shippingInfoView setHidden:YES];
    
    self.categoryNameLabel.text = self.itemForDetailView.categoryName;
    self.conditionLabel.text = self.itemForDetailView.conditionDisplayName;
    self.buyingFormatLabel.text = self.itemForDetailView.listingType;
    
    self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView setContentSize:(CGSizeMake(320, 620))];
    
    self.buyNowButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.buyNowButton.layer.borderWidth = 1.0;
    self.buyNowButton.layer.cornerRadius = 5.0;
    
}



-(void)setDetailImage:(UIImage *)image withWidth:(NSInteger)width andHeight:(NSInteger)height{
    
    
    CGSize originalImageSize = image.size;
    
    CGRect newRect = CGRectMake(0, 0, width, height);
    
    float ratio = MAX(newRect.size.width/originalImageSize.width, newRect.size.height/originalImageSize.height);
    
    UIGraphicsBeginImageContextWithOptions(newRect.size,NO,0.0);
    
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:newRect cornerRadius:5.0];
    
    [path addClip];
    
    CGRect projectRect;
    projectRect.size.width = ratio * originalImageSize.width;
    projectRect.size.height = ratio * originalImageSize.height;
    projectRect.origin.x = (newRect.size.width - projectRect.size.width) / 2.0;
    projectRect.origin.y = (newRect.size.height - projectRect.size.height) / 2.0;
    
    [image drawInRect:projectRect];
    
    UIImage * smallImage = UIGraphicsGetImageFromCurrentImageContext();
    self.itemImageView.image  = smallImage;
    
    UIGraphicsEndImageContext();
    
    
    
}

- (IBAction)buyNowButton:(id)sender {
    
    WebViewController * vc = [WebViewController new];
    
    vc.strURL = self.itemForDetailView.viewitemURL;
    
    [self presentViewController:vc animated:YES completion:nil];
    
}

- (IBAction)segmentValueChanged:(UISegmentedControl*)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            
            self.basicInfoView.hidden = NO;
            self.sellerInfoView.hidden = YES;
            self.shippingInfoView.hidden = YES;
            
            break;
         
        case 1:
            
            self.userNameLabel.text = self.itemForDetailView.sellerUserName;
            self.feedbackScoreLabel.text = self.itemForDetailView.feedbackScore;
            self.positiveFeedbackLabel.text = self.itemForDetailView.positiveFeedbackPercent;
            self.feedbackRatingLabel.text = self.itemForDetailView.feedbackRatingStar;
            
            if ([self.itemForDetailView.topRatedSeller isEqual:@"true"]) {
                self.topRatedSellerIcon.image = [UIImage imageNamed:@"Check"];
            }else{
                self.topRatedSellerIcon.image = [UIImage imageNamed:@"Delete"];
            }
            
            if ([self.itemForDetailView.storeName isEqual:@""]) {
                self.storeLabel.text = @"N/A";
            }else{
                self.storeLabel.text = self.itemForDetailView.storeName;
            }
            
            
            self.basicInfoView.hidden = YES;
            self.sellerInfoView.hidden = NO;
            self.shippingInfoView.hidden = YES;
            
            break;
            
        case 2:
            
            self.shippingTypeLabel.text = self.itemForDetailView.shippingType;
            self.handlingTimeLabel.text = self.itemForDetailView.handlingTime;
            self.shippingLocationsLabel.text = self.itemForDetailView.shipToLocations;
            
            if ([self.itemForDetailView.expeditedShipping isEqual:@"true"]) {
                self.expeditedShippingIcon.image = [UIImage imageNamed:@"Check"];
            }else{
                self.expeditedShippingIcon.image = [UIImage imageNamed:@"Delete"];
            }
            
            if ([self.itemForDetailView.oneDayShippingAvailable isEqual:@"true"]) {
                self.OneDayShippingIcon.image = [UIImage imageNamed:@"Check"];
            }else{
                self.OneDayShippingIcon.image = [UIImage imageNamed:@"Delete"];
            }

            if ([self.itemForDetailView.returnAccepted isEqual:@"true"]) {
                self.returnAcceptedIcon.image = [UIImage imageNamed:@"Check"];
            }else{
                self.returnAcceptedIcon.image = [UIImage imageNamed:@"Delete"];
            }
            
            
            self.basicInfoView.hidden = YES;
            self.sellerInfoView.hidden = YES;
            self.shippingInfoView.hidden = NO;

        break;
            
        default:
            break;
    }
    
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



#pragma mark - Facebook SDK delegate
- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBSDKAppEvents activateApp];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                    didFinishLaunchingWithOptions:launchOptions];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}



-(void)sharer:(id<FBSDKSharing>)sharer didFailWithError:(NSError *)error{
    
    UIAlertView * av = [UIAlertView new];
    av.title = @"ERROR";
    av.message = error.description;
    [av addButtonWithTitle:@"OK"];
    [av show];
    
}

-(void)sharerDidCancel:(id<FBSDKSharing>)sharer{
    
    UIAlertView * av = [UIAlertView new];
    av.title = @"NOTICE";
    av.message = @"Post Canceled";
    [av addButtonWithTitle:@"OK"];
    [av show];
}


-(void)sharer:(id<FBSDKSharing>)sharer didCompleteWithResults:(NSDictionary *)results{
    
    UIAlertView * av = [UIAlertView new];
    av.title = @"NOTICE";
    av.message = @"Posted Successfully";
    [av addButtonWithTitle:@"OK"];
    [av show];

    
}



- (IBAction)shareToFacebook:(id)sender {
    
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    content.contentURL = [NSURL URLWithString:self.itemForDetailView.viewitemURL];
    content.contentTitle = self.itemForDetailView.title;
    
    content.contentDescription = [[self.priceLabel.text stringByAppendingString:@" Location:"] stringByAppendingString:self.locationLabel.text];
    content.imageURL = [NSURL URLWithString:self.itemForDetailView.galleryURL];
    

    [FBSDKShareDialog showFromViewController:self
                                 withContent:content
                                    delegate:self];
    
    
}









@end
