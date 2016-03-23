//
//  ViewController.m
//  EbaySearch
//
//  Created by Pin-Chih on 2015/4/13.
//  Copyright (c) 2015年 Pin-Chih. All rights reserved.
//



#import "ViewController.h"
#import "ESItem.h"
#import "ESitemHolder.h"

@interface ViewController (){
    
    dispatch_queue_t queueForHttpResuest;
    
}

@property (strong, nonatomic) NSMutableArray * myItems;
@property (strong, nonatomic) NSDictionary * allItems;


@end


@implementation ViewController


#pragma mark - viewController config.

- (void)viewDidLoad {
    
    // Set all textfield delegate to view controller
    self.keywordTextField.delegate = self;
    self.priceToTextField.delegate = self;
    self.priceFormTextField.delegate = self;
    
    /*
    // Adding border to buttons
    self.searchButton.layer.borderWidth = 1.0;
    self.searchButton.layer.cornerRadius = 5.0;
    self.searchButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.clearButton.layer.borderWidth = 1.0;
    self.clearButton.layer.cornerRadius = 5.0;
    self.clearButton.layer.borderColor = [UIColor blueColor].CGColor;
    */
    
    // Setup gesture for dismiss the keyboard
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    // Assign data for UIPickerView
    dataarray = [[NSArray alloc]initWithObjects:@"Best Match"
                                                ,@"Price: highest first"
                                                ,@"Price + Shipping: highest first"
                                                ,@"Price + Shipping: lowest first"
                                                ,nil];
    
    // Set UIPickerView delegate to view controller
    self.sortByPicker.delegate = self;
    self.sortByPicker.dataSource = self;
    
    // Make the text next to the go back arrow in the navigation bar invisable
    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                   style:UIBarButtonItemStyleDone
                                                                  target:self
                                                                  action:nil];
    self.navigationItem.backBarButtonItem = barBtnItem;
    
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - pickerview delegate
// Set the text label in pickerView to the desired font and size
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{

    UILabel* tView = (UILabel*)view;
    if (!tView){
        
        tView = [[UILabel alloc] init];
        
        tView.font = [UIFont fontWithName:@"HelveticaNeue-Thin"
                                     size:20.0];
        
        tView.textAlignment = NSTextAlignmentCenter;
    }
    
    tView.text = [dataarray objectAtIndex:row];
 
    return tView;
}


#pragma mark - picker view config.
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return [dataarray count];
    
}


#pragma mark - self-defined methods
-(void)performGetRequest{
    
    // Perform HTTP get
    
    NSString *urlString = [self getUrlString];
    NSURL *searchResults = [NSURL URLWithString:urlString];
    NSData * Data = [NSData dataWithContentsOfURL:searchResults];
    
    NSDictionary * json  = [NSJSONSerialization JSONObjectWithData:Data options:0 error:nil];
    
    // if nothing returned
    if ([json count] == 1) {
        
        self.errorMessageLabel.alpha = 1;
        self.errorMessageLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.errorMessageLabel.text = @"No Results Found";
        self.errorMessageLabel.font = [UIFont fontWithName:@"AmericanTypewriter" size:25.0];
        [UIView animateWithDuration:2.5 delay:0 options:UIViewAnimationOptionCurveEaseIn
                         animations:^{ self.errorMessageLabel.alpha = 0;}
                         completion:nil];
        
        
        return;
    }
    
    
    // Parse items
    for (int i=0; i<5; i++) {
        NSString * itemString = [@"item" stringByAppendingString:@(i).stringValue];
        NSDictionary * basicInfo = [[json objectForKey:itemString] objectForKey:@"basicInfo"];
        NSDictionary * sellerInfo = [[json objectForKey:itemString] objectForKey:@"sellerInfo"];
        NSDictionary * shippingInfo = [[json objectForKey:itemString] objectForKey:@"shippingInfo"];
        
        
        ESItem * newItem = [[ESItem alloc] initWithTitle:[basicInfo valueForKey:@"title"]
                                          andViewItemURL:[basicInfo valueForKey:@"viewItemURL"]
                                           andGalleryURL:[basicInfo valueForKey:@"galleryURL"]
                                           andPictureURL:[basicInfo valueForKey:@"pictureURLSuperSize"]
                                                andPrice:[basicInfo valueForKey:@"convertedCurrentPrice"]
                                         andShippingCost:[basicInfo valueForKey:@"shippingServiceCost"]
                                            andCondition:[basicInfo valueForKey:@"conditionDisplayName"]
                                          andListingType:[basicInfo valueForKey:@"listingType"]
                                             andLocation:[basicInfo valueForKey:@"location"]
                                         andCategoryName:[basicInfo valueForKey:@"categoryName"]
                                      andTopRatedListing:[basicInfo valueForKey:@"topRatedListing"]
                                       andSellerUserName:[sellerInfo valueForKey:@"sellerUserName"]
                                        andFeedbackScore:[sellerInfo valueForKey:@"feedbackScore"]
                                      andFeedbackPercent:[sellerInfo valueForKey:@"positiveFeedbackPercent"]
                                  andFeedbackRateingStar:[sellerInfo valueForKey:@"feedbackRatingStar"]
                                       andTopRatedSeller:[sellerInfo valueForKey:@"topRatedSeller"]
                                            andStoreName:[sellerInfo valueForKey:@"storeName"]
                                             andStoreURL:[sellerInfo valueForKey:@"storeURL"]
                                         andShippingType:[shippingInfo valueForKey:@"shippingType"]
                                      andShipToLocations:[shippingInfo valueForKey:@"shipToLocations"]
                                    andExpeditedShipping:[shippingInfo valueForKey:@"expeditedShipping"]
                                       andOneDayShipping:[shippingInfo valueForKey:@"oneDayShippingAvailable"]
                                       andReturnAccepted:[shippingInfo valueForKey:@"returnsAccepted"]
                                        andHandliingTime:[shippingInfo valueForKey:@"handlingTime"]];
        
        [[ESitemHolder shareData] addNewItem:newItem];
        
    }
    
    // Push to the table view on the main thread
    dispatch_async(dispatch_get_main_queue(), ^{[self performSegueWithIdentifier:@"toTableView" sender:self];});
    
    
}


// if pass the validation, return YES, otherwise return NO
-(BOOL)validateAllTextField{
    
    BOOL result = YES;
    BOOL bothPriceFromAndToAreEmpty = NO;
    BOOL oneOfPriceFromOrToIsEmpty = NO;
    
    if ([self.priceToTextField.text  isEqual: @""] && [self.priceFormTextField.text  isEqual: @""]) {
        bothPriceFromAndToAreEmpty = YES;
    }
    
    if ([self.priceToTextField.text  isEqual: @""] | [self.priceFormTextField.text  isEqual: @""]) {
        oneOfPriceFromOrToIsEmpty = YES;
    }
    
    NSRegularExpression * regex = [[NSRegularExpression alloc] initWithPattern:@"^\\d+\\.?\\d+$" options:0 error:nil];
    NSArray * resultForPriceFrom =[regex matchesInString:self.priceFormTextField.text options:0 range:NSMakeRange(0, [self.priceFormTextField.text length])];
    
    NSArray * resultForPriceTo =[regex matchesInString:self.priceToTextField.text options:0 range:NSMakeRange(0, [self.priceToTextField.text length])];

    
    if ([self.keywordTextField.text  isEqual: @""]) {
        
        [self.keywordTextField shake];
        
        self.errorMessageLabel.alpha = 1;
        self.errorMessageLabel.text = @"Please enter keyword";
        self.errorMessageLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0];
        [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveEaseIn
                         animations:^{ self.errorMessageLabel.alpha = 0;}
                         completion:nil];
        
        result = NO;
        
    }else if ([resultForPriceTo count] == 0 && [resultForPriceFrom count] == 0 && !bothPriceFromAndToAreEmpty) {
        
        self.errorMessageLabel.alpha = 1;
        self.errorMessageLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.errorMessageLabel.text = @"Price range must be a positive integer or decimal number";
        self.errorMessageLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0];
        [UIView animateWithDuration:2.5 delay:0 options:UIViewAnimationOptionCurveEaseIn
                         animations:^{ self.errorMessageLabel.alpha = 0;}
                         completion:nil];
        
        result = NO;
        
    }else if ( self.priceFormTextField.text.floatValue > self.priceToTextField.text.floatValue && !oneOfPriceFromOrToIsEmpty){
        
        [self.priceFormTextField shake];
        [self.priceToTextField shake];

        self.errorMessageLabel.alpha = 1;
        self.errorMessageLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.errorMessageLabel.text = @"Price To must not be less than Price From";
        self.errorMessageLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0];
        [UIView animateWithDuration:2.5 delay:0 options:UIViewAnimationOptionCurveEaseIn
                         animations:^{ self.errorMessageLabel.alpha = 0;}
                         completion:nil];
        result = NO;
        
    }

    return result;
    
}

-(void)dismissKeyboard {
    [self.keywordTextField resignFirstResponder];
    [self.priceFormTextField resignFirstResponder];
    [self.priceToTextField resignFirstResponder];
}

- (IBAction)clearButton:(id)sender {
    
    self.keywordTextField.text = @"";
    self.priceToTextField.text = @"";
    self.priceFormTextField.text = @"";
    [self.sortByPicker selectRow:0 inComponent:0 animated:YES];
}

-(NSString*)getUrlString{
    
    NSString * URL = @"http://www.ebaysearchhw8.elasticbeanstalk.com/HW8.php?";
    
    NSString * keyworkd = self.keywordTextField.text;
    
    // Adding keyword to url
    URL = [URL stringByAppendingString:@"keyword="];
    URL = [URL stringByAppendingString:[keyworkd stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    // Pass keyword to itemholder for later use
    [[ESitemHolder shareData] setKeyword:self.keywordTextField.text];
    
    // Adding price range form to url
    if (![self.priceFormTextField.text  isEqual: @""]) {
        URL = [URL stringByAppendingString:@"&priceRangeFrom="];
        URL = [URL stringByAppendingString:self.priceFormTextField.text];
    }
    
    // Adding price range to to url
    if (![self.priceToTextField.text  isEqual: @""]) {
        URL = [URL stringByAppendingString:@"&priceRangeTo="];
        URL = [URL stringByAppendingString:self.priceToTextField.text];
    }
    
    // Adding sort by to url
    
    int index = (int)[self.sortByPicker selectedRowInComponent:0];
    NSString * sortByString;
    
    switch (index) {
        case 0:
            sortByString = @"BestMatch";
            break;
        case 1:
            sortByString = @"CurrentPriceHighest";
            break;
        case 2:
            sortByString = @"PricePlusShippingHighest";
            break;
        case 3:
            sortByString = @"PricePlusShippingLowest";
            break;
        default:
            break;
    }
    
    URL = [URL stringByAppendingString:@"&sortBy="];
    URL = [URL stringByAppendingString:sortByString];
    URL = [URL stringByAppendingString:@"&resultsPerPage=5"];
    
    return URL;

}

#pragma mark - buttons config.

- (IBAction)searchButton:(id)sender {
    
    if (!queueForHttpResuest) {
        queueForHttpResuest = dispatch_queue_create("com.pinchih.gcd", NULL);
    }
    
    
    if ([self validateAllTextField]){
    
        if ([[[ESitemHolder shareData]returnAllItems]count] >0) {
            [[ESitemHolder shareData] removeAllItems];
        }
        
    // Perform HTTP get and assign it to another thread
    dispatch_async(queueForHttpResuest, ^{[self performGetRequest];});


    }
        
}



@end
