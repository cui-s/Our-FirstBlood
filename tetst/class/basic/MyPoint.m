//
//  MyPoint.m
//  tetst
//
//  Created by zhao-y on 2012/10/30.
//  Copyright (c) 2012年 zhao-y. All rights reserved.
//

#import "MyPoint.h"

@implementation MyPoint

@synthesize x;
@synthesize y;

- (id)init
{
    
    if(self == [super init]){
        x = 0.0;
        y = 0.0;
    }
    return self;
}

@end
