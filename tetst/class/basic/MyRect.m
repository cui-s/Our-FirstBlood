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
    CGPathAddLineToPoint(thePath, NULL, pos.x+length, pos.y);
    CGPathAddLineToPoint(thePath, NULL, pos.x+length, pos.y+width);
    CGPathAddLineToPoint(thePath, NULL, pos.x, pos.y+width);
    CGPathCloseSubpath(thePath);
    return thePath;
}

@end
