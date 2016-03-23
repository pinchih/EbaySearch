//
//  ViewController.h
//  EbaySearch
//
//  Created by Pin-Chih on 2015/4/13.
//  Copyright (c) 2015年 Pin-Chih. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "itemTableTableViewController.h"
#import "ESitemHolder.h"
#import "ESTextField.h"

@interface ViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>



@property (weak, nonatomic) IBOutlet ESTextField * keywordTextField;
@property (weak, nonatomic) IBOutlet ESTextField * priceFormTextField;
@property (weak, nonatomic) IBOutlet ESTextField * priceToTextField;
@property (weak, nonatomic) IBOutlet UIPickerView * sortByPicker;
@property (weak, nonatomic) IBOutlet UILabel * testLabel;
@property (weak, nonatomic) IBOutlet UILabel * errorMessageLabel;
@property (weak, nonatomic) IBOutlet UIButton * searchButton;

@property (weak, nonatomic) IBOutlet UIButton * clearButton;


-(NSString*)getUrlString;
-(BOOL)validateAllTextField;
-(void)performGetRequest;

@end

NSArray * dataarray;
NSMutableData * responseData;

