//
//  itemTableTableViewController.m
//  EbaySearch
//
//  Created by Pin-Chih on 2015/4/18.
//  Copyright (c) 2015年 Pin-Chih. All rights reserved.
//

#import "itemTableTableViewController.h"
#import "ESitemHolder.h"
#import "ESItem.h"
#import "ESTableCellTableViewCell.h"
#import "itemDetailViewController.h"

@interface itemTableTableViewController (){
    
    BOOL isNewItemsAdded;
    
}


@end

@implementation itemTableTableViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    isNewItemsAdded = false;
    
    self.tableView.delegate = self;

    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                   style:UIBarButtonItemStyleDone
                                                                  target:self
                                                                  action:nil];
    self.navigationItem.backBarButtonItem = barBtnItem;

    NSString * strForBarTitle = [@"Results for '" stringByAppendingString:[[ESitemHolder shareData]keyword]];
    
    self.navigationItem.title = [strForBarTitle stringByAppendingString:@"'"];
    
    UINib * nib = [UINib nibWithNibName:@"ESTableCellTableViewCell" bundle:nil];
    
    [self.tableView registerNib:nib forCellReuseIdentifier:@"ESTableCellTableViewCell"];
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    float f =  scrollView.contentOffset.y;

    if (f == 10.0f) {
        
        
        [self test];
        
        
    }
    
    
}

-(void)test{
    
    NSLog(@"New item added");
    
    isNewItemsAdded = false;
    
}
*/

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [[[ESitemHolder shareData] returnAllItems]count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    ESTableCellTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ESTableCellTableViewCell" forIndexPath:indexPath];
    
    NSArray * items = [[ESitemHolder shareData] returnAllItems];
    ESItem * item = items[indexPath.row];
    
    // Assign title for cell
    cell.itemTitleLabel.text = item.title;
    
    // Assign price for cell
    NSString * priceStr = [@"Price: $" stringByAppendingString:item.convertedCurrentPrice];
    
    if ([item.shippingServiceCost isEqual:@"0.0"] || [item.shippingServiceCost isEqual:@""]) {
        cell.priceLabel.text = [priceStr stringByAppendingString:@" (FREE Shipping)"];
    }else{
        NSString * shippingCost = [priceStr stringByAppendingString:[@" (+$" stringByAppendingString:item.shippingServiceCost]];
        cell.priceLabel.text = [shippingCost stringByAppendingString:@" Shipping)"];
        
    }
    
    
    NSURL *imageURL = [NSURL URLWithString:item.galleryURL];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage *image = [UIImage imageWithData:imageData];
    [cell setThumbnailImage:image withWidth:60 andHeight:60];
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    itemDetailViewController *detailViewController = [[itemDetailViewController alloc] init];
    
    // Pass the selected object to the new view controller.
    NSArray * items = [[ESitemHolder shareData] returnAllItems];
    ESItem * item = [ items objectAtIndex:indexPath.row];
    detailViewController.itemForDetailView = item;
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}



@end
