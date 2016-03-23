//
//  ESitemHolder.m
//  EbaySearch
//
//  Created by Pin-Chih on 2015/4/19.
//  Copyright (c) 2015年 Pin-Chih. All rights reserved.
//

#import "ESitemHolder.h"
#import "ESItem.h"


@interface ESitemHolder()


@property(nonatomic,strong) NSMutableArray * privateItems;


@end


@implementation ESitemHolder
@synthesize keyword = _keyword;

-(instancetype)init{
    
    return nil;
    
}



// secret initializer
-(instancetype)initPrivate{
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)removeAllItems{
    
    _privateItems = nil;
    _privateItems = [NSMutableArray new];
    
}

-(void)addNewItem:(ESItem *)newItem{
    
     [_privateItems addObject:newItem];
}


-(NSArray *)returnAllItems{
    
    return [_privateItems copy];
    
}


+(instancetype)shareData
{
    
    static ESitemHolder * holder;
    
    if (!holder) {
        holder = [[self alloc] initPrivate];
    }
    
    return holder;
}


@end
