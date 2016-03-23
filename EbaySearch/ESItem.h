//
//  ESItem.h
//  EbaySearch
//
//  Created by Pin-Chih on 2015/4/19.
//  Copyright (c) 2015年 Pin-Chih. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESItem : NSObject

// basicInfo
@property(copy,nonatomic) NSString * title;
@property(copy,nonatomic) NSString * viewitemURL;
@property(copy,nonatomic) NSString * galleryURL;
@property(copy,nonatomic) NSString * pictureURLSuperSize;
@property(copy,nonatomic) NSString * convertedCurrentPrice;
@property(copy,nonatomic) NSString * shippingServiceCost;
@property(copy,nonatomic) NSString * conditionDisplayName;
@property(copy,nonatomic) NSString * listingType;
@property(copy,nonatomic) NSString * location;
@property(copy,nonatomic) NSString * categoryName;
@property(copy,nonatomic) NSString * topRatedListing;

// sellerInfo
@property(copy,nonatomic) NSString * sellerUserName;
@property(copy,nonatomic) NSString * feedbackScore;
@property(copy,nonatomic) NSString * positiveFeedbackPercent;
@property(copy,nonatomic) NSString * feedbackRatingStar;
@property(copy,nonatomic) NSString * topRatedSeller;
@property(copy,nonatomic) NSString * storeName;
@property(copy,nonatomic) NSString * storeURL;

// shippingInfo
@property(copy,nonatomic) NSString * shippingType;
@property(copy,nonatomic) NSString * shipToLocations;
@property(copy,nonatomic) NSString * expeditedShipping;
@property(copy,nonatomic) NSString * oneDayShippingAvailable;
@property(copy,nonatomic) NSString * returnAccepted;
@property(copy,nonatomic) NSString * handlingTime;


-(id)initWithTitle:(NSString*)inputTitle
      andViewItemURL:(NSString*)inputViewitemURL
       andGalleryURL:(NSString*)inputGalleryURL
       andPictureURL:(NSString*)inputPictureURL
            andPrice:(NSString*)inputCurrentPrice
     andShippingCost:(NSString*)inputShippingCost
        andCondition:(NSString*)inputCondition
      andListingType:(NSString*)inputListingType
         andLocation:(NSString*)inputLocation
     andCategoryName:(NSString*)inputCategoryName
  andTopRatedListing:(NSString*)inputTopRatedListing
   andSellerUserName:(NSString*)inputSellerUserName
    andFeedbackScore:(NSString*)inputFeedbackScore
  andFeedbackPercent:(NSString*)inputFeedbackPercent
andFeedbackRateingStar:(NSString*)inputFeedbackRatingStar
   andTopRatedSeller:(NSString*)inputTopRatedSeller
        andStoreName:(NSString*)inputStoreName
         andStoreURL:(NSString*)inputStoreURL
     andShippingType:(NSString*)inputShippingType
  andShipToLocations:(NSString*)inputShipToLocations
andExpeditedShipping:(NSString*)inputExpeditedShipping
   andOneDayShipping:(NSString*)inputOneDayShipping
   andReturnAccepted:(NSString*)inputReturnAccepted
    andHandliingTime:(NSString*)inputHandlingTime;

@end
