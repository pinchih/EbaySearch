//
//  ESitemHolder.h
//  EbaySearch
//
//  Created by Pin-Chih on 2015/4/19.
//  Copyright (c) 2015年 Pin-Chih. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ESItem;

@interface ESitemHolder : NSObject


@property(nonatomic) NSString * keyword;

+(instancetype)shareData;
-(void)addNewItem:(ESItem*)newItem;
-(void)removeAllItems;
-(NSArray*)returnAllItems;

@end
