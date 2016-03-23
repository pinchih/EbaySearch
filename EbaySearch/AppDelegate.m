//
//  AppDelegate.m
//  EbaySearch
//
//  Created by Pin-Chih on 2015/4/13.
//  Copyright (c) 2015年 Pin-Chih. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    // Define the font and size for text in the segmentedController
    [[UISegmentedControl appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"AmericanTypewriter" size:14.0],NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    // Define navigation bar color
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x0080FF)];
    
    // Adding a shadow looking for the title in the bar
    NSShadow *shadow = [NSShadow new];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont fontWithName:@"HelveticaNeue-Thin" size:25.0], NSFontAttributeName, nil]];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    return YES;
}


@end
