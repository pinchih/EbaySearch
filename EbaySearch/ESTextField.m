//
//  ESTextField.m
//  EbaySearch
//
//  Created by Pin-Chih on 3/23/16.
//  Copyright © 2016 Pin-Chih. All rights reserved.
//

#import "ESTextField.h"

@implementation ESTextField


- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
    CGRect line = CGRectMake(0, self.frame.size.height - 2.0, self.bounds.size.width, 2);
    
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:line cornerRadius:2];
    
    CAShapeLayer * underLineLayer = [CAShapeLayer layer];
    
    underLineLayer.fillColor = [[UIColor alloc] initWithRed:0.895 green:0.693 blue:0.646 alpha:1.0].CGColor;
    
    underLineLayer.path = path.CGPath;
    
    [self.layer addSublayer:underLineLayer];
    
    
}

-(void)shake{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    [animation setDuration:0.05];
    [animation setRepeatCount:4];
    
    [animation setAutoreverses:YES];
    [animation setFromValue:[NSValue valueWithCGPoint:CGPointMake(self.center.x - 10.0f, self.center.y)]];
    
    [animation setToValue:[NSValue valueWithCGPoint:CGPointMake(self.center.x + 10.0f, self.center.y)]];
    
    [[self layer] addAnimation:animation forKey:@"position"];
    
}


@end
