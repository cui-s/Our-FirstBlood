//
//  MyRect.m
//  tetst
//
//  Created by zhao-y on 2012/10/30.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import "MyRect.h"



@implementation MyRect


@synthesize pos;
@synthesize length;
@synthesize width;

- (id)init
{
    
    if(self == [super init]){
        pos = [[MyPoint alloc]init];
    }
    return self;
}

- (CGMutablePathRef)generatePath{
    CGMutablePathRef thePath=CGPathCreateMutable();
    CGPathMoveToPoint(thePath,NULL,pos.x,pos.y);
    CGPathAddLineToPoint(thePath, NULL, pos.x+width, pos.y);
    CGPathAddLineToPoint(thePath, NULL, pos.x+width, pos.y+length);
    CGPathAddLineToPoint(thePath, NULL, pos.x, pos.y+length);
    CGPathCloseSubpath(thePath);
    return thePath;
}

- (CGRect)generateRect{
    CGRect theRect;
    theRect.origin.x = pos.x;
    theRect.origin.y = pos.y;
    theRect.size.height = length;
    theRect.size.width = width;
    return theRect;
}

@end
