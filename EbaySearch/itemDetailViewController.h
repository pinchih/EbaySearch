//
//  itemDetailViewController.h
//  EbaySearch
//
//  Created by Pin-Chih on 2015/4/19.
//  Copyright (c) 2015年 Pin-Chih. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKShareKit/FBSDKSharing.h>

@class ESItem;

@interface itemDetailViewController : UIViewController<FBSDKSharingDelegate>

@property (strong,nonatomic) ESItem * itemForDetailView;
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UIImageView *topRateIcon;


-(void)setDetailImage:(UIImage*)image withWidth:(NSInteger)width andHeight:(NSInteger)height;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;

// Basic info
@property (weak, nonatomic) IBOutlet UILabel *categoryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *conditionLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyingFormatLabel;

// Seller Info
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *feedbackScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *positiveFeedbackLabel;
@property (weak, nonatomic) IBOutlet UILabel *feedbackRatingLabel;
@property (weak, nonatomic) IBOutlet UIImageView *topRatedSellerIcon;
@property (weak, nonatomic) IBOutlet UILabel *storeLabel;

// Shipping Info
@property (weak, nonatomic) IBOutlet UILabel *shippingTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *handlingTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *shippingLocationsLabel;
@property (weak, nonatomic) IBOutlet UIImageView *expeditedShippingIcon;
@property (weak, nonatomic) IBOutlet UIImageView *OneDayShippingIcon;
@property (weak, nonatomic) IBOutlet UIImageView *returnAcceptedIcon;

// Views for segentment control
@property (weak, nonatomic) IBOutlet UIView *basicInfoView;
@property (weak, nonatomic) IBOutlet UIView *sellerInfoView;
@property (weak, nonatomic) IBOutlet UIView *shippingInfoView;

@property (weak, nonatomic) IBOutlet UIButton *buyNowButton;



@end
