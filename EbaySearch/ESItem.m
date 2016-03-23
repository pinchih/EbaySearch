//
//  ESItem.m
//  EbaySearch
//
//  Created by Pin-Chih on 2015/4/19.
//  Copyright (c) 2015年 Pin-Chih. All rights reserved.
//

#import "ESItem.h"

@implementation ESItem

@synthesize title,viewitemURL,galleryURL,pictureURLSuperSize,convertedCurrentPrice,shippingServiceCost,conditionDisplayName,listingType,location,categoryName,topRatedListing,sellerUserName,feedbackScore,positiveFeedbackPercent,feedbackRatingStar,topRatedSeller,storeName,storeURL,shippingType,shipToLocations,expeditedShipping,oneDayShippingAvailable,returnAccepted,handlingTime;


-(instancetype)initWithTitle:(NSString*)inputTitle
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
    andHandliingTime:(NSString*)inputHandlingTime{
    
    self = [super init];
    
    if (self) {
        
        title = inputTitle;
        viewitemURL = inputViewitemURL;
        galleryURL = inputGalleryURL;
        pictureURLSuperSize = inputPictureURL;
        convertedCurrentPrice = inputCurrentPrice;
        shippingServiceCost = inputShippingCost;
        conditionDisplayName = inputCondition;
        listingType = inputListingType;
        location = inputLocation;
        categoryName = inputCategoryName;
        topRatedListing = inputTopRatedListing;
        sellerUserName = inputSellerUserName;
        feedbackScore = inputFeedbackScore;
        positiveFeedbackPercent = inputFeedbackPercent;
        feedbackRatingStar = inputFeedbackRatingStar;
        topRatedSeller = inputTopRatedSeller;
        storeName = inputStoreName;
        storeURL = inputStoreURL;
        shippingType = inputShippingType;
        shipToLocations = inputShipToLocations;
        expeditedShipping = inputExpeditedShipping;
        oneDayShippingAvailable = inputOneDayShipping;
        returnAccepted = inputReturnAccepted;
        handlingTime = inputHandlingTime;
        
    }
    
    return self;
    
  
    
}






@end
