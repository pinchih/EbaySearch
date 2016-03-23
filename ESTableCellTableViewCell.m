//
//  ESTableCellTableViewCell.m
//  EbaySearch
//
//  Created by Pin-Chih on 2015/4/18.
//  Copyright (c) 2015年 Pin-Chih. All rights reserved.
//

#import "ESTableCellTableViewCell.h"

@implementation ESTableCellTableViewCell

- (void)awakeFromNib {
    
    self.itemTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    // Initialization code
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
}



-(void)setThumbnailImage:(UIImage *)image withWidth:(NSInteger)width andHeight:(NSInteger)height{
    
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
    self.itemImageView.image = smallImage;
    
    UIGraphicsEndImageContext();
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
