//
//  ESTableCellTableViewCell.h
//  EbaySearch
//
//  Created by Pin-Chih on 2015/4/18.
//  Copyright (c) 2015年 Pin-Chih. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESTableCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *itemTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

-(void)setThumbnailImage:(UIImage*)image withWidth:(NSInteger)width andHeight:(NSInteger)height;

@end
